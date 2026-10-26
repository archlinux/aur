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
- `pkgver()` reads `libtorch/build-version` from the extracted archive (`2.12.0+rocm7.2` → `2.12.0`):
  - missing file → returns the pinned `$pkgver` (never empty — an empty value aborted the 2026-10-19 build)
  - value ≠ `$pkgver` → prints an error and fails, because `source=()` is expanded from the static `$pkgver` *before* `pkgver()` runs; echoing the archive value would relabel binaries and `provides=libtorch=<wrong>`
- **Never** scrape `api.github.com` here: anonymous 60 req/h returned 403 → empty pkgver, and it reported the newest release rather than the one `source=()` pinned
- `pkgver`, `_rocm_ver` and both `sha256sums` are one unit — change them in the same commit
- Bump `pkgrel` on non-version changes (patches, recipe fixes, an upstream re-push that changes the zip hash)

## Checksums

Upstream publishes **no** checksum sidecars for the libtorch zips: the directory listing is browsable but `*.sha256`, `*.sha1`, `*.md5` and `SHA256SUMS` all return 403, the R2 mirror 404s, and the GitHub release only has source tarballs (`pytorch-v2.12.0.tar.gz`, `torch-2.12.0.tar.gz`). R2's ETag is a multipart etag, not an MD5.

So the sums are hashes of the verified download, not upstream claims. Refreshing one:

```bash
curl -L -C - -o 'libtorch-shared-with-deps-${pkgver}+rocm${_rocm_ver}.zip' \
  "https://download.pytorch.org/libtorch/rocm${_rocm_ver}/libtorch-shared-with-deps-${pkgver}%2Brocm${_rocm_ver}.zip"
curl -sIL "<same url>" | awk 'tolower($1)=="content-length:"{v=$2} END{print v}'   # must equal stat -c %s
sha256sum "libtorch-shared-with-deps-${pkgver}+rocm${_rocm_ver}.zip"
```

Do not "fix" a failing sum by going back to `SKIP`: without a sum, nothing detects a truncated or silently replaced 5.7 GiB download.

## ROCm version: pinned, not probed

`_rocm_ver=7.2` is a hard pin. The sums are for that exact artifact, so the ROCm version must not vary per host — an earlier `_detect_rocm_ver()` that preferred the system `rocm-core` would have hashed one artifact and downloaded another (and it was expanded before `pkgver` was set, so its probe URLs all 404'd and silently fell back to 7.1).

The pin is matched by `depends=('rocm-core>=7.2')`: libtorch links the ROCm runtime it was built against, and a mismatched runtime fails at `dlopen()` with an undefined HIP symbol (surfacing as a generic module-load failure in consumers like `audacity-openvino`). When bumping:

1. Check the version exists upstream: `curl -sIL https://download.pytorch.org/libtorch/rocm<ver>/libtorch-shared-with-deps-<pkgver>%2Brocm<ver>.zip`
2. Update `_rocm_ver`, the `rocm-core>=` bound, and both sums
3. Regenerate `.SRCINFO`

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
