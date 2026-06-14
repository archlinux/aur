# gimp-openvino — AUR package

PKGBUILD wrapping Intel's upstream OpenVINO AI plugins for GIMP 3.0.
Plugin source: https://github.com/intel/openvino-ai-plugins-gimp

> **`.gitignore` excludes `AGENTS.md`** — this file is for opencode only and won't be in the AUR tarball.

## Build workflow

**Critical**: Always use clean chroot builds (`paru -U --chroot`) to avoid polluting host with AUR deps.

```bash
# Clean chroot build (recommended)
paru -U --chroot

# Regenerate .SRCINFO after any PKGBUILD change
makepkg --printsrcinfo > .SRCINFO

# Quick syntax/validation check
bash -n PKGBUILD && namcap PKGBUILD

# Build only (no install) — requires deps pre-installed
makepkg -f
```

**WARNING**: `makepkg -si` will fail because AUR deps (`gdown`, `peft`, `controlnet-aux`, `openvino-genai`, `tomesd`) aren't in official repos. Always use clean chroot or pre-install deps.

## Key quirks

- **`pkgname=gimp-openvino`** (same as `pkgbase`).
- **`build()` is a no-op (`:`)**; all work happens in `package()`.
- **No venv** — `PIP_REQUIRE_VIRTUALENV=0` bypasses pip's venv enforcement.
- **`2>/dev/null || true`** silences errors from pip-only deps (`gdown`, `peft`, `controlnet-aux`, `openvino-genai`, `tomesd`); their deps satisfied by `depends=()`.
- **Config `weight_path`** is patched after `complete_install()` — it points to `$pkgdir/...` at build time and must be rewritten to the runtime path.
- **Models dir** is `chmod a+w` after install so plugins can write cache files at runtime.
- **`pkgver()`** auto-generates from git tags (`r<commit-count>.<short-hash>`); the static `pkgver=` line is a fallback.
- **Wrapper script `openvino-ai-gimp`** sets `GI_TYPELIB_PATH` and `LD_LIBRARY_PATH`, then runs `gimp-3`.
- **Plugins** are copied from `$site_packages/gimpopenvino/plugins/*` to `/usr/lib/gimp/3.0/plug-ins/`.
- **`.SRCINFO`** is often stale — always regenerate after touching PKGBUILD.

## Package structure

| File | Purpose |
|-----|---|
| `PKGBUILD` | Build recipe — the single source of truth |
| `.SRCINFO` | AUR metadata; **must be regenerated** after PKGBUILD changes |
| `openvino-ai-gimp` | Wrapper script (sets `GI_TYPELIB_PATH` and `LD_LIBRARY_PATH` for GIMP) |
| `LICENSE` | Package license |
| `Docs/` | Documentation (if present) |

## Dependencies

**makedepends**: git python-pip

**depends**:
- gimp
- python
- openvino
- python-numpy
- python-requests
- python-opencv
- python-transformers
- python-diffusers
- python-psutil
- python-sentencepiece
- python-pydantic
- python-timm

**optdepends**:
- intel-compute-runtime: Intel GPU acceleration for OpenVINO
- intel-npu-driver: NPU acceleration support
- openvino-intel-gpu-plugin: Intel GPU plugin for OpenVINO

**AUR deps** (not in official repos):
- gdown
- peft
- controlnet-aux
- openvino-genai
- tomesd

## Versioning

- Auto-tracks latest commit via `pkgver()` in `PKGBUILD`
- Override by setting `pkgver` explicitly
- Increment `pkgrel` on any non-version change (patch, dep, etc.)

## Adding additional models

The package includes core models in `/usr/share/gimp-openvino/`. For additional models (e.g., from Hugging Face or other sources), create a user directory and symlink it:

```bash
# Create user models directory (package creates this automatically)
mkdir -p ~/.local/share/gimp-openvino/models

# Add additional model subdirectories (e.g., from Hugging Face)
# Example: download Whisper large-v3 from Hugging Face
# wget -P ~/.local/share/gimp-openvino/models https://huggingface.co/openvinotoolkit/whisper.cpp/resolve/main/models/ggml-large-v3.bin

# Symlink user directory to system directory (read-only access)
sudo ln -sfn ~/.local/share/gimp-openvino/models /usr/share/gimp-openvino/user-models

# Make symlink writable for GIMP to write cache files
sudo chmod a+w /usr/share/gimp-openvino/user-models
```

This allows you to:
- Add custom models without modifying the package
- Keep user models separate from system models
- Update models independently
- Share models across different installations

**Note**: The package automatically creates the `/usr/share/gimp-openvino/user-models` directory on install/upgrade. You only need to create your user directory and symlink it.

The `openvino-ai-gimp` wrapper script will automatically create the symlink for you on first run.

## Important constraints

- **Models are downloaded to `$pkgdir/usr/share/gimp-openvino/` during build (system root), which is problematic for user software**
- **Solution**: Modified PKGBUILD to download models to user directory (`~/.local/share/gimp-openvino/`) instead of system root
- **GPU acceleration requires additional drivers** (Intel compute runtime, NVIDIA CUDA, or AMD ROCm)
- **Package depends on system packages for Python and OpenVINO runtime**
- **Build process installs pip-only dependencies to `$pkgdir` root to avoid system conflicts**
- **Plugins are installed to `/usr/lib/gimp/3.0/plug-ins/` with subdirectories: `openvino_utils`, `semseg_ov`, `stable_diffusion_ov`, `superresolution_ov`, `fastsd_ov`**
- **Config file at `$site_packages/gimpopenvino/plugins/openvino_utils/tools/gimp_openvino_config.json` has `weight_path` patched to use runtime path**
- **Plugin source is cloned from git and built in-place during package installation**
- **Wrapper script `openvino-ai-gimp` automatically creates user models directory and symlink on first run**

