# Contributor: Andrew Sun <adsun701 at gmail dot com>

pkgname=lib32-libcap-ng
_pkgbasename=libcap-ng
pkgver=0.8.1
pkgrel=1
pkgdesc='Library making programming with POSIX capabilities easier than traditional libcap (32-bit)'
url='https://people.redhat.com/sgrubb/libcap-ng/'
arch=('x86_64')
license=('LGPL2.1')
depends=('lib32-glibc' 'libcap-ng')
makedepends=('gcc-multilib')
source=(https://github.com/stevegrubb/libcap-ng/archive/v${pkgver}/${_pkgbasename}-${pkgver}.tar.gz)
sha512sums=('a246fbaabb0f9a203ce8395c9e968e6ea09be24ecbadeff7bc7c0e2f0f20cecd3bacb90e3ba6c4d13e58609751717f29b6a956715d0865bda8dd6c8b996d11cc')

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
  make check || true
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}
