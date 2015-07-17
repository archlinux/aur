# Maintainer: James Harvey <jamespharvey20@gmail.com>
# * OpenFabrics Alliance InfiniBand subnet manager (SM) and subnet administrator (SA)
#    * One subnet manager is required to run each InfiniBand subnet, before initializing InfiniBand hardware
# * No Namcap warnings or errors

pkgname=opensm
pkgver=3.3.19
pkgrel=2
pkgdesc='OpenFabrics Alliance InfiniBand Subnet Manager and Administrator'
arch=('x86_64' 'i686')
url=('https://www.openfabrics.org/index.php/overview.html')
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
depends=('libibumad' 'rdma')
source=("https://www.openfabrics.org/downloads/management/${pkgname}-${pkgver}.tar.gz"
        'opensm.service'
        'opensm.launch')
md5sums=('b41a64985fc3050b934ce6082cbac1be'
         'f1155dd8fb07ce56c427bceb7ce3fffb'
         '7cd151f96d46ba1bc651fce0e2b7e8dc')

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
  install -Dm755 "${srcdir}/opensm.launch" "${pkgdir}/usr/bin/opensm.launch"
}
