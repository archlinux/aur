# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=xcursor-pro-cursor-theme
pkgver=2.0.1
pkgrel=1
pkgdesc="Modern X11 Cursor Theme"
arch=('any')
url="https://github.com/ful1e5/XCursor-pro"
license=('GPL-3.0-or-later')
makedepends=('python-clickgen>=2.0.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2fa5dd0666169ee98ff1ce9a3ff139726798e45b945eeafb633112b36dc38653')

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
