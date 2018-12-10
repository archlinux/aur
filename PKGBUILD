# $Id$
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=inboxer
pkgver=1.2.1
pkgrel=2
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
sha256sums=('9e6f59884c026e739b9f249958ba03f8c80ac5e22a6c9f1a6468453bb3c1d031'
            '3607cef6ac387040f63669f3647323ebf5899be1e7094cb369ccc7e2c89005a3'
            '3048bb5c4d50269d27a46db7ff550f226881bd77ac6672573a0075b3b75ce2a0')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i '/"postinstall"/d' package.json
}

build() {
  cd "$pkgname-$pkgver"
  npm install --production
}

package() {
  mkdir -p "$pkgdir"/usr/{lib/$pkgname,share/pixmaps}
  mkdir -p "$pkgdir"/tmp

  # Copy app to tmp folder, clean it up, and pack it with asar
  cp -ar "$pkgname-$pkgver/"{app,node_modules,package.json} "$pkgdir/tmp"
  find "$pkgdir/tmp/node_modules" \
      -name "package.json" \
        -exec sed -e "s|$srcdir/$pkgname-$pkgver|/usr/lib/$pkgname|" \
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
      -or -name "*.md" -type f -exec rm '{}' \;

  "$pkgname-$pkgver/node_modules/asar/bin/asar.js" pack "$pkgdir/tmp/" "$pkgdir/usr/lib/$pkgname/inboxer.asar"
  rm -r "$pkgdir/tmp"

  install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$pkgname-$pkgver/app/static/Icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
