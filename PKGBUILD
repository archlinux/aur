# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgbase=zopfli
pkgname=('zopfli' 'zopflipng')
pkgver=1.0.2
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/google/zopfli"
license=('apache')
depends=('glibc')
source=("https://github.com/google/zopfli/archive/$pkgbase-$pkgver.tar.gz")
sha256sums=('4a570307c37172d894ec4ef93b6e8e3aacc401e78cbcc51cf85b212dbc379a55')


prepare() {
  cd "$srcdir/zopfli-zopfli-$pkgver"

  sed -i -e "/^CFLAGS = / s/$/ $CFLAGS/" \
    -e "/^CXXFLAGS = / s/$/ $CXXFLAGS/" Makefile
}

build() {
  cd "$srcdir/zopfli-zopfli-$pkgver"

  make zopfli
  make libzopfli

  make zopflipng
  make libzopflipng
}

package_zopfli() {
  pkgdesc="Zopfli compression algorithm library"

  cd "$srcdir/zopfli-zopfli-$pkgver"

  install -Dm755 "zopfli" "$pkgdir/usr/bin/zopfli"

  install -Dm644 "src/zopfli/zopfli.h" "$pkgdir/usr/include/zopfli.h"

  _libso=$(find * -type f -name 'libzopfli.so.*')
  install -Dm755 "$_libso" "$pkgdir/usr/lib/$_libso"
  ln -s "/usr/lib/$_libso" "$pkgdir/usr/lib/libzopfli.so"

  install -Dm644 "README" "$pkgdir/usr/share/doc/$pkgname/README"
}

package_zopflipng() {
  pkgdesc="PNG optimization program using zopfli compression algorithm"
  depends=('gcc-libs')

  cd "$srcdir/zopfli-zopfli-$pkgver"

  install -Dm755 "zopflipng" "$pkgdir/usr/bin/zopflipng"

  install -Dm644 "src/zopflipng/zopflipng_lib.h" "$pkgdir/usr/include/zopflipng_lib.h"

  _libso=$(find * -type f -name 'libzopflipng.so.*')
  install -Dm755 "$_libso" "$pkgdir/usr/lib/$_libso"
  ln -s "/usr/lib/$_libso" "$pkgdir/usr/lib/libzopflipng.so"

  install -Dm644 "README.zopflipng" "$pkgdir/usr/share/doc/$pkgname/README.zopflipng"
}
