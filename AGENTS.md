# gimp-openvino-ai-plugins

PKGBUILD wrapping Intel's upstream OpenVINO AI plugins for GIMP 3.0.
All plugin source lives at: https://github.com/intel/openvino-ai-plugins-gimp

## Build & Validate
- `makepkg -si` — build and install (standard Arch workflow)
- `makepkg` — build only (without `-i`)
- `namcap PKGBUILD` — validate PKGBUILD

`pkgver()` auto-generates version from git history (`r<commit-count>.<short-hash>`).

## Dependencies
- **Runtime:** gimp, python, openvino-models, python-openvino + Python ML stack
- **Build:** git, python-pip
- **Optional:** intel-compute-runtime (GPU), intel-npu-driver (NPU)

## Key quirks
- `pkgbase=gimp-openvino` (AUR repo name) differs from `pkgname=gimp-openvino-ai-plugins` — do not change.
- `build()` is a no-op (`:`); all work happens in `package()`.
- `PIP_REQUIRE_VIRTUALENV=0` bypasses pip's venv enforcement (no venv used).
- `2>/dev/null || true` silences errors from niche pip-only deps; their deps are satisfied by system packages in `depends=()`.

## How packaging works
No venv — uses system Python. `pip install --root="$pkgdir" --prefix=/usr --no-deps .` installs the package; niche deps (`gdown`, `controlnet-aux`, `openvino-genai`, `optimum-intel`, `tomesd`) are installed the same way.

`complete_install()` (with `GIMP_OPENVINO_MODELS_PATH` set) generates `gimp_openvino_config.json` and copies bundled weights to `/usr/share/$pkgname/`.

Plugins are copied from `$site_packages/gimpopenvino/plugins/*` to `/usr/lib/gimp/3.0/plug-ins/`. Installs wrapper script `openvino-ai-gimp` that sets `GI_TYPELIB_PATH` and `LD_LIBRARY_PATH`, then runs `gimp-3`.

## Maintainer
Selene Bray-Hernandez <selebray1998@gmail.com>
