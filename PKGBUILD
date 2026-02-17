# Maintainer: Grey-007 <https://github.com/Grey-007>

pkgname=nolio-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Minimal calendar-based todo app built with Flutter (prebuilt binary)"
arch=('x86_64')
url="https://github.com/Grey-007/nolio"
license=('MIT')

depends=(
  'gtk3'
  'libepoxy'
  'libxkbcommon'
  'libglvnd'
  'mesa'
)

makedepends=('tar')

provides=('nolio')
conflicts=('nolio')

options=(!strip !debug)

source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/Grey-007/nolio/releases/download/v$pkgver/nolio-$pkgver-linux-x86_64.tar.gz"
  "nolio.desktop"
  "nolio.png"
)

sha256sums=(
  '116a2313e1bfd428648690b693679f71be131f0e63bf62cd9e3231e1fdcf495a'
  'SKIP'
  'SKIP'
)

prepare() {
  cd "$srcdir"

  # Find extracted directory automatically (future-proof)
  _appdir=$(find . -maxdepth 1 -type d -name "nolio*" | head -n1)

  if [[ -z "$_appdir" ]]; then
    echo "Extraction failed: nolio directory not found"
    exit 1
  fi

  chmod +x "$_appdir/nolio" || true
}

package() {
  cd "$srcdir"
  _appdir=$(find . -maxdepth 1 -type d -name "nolio*" | head -n1)

  # Install app files
  install -dm755 "$pkgdir/usr/lib/nolio"
  cp -a "$_appdir/." "$pkgdir/usr/lib/nolio/"

  # Symlink binary
  install -dm755 "$pkgdir/usr/bin"
  ln -s /usr/lib/nolio/nolio "$pkgdir/usr/bin/nolio"

  # Desktop entry
  install -Dm644 nolio.desktop \
    "$pkgdir/usr/share/applications/nolio.desktop"

  # Icon
  install -Dm644 nolio.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/nolio.png"
}
