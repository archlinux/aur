# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=xcursor-pro-cursor-theme
pkgver=2.0.0
pkgrel=1
pkgdesc="Modern X11 Cursor Theme"
arch=('any')
url="https://github.com/ful1e5/XCursor-pro"
license=('GPL3')
makedepends=('python-clickgen>=2.0.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cc6af1bb3771ee38ca7142d296399ae8d0a427f89ba795ded20907df34e1d8e1')

prepare() {
  cd XCursor-pro-$pkgver
  rm -rf themes
}

build() {
  cd XCursor-pro-$pkgver

  declare -A names
  names["XCursor-Pro-Dark"]="Modern dark XCursors."
  names["XCursor-Pro-Light"]="Modern light XCursors."
  names["XCursor-Pro-Red"]="Modern Red XCursors."

  for key in "${!names[@]}"; do
    comment="${names[$key]}";
    ctgen build.toml -p x11 -d "bitmaps/$key" -n "$key" -c "$comment" &
    PID=$!
    wait $PID
  done
}

package() {
  cd XCursor-pro-$pkgver
  install -d "$pkgdir/usr/share/icons"
  cp -r themes/XCursor-Pro* "$pkgdir/usr/share/icons/"
}
