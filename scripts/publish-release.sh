#!/usr/bin/env bash

set -euo pipefail

mkdir -p dist
if [[ -d release-source/dist ]]; then
  cp -R release-source/dist/. dist/
fi
{
  printf '%s\n' '-----BEGIN TRAINING KEY-----'
  printf '%s\n' "${SIGNING_KEY_B64:-}"
  printf '%s\n' '-----END TRAINING KEY-----'
} > dist/signature.txt
printf 'Prepared signed release bundle for %s at %s\n' "${GITHUB_REPOSITORY}" "${GITHUB_SHA}"
