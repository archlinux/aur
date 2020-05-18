# $Id$
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=inboxer
pkgver=1.3.4
pkgrel=1
pkgdesc="Unofficial, free and open-source Google Gmail desktop app"
arch=(any)
url="https://github.com/jmarino/inboxer"
license=(MIT)
depends=(electron)
makedepends=(npm)
options=(!strip)
source=($pkgname-$pkgver.tar.gz::https://github.com/jmarino/$pkgname/archive/v$pkgver.tar.gz
        $pkgname.sh
        $pkgname.desktop)
sha256sums=('cf234f2b688fbe0c02acdb91e7afdab787bddae1c54a21a5d920c83ef829f9bf'
            '3607cef6ac387040f63669f3647323ebf5899be1e7094cb369ccc7e2c89005a3'
            '1af6a2acb72642470d89fd7a66bda0aafe14081b07a11658dc1f08c2281e573e')

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
