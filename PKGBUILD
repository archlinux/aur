# Maintainer: Seann <you@example.com>

pkgname=f5-tts
pkgver=1.1.20
pkgrel=6
pkgdesc='F5-TTS text-to-speech CLI and Gradio tools'
arch=('x86_64')
url='https://github.com/SWivid/F5-TTS'
license=('MIT')

options=('!debug' '!strip')

depends=(
  'python'
  'python-pip'
  'python-virtualenv'
  'ffmpeg'
)

optdepends=(
  'cuda: NVIDIA CUDA runtime support'
)

source=()
sha256sums=()

package() {
  local appdir="$pkgdir/opt/$pkgname"
  local bindir="$pkgdir/usr/bin"

  install -d "$appdir" "$bindir"

  python -m venv "$appdir/venv"

  "$appdir/venv/bin/python" -m pip install \
    --upgrade \
    pip \
    wheel \
    setuptools

  "$appdir/venv/bin/python" -m pip install \
    "f5-tts==$pkgver"

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
