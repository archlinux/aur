# Maintainer: James Harvey <jamespharvey20@gmail.com>
# * OpenFabrics Alliance InfiniBand subnet manager (SM) and subnet administrator (SA)
#    * One subnet manager is required to run each InfiniBand subnet, before initializing InfiniBand hardware
# * No Namcap warnings or errors

pkgname=opensm
pkgver=3.3.19
pkgrel=1
pkgdesc='OpenFabrics Alliance InfiniBand Subnet Manager and Administrator'
arch=('x86_64' 'i686')
url=('https://www.openfabrics.org/index.php/overview.html')
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
depends=('libibumad' 'rdma')
source=("https://www.openfabrics.org/downloads/management/${pkgname}-${pkgver}.tar.gz"
        'opensm.service')
md5sums=('b41a64985fc3050b934ce6082cbac1be'
         '130d30d701776a27ecad9c8c90b9eb09')

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
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  # Convert from init.d to systemd
  rm -rf ${pkgdir}/etc/init.d
  install -Dm644 "${srcdir}/opensm.service" "${pkgdir}/etc/systemd/system/opensm.service"
}
