# Maintainer: Floofy floofyiv9@proton.me
pkgname=fleasion-git
pkgver=r515.f6e286c
pkgrel=1
pkgdesc="Roblox asset interceptor and replacer for Sober"
arch=('x86_64')
url="https://github.com/fleasion/Fleasion"
license=('GPL-3.0-only')
provides=('fleasion')
conflicts=('fleasion')
depends=(
  'python'
  'python-pyqt6'
  'python-opengl'
  'python-pillow'
  'python-numpy'
  'python-requests'
  'python-soundfile'
  'python-cryptography'
  'python-certifi'
  'python-lz4'
  'python-orjson'
  'python-zstandard'
  'python-dateutil'
  'python-platformdirs'
  'python-sounddevice'
  'python-browser-cookie3'
  'python-dracopy'
  'mesa'
  'sdl3'
  'libx11'
  'glew'
  'glfw'
  'libxcb'
  'libxkbcommon'
  'portaudio'
  'nss'
  'qwt'
  'qt6-base'
)
makedepends=('git')
source=(
  "$pkgname::git+https://github.com/fleasion/Fleasion.git#branch=main-indev"
  "fleasion.desktop"
  "fleasion.png"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$srcdir/$pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  local instDir="$pkgdir/usr/share/fleasion"

  install -d "$instDir"
  cp -r "$srcdir/$pkgname"/. "$instDir/"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/fleasion" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

export PYTHONPATH="/usr/share/fleasion/src${PYTHONPATH:+:$PYTHONPATH}"
cd /usr/share/fleasion
exec python launcher.py "$@"
EOF

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/fleasion-linux-proxy-helper" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

export PYTHONPATH="/usr/share/fleasion/src${PYTHONPATH:+:$PYTHONPATH}"
exec python -m Fleasion.linux_proxy_helper_daemon "$@"
EOF

  install -Dm644 "$srcdir/fleasion.desktop" "$pkgdir/usr/share/applications/fleasion.desktop"
  install -Dm644 "$srcdir/fleasion.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/fleasion.png"
}
