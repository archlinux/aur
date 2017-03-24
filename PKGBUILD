# Maintainer: Mikkel Kroman <mk@maero.dk>
# Contributor: Martchus <martchus@gmx.net>

# Checklist before updating:
# 1) Use the latest compatible version of date.h from https://github.com/HowardHinnant/date
# 2) Check that sqlpp11 doesn't have a date.h that will overwrite /usr/include/sqlpp11/date.h

pkgname=sqlpp11
pkgver=0.48
pkgrel=1
pkgdesc='A type safe embedded domain specific language for SQL queries and results in C++'
arch=('any')
url="https://github.com/rbock/$pkgname"
license=('BSD')
depends=()
makedepends=('cmake')
source=("https://github.com/rbock/$pkgname/archive/$pkgver.tar.gz"
        "https://raw.githubusercontent.com/HowardHinnant/date/41093d05d838926a885487635475b08043da23d4/date.h")
sha256sums=('b8719d4fd4b020a0a85a89f623fe982a3dc7bd54e58e9e9accb42d4a42566b54'
            'ff6b7e6f62dd45ff245b077155e9c03011c37aa076701d46fca013b03415be15')
prepare() {
  rm -Rf build
  mkdir build
  cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DHinnantDate_ROOT_DIR="${srcdir}" \
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

  install -m644 "${srcdir}/date.h" "${pkgdir}/usr/include/$pkgname/date.h"

  mkdir -p "${pkgdir}/usr/share/licenses/$pkgname"
  install -Dm644 ../$pkgname-$pkgver/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
