# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=lib32-libcap-ng
_pkgbasename=libcap-ng
pkgver=0.8
pkgrel=1
pkgdesc='Library making programming with POSIX capabilities easier than traditional libcap (32-bit)'
url='https://people.redhat.com/sgrubb/libcap-ng/'
arch=('x86_64')
license=('LGPL2.1')
depends=('lib32-glibc' 'libcap-ng')
makedepends=('gcc-multilib')
source=(https://github.com/stevegrubb/libcap-ng/archive/v${pkgver}/${_pkgbasename}-${pkgver}.tar.gz)
sha512sums=('47b079849ee051544e74b006bcfff1f7965c79099db52f39f49e3f138137748712df2ef88f3fbd9715d44d9f2d118593f557dba1ede45a0168e7c813a4e65f46')

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
