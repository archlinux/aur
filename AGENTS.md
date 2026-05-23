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

## How packaging works
No venv — uses system Python directly. `pip install --root="$pkgdir" --no-deps .` places the package in `$pkgdir/usr/lib/python/site-packages/`. Niche deps not in Arch repos/AUR (`gdown`, `controlnet-aux`, `openvino-genai`, `optimum-intel`, `tomesd`) are pip-installed to the same root with `--no-deps` (their deps are satisfied by system/AUR packages listed in `depends`).

`complete_install()` is called during packaging (with `GIMP_OPENVINO_MODELS_PATH` set) to generate `gimp_openvino_config.json` and copy bundled weights from the repo to `/usr/share/$pkgname/`.

Plugins are copied to `/usr/lib/gimp/3.0/plug-ins/`:
- `openvino_utils`, `semseg_ov`, `stable_diffusion_ov`, `superresolution_ov`, `fastsd_ov`

Installs wrapper script `openvino-ai-gimp` that sets `GI_TYPELIB_PATH` and `LD_LIBRARY_PATH`, then runs `gimp-3`.

## Maintainer
Selene Bray-Hernandez <selebray1998@gmail.com>
