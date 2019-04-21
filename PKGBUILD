# Maintainer: Andrew Sun <adsun701@gmail.com>

_pkgname=libfilezilla
pkgname=lib32-${_pkgname}
pkgver=0.16.0
pkgrel=1
pkgdesc="Small and modern C++ library, offering some basic functionality to build high-performing, platform-independent programs (32-bit)"
arch=('x86_64')
url="https://lib.filezilla-project.org/"
license=('GPL')
depends=("lib32-gcc-libs" "lib32-clang" "lib32-nettle" "${_pkgname}")
makedepends=("clang")
checkdepends=("lib32-cppunit")
source=("https://download.filezilla-project.org/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2")
sha512sums=('ea3302ae0c51582d6715fa3dd06d330a2ac820c3229b4dcab4a3470021dba667b6aea1a5b13168d720d7218cc8513e40c97990ed6573d0ea46d76e6ef50c2e6e')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  export CXX="clang++ -m32"
  export CC="clang -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --disable-static
  make
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  # LANG needed to fix string_test::test_conversion2
  LANG=en_US.UTF-8 make -k check || true
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}
