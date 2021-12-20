# Maintainer: Mikkel Kroman <mk@maero.dk>
# Contributor: Martchus <martchus@gmx.net>

# Checklist before updating:
# 1) Use the latest compatible version of date.h from https://github.com/HowardHinnant/date
# 2) Check that sqlpp11 doesn't have a date.h that will overwrite /usr/include/sqlpp11/date.h

pkgname=sqlpp11
pkgver=0.61
pkgrel=1
pkgdesc='A type safe embedded domain specific language for SQL queries and results in C++'
arch=('any')
url="https://github.com/rbock/$pkgname"
license=('BSD')
depends=('date')
makedepends=('cmake')
source=("https://github.com/rbock/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('d5a95e28ae93930f7701f517b1342ac14bcf33a9b1c5b5f0dff6aea5e315bb50')
prepare() {
  rm -Rf build
  mkdir build
  cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "../$pkgname-$pkgver"
}

build() {
  cd build
  make
}

check() {
  cd build
  make test
  ctest
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install

  mkdir -p "${pkgdir}/usr/share/licenses/$pkgname"
  install -Dm644 ../$pkgname-$pkgver/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
