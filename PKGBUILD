# Maintainer: James Harvey <jamespharvey20@gmail.com>
# namcap says dependency 'libibmad' is not needed, but without it, configure fails with "cannot find infiniband/mad.h", provided by libibmad, and mstflint-4.0.1/mtcr_ul/mtcr_ib_ofed.c does include "infiniband/mad.h"

pkgname=mstflint
pkgver=4.0.1
_pkgver_subver=1.43
_pkgver_commit=g97d7275
pkgrel=1
pkgdesc='OpenFabrics Alliance firmware burning application for Mellanox HCA/NIC cards'
arch=('x86_64' 'i686')
url=('https://www.openfabrics.org/index.php/overview.html')
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
depends=('bash' 'zlib' 'libibmad')
source=("https://www.openfabrics.org/downloads/${pkgname}/${pkgname}-${pkgver}-${_pkgver_subver}.${_pkgver_commit}.tar.gz"
        'disableWerror.patch')
md5sums=('7bcf30aa21f1951c6da918dbae25b23a'
         '526da982d2827af23d00fe8f7306923b')

prepare() {
  # v4.0.1.143.g97d7275 triggers -Werror, due to maybe uninitialized variables at fs3_ops.cpp:1727, 1863, and 1068
  # Giving configure options of CFLAGS="-Wno-error" and CXXFLAGS="-Wno-error" doesn't work, because its build system adds "-Werror" at the end, which overrides
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Unsure how to use sed without updating timestamps, so using a patch
  # Without --set-utc flag, aclocal rebuild is triggered, which is otherwise not a makedepends.  Even if included, it is hardcoded to look for aclocal-1.13, and aclocal-1.15 would be installed
  patch --set-utc -p1 -i ${srcdir}/disableWerror.patch
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
