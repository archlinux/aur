# Maintainer: Seann <you@example.com>

pkgname=f5-tts-rocm
_pkgname=f5-tts
pkgver=1.1.20
pkgrel=7
pkgdesc='F5-TTS text-to-speech CLI and Gradio tools with bundled ROCm PyTorch'
arch=('x86_64')
url='https://github.com/SWivid/F5-TTS'
license=('MIT')
provides=('f5-tts')
conflicts=('f5-tts')
options=('!debug' '!strip')

depends=(
  'python'
  'python-pip'
  'python-virtualenv'
  'ffmpeg'
)

optdepends=(
  'cuda: NVIDIA CUDA runtime support'
  'rocm-core: AMD ROCm runtime support'
)

source=()
sha256sums=()

package() {
  local appdir="$pkgdir/opt/$_pkgname"
  local bindir="$pkgdir/usr/bin"

  # Build-time selector:
  #
  #   F5_TTS_TORCH_BACKEND=cpu  makepkg -Csi
  #   F5_TTS_TORCH_BACKEND=cuda makepkg -Csi
  #   F5_TTS_TORCH_BACKEND=rocm makepkg -Csi
  #
  # Default is cuda because PyPI torch 2.11 pulls CUDA 13.0 wheels on Linux.
  local torch_backend="${F5_TTS_TORCH_BACKEND:-rocm}"

  install -d "$appdir" "$bindir"

  python -m venv "$appdir/venv"

  "$appdir/venv/bin/python" -m pip install \
    --upgrade \
    pip \
    wheel \
    setuptools

  case "$torch_backend" in
    cpu)
      echo "Installing CPU PyTorch wheels..."
      "$appdir/venv/bin/python" -m pip install \
        --index-url https://download.pytorch.org/whl/cpu \
        torch torchaudio
      ;;

    rocm)
      echo "Installing ROCm PyTorch wheels..."
      #
      # IMPORTANT:
      # Pick the ROCm wheel index that matches your supported ROCm stack.
      # PyTorch's official installer exposes ROCm wheel choices from the
      # Linux + pip + ROCm selector.
      #
      # If this URL fails for your current PyTorch/Python combo, check:
      #   https://pytorch.org/get-started/locally/
      #
      # PyTorch/AMD note that available ROCm releases vary by stable/nightly.
      #
      "$appdir/venv/bin/python" -m pip install \
        --index-url https://download.pytorch.org/whl/rocm6.3 \
        torch torchaudio
      ;;

    cuda)
      echo "Installing default PyPI CUDA-capable PyTorch wheels..."
      # Do nothing special; f5-tts dependency resolution will pull torch.
      ;;

    *)
      echo "Invalid F5_TTS_TORCH_BACKEND=$torch_backend"
      echo "Expected one of: cpu, cuda, rocm"
      return 1
      ;;
  esac

  if [[ "$torch_backend" == "cpu" || "$torch_backend" == "rocm" ]]; then
    # Install F5-TTS without letting pip replace our selected torch/torchaudio.
    "$appdir/venv/bin/python" -m pip install \
      --no-deps \
      "f5-tts==$pkgver"

    # Install F5-TTS runtime deps except torch/torchaudio.
    #
    # Keep torchcodec here for now. If it conflicts with ROCm on your machine,
    # remove it and test whether F5-TTS still works for your inference path.
    "$appdir/venv/bin/python" -m pip install \
      "accelerate>=0.33.0" \
      "bitsandbytes>0.37.0" \
      "cached_path" \
      "click" \
      "datasets" \
      "ema_pytorch>=0.5.2" \
      "gradio>=6.0.0,<6.11" \
      "hydra-core>=1.3.0" \
      "librosa" \
      "matplotlib" \
      "pydub" \
      "pypinyin" \
      "rjieba" \
      "safetensors" \
      "soundfile" \
      "tomli" \
      "torchcodec" \
      "torchdiffeq" \
      "tqdm>=4.65.0" \
      "transformers" \
      "transformers_stream_generator" \
      "unidecode" \
      "vocos" \
      "wandb" \
      "x_transformers>=1.31.14"
  else
    "$appdir/venv/bin/python" -m pip install \
      "f5-tts==$pkgver"
  fi

  echo "Verifying selected PyTorch backend..."
  "$appdir/venv/bin/python" - <<PY
