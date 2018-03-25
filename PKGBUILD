# $Id$
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=inboxer
pkgver=1.0.4
pkgrel=1
pkgdesc="Unofficial, free and open-source Google Inbox desktop app"
arch=(any)
url="https://denysdovhan.com/inboxer/"
license=(MIT)
depends=(electron)
makedepends=(npm)
options=(!strip)
source=($pkgname-$pkgver.tar.gz::https://github.com/denysdovhan/$pkgname/archive/v$pkgver.tar.gz
        $pkgname.sh
        $pkgname.desktop)
sha256sums=('11fcf12e5fd79da9284b756d24c5d082ccf05ee3e35c7d998ece682d47550c86'
            'd8519d50a0becf00d2cd0809e4363087949fdc3d43c315ce26f87235e9ae6b27'
            '3048bb5c4d50269d27a46db7ff550f226881bd77ac6672573a0075b3b75ce2a0')

build() {
  cd $pkgname-$pkgver
  sed -i '/"postinstall"/d' package.json
  npm install --production
}

package() {
  mkdir -p "$pkgdir"/usr/{lib,share/pixmaps}
  cp -r $pkgname-$pkgver "$pkgdir/usr/lib/$pkgname"
  ln -s ../../lib/$pkgname/app/static/Icon@2x.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
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
