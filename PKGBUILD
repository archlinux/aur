# Maintainer: Marcel Gazdik <gazdikmarcel[at]gmail[dot]com>

pkgname=libupnp18
_pkgname=libupnp
pkgver=1.8.6
_pkgver=1.8
pkgrel=1
pkgdesc='A separate installation of libupnp 1.8 branch'
url='http://pupnp.sourceforge.net/'
arch=('x86_64')
license=('BSD')
depends=('glibc')
makedepends=('pkgconfig' 'make' 'gcc' 'binutils' 'autoconf' 'automake' 'fakeroot')
provides=( libupnp=${pkgver} )
source=(https://downloads.sourceforge.net/sourceforge/pupnp/${_pkgname}-${pkgver}.tar.bz2)
sha256sums=('65faf240f8ccee50cc0e7fe7fb21dcd79f743fc227a9b652b091f50f6956c2c7')

prepare() {
  cd ${_pkgname}-${pkgver}
  autoreconf -fiv
}

build() {
  cd ${_pkgname}-${pkgver}

  CFLAGS+=' -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE' ./configure \
    --prefix=/usr \
    --enable-reuseaddr \
    --libdir=/usr/lib/libupnp-${_pkgver} \
    --includedir=/usr/include/${_pkgname}-${_pkgver}
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install

  install -dm755 ${pkgdir}/usr/lib/pkgconfig/
  ln -sf /usr/lib/${_pkgname}-${_pkgver}/pkgconfig/libupnp.pc ${pkgdir}/usr/lib/pkgconfig/${_pkgname}-${_pkgver}.pc

  install -dm755 ${pkgdir}/etc/ld.so.conf.d/
  echo "/usr/lib/${_pkgname}-${_pkgver}" > ${pkgdir}/etc/ld.so.conf.d/${_pkgname}-${_pkgver}.conf

  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${_pkgname}-${_pkgver}"
}



# vim: ts=2 sw=2 et:
