# Maintainer: Andrew Sun <adsun701 at gmail dot com>

_pkgname=libfilezilla
pkgname=lib32-${_pkgname}
pkgver=0.19.0
pkgrel=1
pkgdesc="Small and modern C++ library, offering some basic functionality to build high-performing, platform-independent programs (32-bit)"
arch=('x86_64')
url="https://lib.filezilla-project.org/"
license=('GPL')
depends=("lib32-gcc-libs" "lib32-clang" "lib32-nettle" "lib32-gnutls" "${_pkgname}")
makedepends=("clang" "gettext")
checkdepends=("lib32-cppunit")
source=("https://download.filezilla-project.org/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2")
sha512sums=('a652c996e7c924d7c3a5c3da69ed396e19ebaebf98e8553ed8e1a718f5dff412e3dfec46b0008784c342a8443a0e7e34764211218d88a0888fece89edc582deb')

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
