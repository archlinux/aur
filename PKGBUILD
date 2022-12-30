# Maintainer: ALEXPRO100 <alealexpro100@ya.ru>

_pkgname=qt-mvvm
pkgname=qt5-mvvm-git
pkgver=r3486.59f8083e
pkgrel=1
pkgdesc="Model View ViewModel framework for large Qt C++ applications "
arch=('any')
url="https://github.com/gpospelov/qt-mvvm"
license=('GPL3')
depends=('qt5-base')
makedepends=('git' 'cmake' 'qt5-tools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/gpospelov/${_pkgname}.git"
  "stringutils_limits.patch")
md5sums=('SKIP'
         'b2ab54e609cfe374f0f292f8bb8e1a79')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
  cd "$srcdir/${_pkgname}"
  git submodule init
  git submodule update
  patch --forward --strip=1 --input="${srcdir}/stringutils_limits.patch"
}

build() {
  cd build
  cmake ../${_pkgname} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  make -j$(nproc)
}

package() {
  cd build
  DESTDIR="${pkgdir}" make install
}
