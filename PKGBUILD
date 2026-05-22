# Maintainer: Seann <you@example.com>

pkgname=kokoro-tts
pkgver=2.3.1
pkgrel=1
pkgdesc='CLI text-to-speech tool using the Kokoro model'
arch=('x86_64')
url='https://github.com/nazdridoy/kokoro-tts'
license=('MIT')

options=('!debug' '!strip')

depends=(
  # Upstream declares requires-python >=3.11,<3.13.
  'python312'
  'ffmpeg'
  'portaudio'
)

source=()
sha256sums=()

package() {
  local appdir="$pkgdir/opt/$pkgname"
  local bindir="$pkgdir/usr/bin"

  install -d "$appdir" "$bindir"

  python3.12 -m venv "$appdir/venv"

  "$appdir/venv/bin/python" -m pip install \
    --upgrade \
    pip \
    wheel \
    setuptools

  "$appdir/venv/bin/python" -m pip install \
    "$pkgname==$pkgver"

  "$appdir/venv/bin/python" - <<'PY'
import importlib.metadata
import kokoro_tts

print("kokoro-tts:", importlib.metadata.version("kokoro-tts"))
print("kokoro_tts module:", kokoro_tts.__file__)
PY

  # Make venv scripts relocatable enough for /opt runtime.
  # Only edit files, because venv/bin may contain __pycache__ directories.
  find "$appdir/venv/bin" -maxdepth 1 -type f -exec sed -i "s|$pkgdir||g" {} +

  cat > "$bindir/kokoro-tts" <<'EOF'
#!/usr/bin/env bash
exec /opt/kokoro-tts/venv/bin/python -m kokoro_tts "$@"
EOF

  chmod 755 "$bindir/kokoro-tts"
}
