# Maintainer: maxDTM <265972625+maxDTM at users dot noreply dot github dot com>
pkgname=hotprint
pkgver=0.1.0
pkgrel=1
pkgdesc='Arrange images and PDF pages and print them on CTP500-class Bluetooth thermal printers'
arch=('any')
url='https://github.com/maxDTM/hotprint'
license=('MIT')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'python-pillow' 'poppler' 'librsvg'
         'bluez-utils')
optdepends=('imagemagick: import HEIC and other formats Pillow cannot read')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ff837ab74fa7f08e15070bd114b320fc2bd1079ed5f04f28ad9e393a1366c371')

check() {
  cd "$pkgname-$pkgver"
  # GUI smoke tests need a display; run the rest
  HOTPRINT_TESTS_NO_GUI=1 python -B tests/run_all.py
}

package() {
  cd "$pkgname-$pkgver"
  local site
  site=$(python -c "import sysconfig; print(sysconfig.get_path('purelib'))")
  install -d "$pkgdir$site"
  cp -r hotprint "$pkgdir$site/"
  python -m compileall -q -s "$pkgdir" -p / "$pkgdir$site/hotprint"

  install -d "$pkgdir/usr/bin"
  printf '#!/bin/sh\nexec /usr/bin/python3 -m hotprint "$@"\n' > "$pkgdir/usr/bin/hotprint"
  chmod 755 "$pkgdir/usr/bin/hotprint"

  local id=io.github.hotprint.HotPrint
  sed -e '/^#/d' -e 's|@EXEC@|hotprint|' -e "s|@ICON@|$id|" "data/$id.desktop.in" \
    | install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$id.desktop"
  install -Dm644 "data/$id.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$id.svg"
  install -Dm644 README.md docs/protocol.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
