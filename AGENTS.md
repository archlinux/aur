# Agent Rules for sing-box-cagedbird-bin

## Project Overview
This repository contains the PKGBUILD and AUR build configuration files for maintaining the `sing-box-cagedbird-bin` package.

## Entry Point & Router
For all AUR package release operations and verification checklists, refer to:
- **[README.md](README.md#agent-native-skills)**

## Critical Rules & Guardrails
1. **Source of Truth**: The GitHub Release of `cagedbird043/sing-box` is the binary source of truth. The AUR repository is a thin wrapper.
2. **Never commit build artifacts**: Do NOT commit downloaded source tarballs, build folders (`src/`, `pkg/`), or generated package packages (`*.pkg.tar.zst`) to the git repository.
3. **Synchronize metadata**: Every `PKGBUILD` change must be followed by updating the `.SRCINFO` file.

## Verification
- Local build checks must be done via:
  ```bash
  makepkg --verifysource
  makepkg -f --cleanbuild --noconfirm
  ```
