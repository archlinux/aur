# $Id$
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=inboxer
pkgver=1.1.5
pkgrel=4
pkgdesc="Unofficial, free and open-source Google Inbox desktop app"
arch=(any)
url="https://denysdovhan.com/inboxer/"
license=(MIT)
depends=(electron)
makedepends=(npm)
options=(!strip)
source=($pkgname-$pkgver.tar.gz::https://github.com/denysdovhan/$pkgname/archive/v$pkgver.tar.gz
        $pkgname.sh
        $pkgname.desktop
        remove-tracking.patch)
sha256sums=('75041e1d60823ff2b2213a0ac129f694acbd939b5b1a14e4a6bf2044cea99162'
            'd53b45fba512d899c1a37e232d1d5cb4d95435a311f07187f359ed284407c6b6'
            '3048bb5c4d50269d27a46db7ff550f226881bd77ac6672573a0075b3b75ce2a0'
            '71d3fea8d7442ae0435ad4b999a5cd6a43d86277897f2114f8f3fd7836c3faa9')

prepare() {
  cd "$pkgname-$pkgver"

  # remove tracking from source
  # this eliminates dependencies insight and firstrun. Insight was causing trouble in version 1.1.5
  patch -Np1 -i "${srcdir}/remove-tracking.patch"

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

  "$pkgname-$pkgver/node_modules/asar/bin/asar.js" pack "$pkgdir/tmp/" "$pkgdir/usr/lib/$pkgname/inboxer.asar"
  rm -r "$pkgdir/tmp"

  install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$pkgname-$pkgver/app/static/Icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
