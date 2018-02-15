# $Id$
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=alduin
pkgver=2.0.1
pkgrel=1
pkgdesc="RSS, Atom and JSON feed aggregator"
arch=(x86_64)
url="https://alduinapp.github.io/"
license=(MIT)
depends=(electron)
makedepends=(git npm python2)
options=(!strip)
source=($pkgname-$pkgver.tar.gz::https://github.com/AlduinApp/$pkgname/archive/$pkgver.tar.gz
        $pkgname.sh
        $pkgname.desktop)
sha256sums=('fcb1afcd8563c5066fd2ba316776de6c2eedce359892c42647f3db919b5a1ea1'
            '04f441d21317c48e7df94dc8cf22934e906742b31a65f683a483b6069b9e7e16'
            '54174c4ac62fda2838de78c7b4dee7638e3befd4daded73548ce3a19f530748e')

prepare() {
  cd $pkgname-$pkgver
  sed -i '/TrackerModal/d' src/script/components/app.jsx
}

build() {
  cd $pkgname-$pkgver
  npm uninstall 7zip-bin-linux --save-optional
  npm run build
  npm prune --production
  npm rebuild --runtime=electron --target=$(</usr/lib/electron/version) --disturl=https://atom.io/download/electron --build-from-source
}

package() {
  mkdir -p "$pkgdir"/usr/{lib,share/pixmaps}
  cp -r $pkgname-$pkgver "$pkgdir/usr/lib/$pkgname"
  ln -s ../../lib/$pkgname/dist/assets/image/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 $pkgname-$pkgver/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Clean up
  find "$pkgdir/usr/lib/$pkgname/node_modules" \
      -name "package.json" \
        -exec sed -e "s|$srcdir/$pkgname|/usr/lib/$pkgname|" \
            -i {} \; \
      -or -name ".*" -prune -exec rm -r '{}' \; \
      -or -name "*.gyp" -prune -exec rm -r '{}' \; \
      -or -name "*.gypi" -prune -exec rm -r '{}' \; \
      -or -name "*.mk" -prune -exec rm -r '{}' \; \
      -or -name "*Makefile" -prune -exec rm -r '{}' \; \
      -or -name "bin" -prune -exec rm -r '{}' \; \
      -or -name "deps" -prune -exec rm -r '{}' \; \
      -or -name "doc" -prune -exec rm -r '{}' \; \
      -or -name "example" -prune -exec rm -r '{}' \; \
      -or -name "man" -prune -exec rm -r '{}' \; \
      -or -name "nan" -prune -exec rm -r '{}' \; \
      -or -name "obj.target" -prune -exec rm -r '{}' \; \
      -or -name "script" -prune -exec rm -r '{}' \; \
      -or -name "test" -prune -exec rm -r '{}' \; \
      -or -name "tmp" -prune -exec rm -r '{}' \;
}
