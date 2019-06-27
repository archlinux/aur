# Maintainer: Andrew Sun <adsun701@gmail.com>

_pkgname=libfilezilla
pkgname=lib32-${_pkgname}
pkgver=0.17.1
pkgrel=1
pkgdesc="Small and modern C++ library, offering some basic functionality to build high-performing, platform-independent programs (32-bit)"
arch=('x86_64')
url="https://lib.filezilla-project.org/"
license=('GPL')
depends=("lib32-gcc-libs" "lib32-clang" "lib32-nettle" "lib32-gnutls" "${_pkgname}")
makedepends=("clang" "gettext")
checkdepends=("lib32-cppunit")
source=("https://download.filezilla-project.org/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2")
sha512sums=('c9c88bf3cbeb5284c3e55571b40b07f780cb23aeb802284d385a2564bf46396875a34739f9819b0c3f89923950f19a13f6454940434a987bb91b2f23b898f774')

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
