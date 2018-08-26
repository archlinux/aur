# Maintainer: Andrew Sun <adsun701@gmail.com>

_pkgname=libfilezilla
pkgname=lib32-${_pkgname}
pkgver=0.13.0
pkgrel=1
pkgdesc="Small and modern C++ library, offering some basic functionality to build high-performing, platform-independent programs (32-bit)"
arch=('x86_64')
url="https://lib.filezilla-project.org/"
license=('GPL')
depends=("lib32-gcc-libs" "lib32-clang" "${_pkgname}")
makedepends=("clang")
checkdepends=("lib32-cppunit")
source=("http://download.filezilla-project.org/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2")
md5sums=('bdb48a81e0cdef196fc336bf306cd6d5')

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
  LANG=en_US.UTF-8 make -k check
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}
