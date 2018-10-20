# Maintainer: Andrew Sun <adsun701@gmail.com>

_pkgname=libfilezilla
pkgname=lib32-${_pkgname}
pkgver=0.15.0
pkgrel=1
pkgdesc="Small and modern C++ library, offering some basic functionality to build high-performing, platform-independent programs (32-bit)"
arch=('x86_64')
url="https://lib.filezilla-project.org/"
license=('GPL')
depends=("lib32-gcc-libs" "lib32-clang" "lib32-nettle" "${_pkgname}")
makedepends=("clang")
checkdepends=("lib32-cppunit")
source=("https://download.filezilla-project.org/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2")
sha512sums=('64b0e2a8dd4dd06a1c2daf52f3036fcaed60b95240672f28032ec390361ddb1a59cd26a91b7b7c525cfc8262381db09a081a29c723f487cc5b41454ce4e9d47e')

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
