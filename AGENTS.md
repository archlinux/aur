# libtorch-rocm — AUR package

Arch Linux PKGBUILD that packages the PyTorch C++ distribution (libtorch) with ROCm support.

## Structure

- `PKGBUILD` — build recipe. Single source of truth.
- `.SRCINFO` — AUR metadata, auto-generated from `PKGBUILD`.

## Versioning

The `pkgver()` function fetches the latest PyTorch release tag from the GitHub API at build time — no manual version bumps needed. The ROCm version (`_rocm_ver`) is detected from the installed `rocm-core` system package, then probed against PyTorch's download server to verify a binary exists for that combination — falls back through known versions if needed.

Checksums are `SKIP` because the source binary changes with each version.

## Key details

- `prepare()` removes bundled `pybind11` headers — the package depends on system `pybind11`.
- `makedepends` includes `curl` (used by `pkgver()`) and `rocm-core` (version detection; also a runtime dependency).
- Conflicts with `libtorch` (CPU/CUDA variant); replaces `libtorch-cxx11abi-rocm`.
- Installs to `/opt/libtorch`.
- Regenerate `.SRCINFO` before submitting to AUR:
  ```
  makepkg --printsrcinfo > .SRCINFO
  ```
- No tests, no CI, no linters.
