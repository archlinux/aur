# gimp-openvino

PKGBUILD wrapping Intel's upstream OpenVINO AI plugins for GIMP 3.0.
Plugin source: https://github.com/intel/openvino-ai-plugins-gimp

## Build & Validate
- `makepkg -si` — build and install
- `makepkg` — build only
- `namcap PKGBUILD` — validate PKGBUILD
- `makepkg --printsrcinfo > .SRCINFO` — regenerate `.SRCINFO` (must be done manually after PKGBUILD changes; it drifts easily)

## Key quirks
- `pkgname=gimp-openvino` (same as `pkgbase`) — the old AGENTS.md claimed `pkgname=gimp-openvino-ai-plugins`; that was wrong.
- `build()` is a no-op (`:`); all work happens in `package()`.
- No venv — `PIP_REQUIRE_VIRTUALENV=0` bypasses pip's venv enforcement.
- `2>/dev/null || true` silences errors from pip-only deps (`gdown`, `peft`, `controlnet-aux`, `openvino-genai`, `tomesd`); their deps satisfied by `depends=()`.
- Config `weight_path` is patched after `complete_install()` — it points to `$pkgdir/...` at build time and must be rewritten to the runtime path.
- Models dir is `chmod a+w` after install so plugins can write cache files at runtime.
- `pkgver()` auto-generates from git tags (`r<commit-count>.<short-hash>`); the static `pkgver=` line is a fallback.
- Wrapper script `openvino-ai-gimp` sets `GI_TYPELIB_PATH` and `LD_LIBRARY_PATH`, then runs `gimp-3`.
- Plugins are copied from `$site_packages/gimpopenvino/plugins/*` to `/usr/lib/gimp/3.0/plug-ins/`.
- `.SRCINFO` is often stale — always regenerate after touching PKGBUILD.
- `AGENTS.md` is `.gitignore`d (AUR doesn't allow it); it won't be pushed.

