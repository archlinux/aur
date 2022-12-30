# Maintainer: ALEXPRO100 <alealexpro100@ya.ru>

_pkgname=gpui
pkgname=${_pkgname}-git
pkgver=r658.425250a
pkgrel=1
pkgdesc="Group policy editor"
arch=('any')
url="https://github.com/august-alt/admc"
license=('GPL2')
depends=('samba' 'qt5-base' 'qt5-mvvm' 'libldap' 'krb5' 'util-linux' 'xsd')
makedepends=('git' 'cmake' 'qt5-tools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/august-alt/${_pkgname}.git"
  "no_xsd_ver_check.patch")
md5sums=('SKIP'
         'ae2205ff9122dd410fe4b3ccaeb0baad')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
  cd "$srcdir/${_pkgname}"
  patch --forward --strip=1 --input="${srcdir}/no_xsd_ver_check.patch"
}

build() {
  cd build
  cmake ../${_pkgname} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DGPUI_BUILD_TESTS=OFF
  make -j $(nproc)
}

package() {
  cd build
  DESTDIR="${pkgdir}" make install
}
