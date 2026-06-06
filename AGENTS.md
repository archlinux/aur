# libtorch-rocm — AUR package

Pre-built PyTorch C++ libtorch binaries with ROCm, installed to `/opt/libtorch`.

> **After any `PKGBUILD` edit, regenerate the AUR index file:**
> ```bash
> makepkg --printsrcinfo > .SRCINFO
> ```
> AUR helpers (paru, yay) read `.SRCINFO`, not `PKGBUILD`. Forgetting this step is the #1 reason a push doesn't go live.

## Files

| File | Purpose |
|---|---|
| `PKGBUILD` | Build recipe — single source of truth |
| `.SRCINFO` | AUR metadata; **regenerate after any PKGBUILD change** with `makepkg --printsrcinfo > .SRCINFO` |
| `CHANGELOG` | Package history — append an entry for every release |
| `LICENSE-MIT` | This package's own license |
| `LICENSE-PYTORCH` | Intentionally empty; the real PyTorch license is fetched from the upstream tag at build time |

## Build

```bash
makepkg --printsrcinfo > .SRCINFO   # after any PKGBUILD change
bash -n PKGBUILD
makepkg -f                          # build only
paru -U --chroot                    # clean chroot build
```

## Versioning

- Static `pkgver=2.12.0` is the committed/released version (what `.SRCINFO` ships to the AUR index)
- `pkgver()` fetches the latest PyTorch release tag from the GitHub API; makepkg calls it at build time and it overrides the static value
- Bump `pkgrel` on non-version changes (patches, recipe fixes); do **not** try to "fix" `sha256sums=('SKIP' ...)` — the pre-built binary is trusted as-is

## ROCm version auto-detection

`_detect_rocm_ver()` probes pytorch.org for a matching pre-built binary:

1. Tries the system's installed `rocm-core` version first
2. Falls back through `7.2`, `7.1`, `6.2`, `6.1`, `6.0` (hardcoded)
3. Final fallback: `7.1`
4. The probe URL is `https://download.pytorch.org/libtorch/rocm$v/libtorch-shared-with-deps-${pkgver}%2Brocm$v.zip`
5. If no version matches, the build errors on download — you may need to update the fallback list

## Install path: `/opt/libtorch`

Installs to `/opt/libtorch`, **not** `/opt/libtorch-rocm`. The package also:

- `provides=("libtorch=${pkgver}")` — downstream packages (e.g. `audacity-openvino`) depend on the virtual `libtorch` and resolve to this package
- `conflicts=(libtorch)` — refuses to coexist with the official non-ROCm libtorch
- `replaces=(libtorch-cxx11abi-rocm)` — supersedes the old name

Consumers should match on `/opt/libtorch`, not the package name.

## Patches in `prepare()`

1. **Bundled pybind11 removed** — system `pybind11` used instead
2. **ELF alignment fix** — patches zero-length LOAD segments in `libtorch_cpu.so`. Without this, glibc rejects `dlopen()` with "ELF load command address/offset not page-aligned" (often surfaced to users as misleading "Inappropriate ioctl for device" via stale `errno`)
3. **rocshmem suppressed** — comments out the optional `find_package(rocshmem)` in `LoadHIP.cmake` to silence a CMake warning in downstream builds. rocSHMEM is AMD's intra-kernel OpenSHMEM networking library for multi-node ROCm HPC; it's not packaged on Arch and almost no libtorch consumer needs it (only MI250X/MI300X/MI350X + specific NICs). The find_package is **not** `REQUIRED`, so libtorch works fine without it — the patch is cosmetic. Do not "fix" this by trying to package rocshmem here; it belongs in its own AUR package if anyone needs it.

## Options

`!debug !strip !libtool !staticlibs !zipman` — preserves debug symbols in the pre-built binary, avoids repackaging overhead.
