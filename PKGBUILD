# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=libnitrokey
pkgver=3.0
pkgrel=1
pkgdesc="Communicate with Nitrokey stick devices in a clean and easy manner"
arch=('i686' 'x86_64')
url="https://www.nitrokey.com"
license=('LGPL3')
depends=(hidapi)
makedepends=('cmake' 'qt5-tools' 'libcatch-cpp-headers')
source=("https://github.com/Nitrokey/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('9bc47efbd2f97af859d7bb4d07556f7f83e58f6de63fdba92d75b999b578ec15')

prepare() {
  cd "$srcdir/$pkgname-$pkgver/"
  mkdir -p build
}

build() {
  cd "$srcdir/$pkgname-$pkgver/build"

  cmake .. \
        -DLIBNITROKEY_STATIC=OFF \
        -DCOMPILE_TESTS=OFF \
        -DUSE_CLANG=OFF \
        -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir" install
  install -d -m755 "$pkgdir/usr/lib/$pkgname"

  cd ..
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "${pkgdir}/usr/"
  mv include $pkgdir/usr/lib/${pkgname}/

  mv lib64/libnitrokey.so lib/libnitrokey/
  mv lib64/libnitrokey.so.3 lib/libnitrokey/
  mv lib64/libnitrokey.so.$pkgver.0 lib/libnitrokey/
  mv lib64/libnitrokey-log.so lib/libnitrokey/
  mv lib64/libnitrokey-log.so.3 lib/libnitrokey/
  mv lib64/libnitrokey-log.so.$pkgver.0 lib/libnitrokey/
  rmdir lib64
}