import torch
print("torch:", torch.__version__)
print("cuda available:", torch.cuda.is_available())
print("hip version:", getattr(torch.version, "hip", None))
print("cuda version:", getattr(torch.version, "cuda", None))
PY

  if [[ "$torch_backend" == "rocm" ]]; then
    "$appdir/venv/bin/python" - <<'PY'
import torch
if getattr(torch.version, "hip", None) is None:
    raise SystemExit("requested ROCm backend, but installed torch has no HIP/ROCm support")
print("ROCm/HIP torch detected")
PY
  fi

  if [[ "$torch_backend" == "cpu" ]]; then
    "$appdir/venv/bin/python" - <<'PY'
import torch
if getattr(torch.version, "hip", None) is not None:
    raise SystemExit("requested CPU backend, but torch has HIP/ROCm support")
if getattr(torch.version, "cuda", None) is not None:
    raise SystemExit("requested CPU backend, but torch has CUDA support")
print("CPU torch detected")
PY
  fi

  # Upstream infer_gradio writes runtime state to:
  #   files("f5_tts").joinpath("infer/.cache/last_used_custom_model_info_v1.txt")
  #
  # Under this package, that resolves inside /opt/f5-tts/venv/.../site-packages,
  # which is root-owned and not writable by normal users. Patch it to use:
  #   ${XDG_CACHE_HOME:-~/.cache}/f5-tts/infer/last_used_custom_model_info_v1.txt
  python - <<PY
from pathlib import Path

root = Path("$appdir")
matches = list(root.glob("venv/lib/python*/site-packages/f5_tts/infer/infer_gradio.py"))
if not matches:
    raise SystemExit("could not find infer_gradio.py")

path = matches[0]
text = path.read_text()

# Ensure os is imported.
if "import os" not in text.split("\\n")[:120]:
    if "from pathlib import Path" in text:
        text = text.replace("from pathlib import Path", "from pathlib import Path\\nimport os", 1)
    else:
        text = "import os\\n" + text

old = 'last_used_custom = files("f5_tts").joinpath("infer/.cache/last_used_custom_model_info_v1.txt")'
new = 'last_used_custom = Path(os.environ.get("XDG_CACHE_HOME", Path.home() / ".cache")) / "f5-tts" / "infer" / "last_used_custom_model_info_v1.txt"'

if old not in text:
    relevant = "\\n".join(
        f"{i + 1}: {line}"
        for i, line in enumerate(text.splitlines())
        if ".cache" in line or "last_used_custom" in line or "from pathlib import Path" in line or "import os" in line
    )
    raise SystemExit("expected last_used_custom cache line not found. Relevant lines:\\n" + relevant)

text = text.replace(old, new, 1)

if "XDG_CACHE_HOME" not in text:
    raise SystemExit("cache patch failed; XDG_CACHE_HOME not present after patch")

path.write_text(text)
print(f"patched cache path in {path}")
PY

  # Make venv scripts relocatable enough for /opt runtime.
  # Only edit files, because venv/bin may contain __pycache__ directories.
  find "$appdir/venv/bin" -maxdepth 1 -type f -exec sed -i "s|$pkgdir||g" {} +

  cat > "$bindir/f5-tts_infer-cli" <<'EOF'
#!/usr/bin/env bash
exec /opt/f5-tts/venv/bin/python -m f5_tts.infer.infer_cli "$@"
EOF

  cat > "$bindir/f5-tts_infer-gradio" <<'EOF'
#!/usr/bin/env bash
exec /opt/f5-tts/venv/bin/python -m f5_tts.infer.infer_gradio "$@"
EOF

  cat > "$bindir/f5-tts_finetune-cli" <<'EOF'
#!/usr/bin/env bash
exec /opt/f5-tts/venv/bin/python -m f5_tts.train.finetune_cli "$@"
EOF

  cat > "$bindir/f5-tts_finetune-gradio" <<'EOF'
#!/usr/bin/env bash
exec /opt/f5-tts/venv/bin/python -m f5_tts.train.finetune_gradio "$@"
EOF

  chmod 755 "$bindir"/f5-tts_*
}