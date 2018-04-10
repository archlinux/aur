# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=lib32-libcap-ng
_pkgbasename=libcap-ng
pkgver=0.7.9
pkgrel=1
pkgdesc='Library making programming with POSIX capabilities easier than traditional libcap'
url='http://people.redhat.com/sgrubb/libcap-ng/'
arch=('x86_64')
license=('LGPL2.1')
depends=('lib32-glibc' 'lib32-gcc-libs')
source=(${_pkgbasename}-${pkgver}.tar.gz::https://github.com/stevegrubb/libcap-ng/archive/v${pkgver}.tar.gz)
sha512sums=('eae256b57af37c1170ee372ab9a6af927826a7b7b92f00c68010afbb32893fc265414ecf28f52e912a41609b4ca5e1295363db88dac9c60ea04bd20a1dfeef83')

prepare() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  autoreconf -fiv
}

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export LDFLAGS+=' -m32'
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --enable-static=no \
    --without-python \
    --without-python3
  make
}

check() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}

