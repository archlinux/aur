# Maintainer: James Harvey <jamespharvey20@gmail.com>
# namcap says dependency 'libibmad' is not needed, but without it, configure fails with "cannot find infiniband/mad.h", provided by libibmad, and mstflint-4.0.1/mtcr_ul/mtcr_ib_ofed.c does include "infiniband/mad.h"

pkgname=mstflint
pkgver=4.4.0
pkgrel=1
pkgdesc='OpenFabrics Alliance firmware burning application for Mellanox HCA/NIC cards'
arch=('x86_64' 'i686')
url='https://www.openfabrics.org/index.php/overview.html'
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
depends=('bash' 'zlib' 'libibmad')
source=("https://www.openfabrics.org/downloads/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "c++11Compatibility.patch")
md5sums=('8846152be0581c76396e60e94e953c59'
         '140ded3004a700f0d59a9ecfea89ed0b')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 -i ${srcdir}/c++11Compatibility.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --sbindir=/usr/bin \
              --libexecdir=/usr/lib \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
