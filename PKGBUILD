# Maintainer: James Harvey <jamespharvey20@gmail.com>
# * OpenFabrics Alliance InfiniBand subnet manager (SM) and subnet administrator (SA)
#    * One subnet manager is required to run each InfiniBand subnet, before initializing InfiniBand hardware
# * No Namcap warnings or errors
# Up to date with fedora's opensm-3.3.17-5.fc23.src.rpm

pkgname=opensm-systemd-multiple-interfaces
_pkgbase=opensm
pkgver=3.3.20
pkgrel=1
pkgdesc='OpenFabrics Alliance InfiniBand Subnet Manager and Administrator'
arch=('x86_64' 'i686')
url='https://www.openfabrics.org/index.php/overview.html'
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
provides=('opensm')
conflicts=('opensm')
depends=('libibumad' 'rdma')
source=("https://www.openfabrics.org/downloads/management/${_pkgbase}-${pkgver}.tar.gz"
        'opensm.service'
        'opensm.launch')
md5sums=('ed615b4681e94ef2e13a5de773ab89a3'
         'f1155dd8fb07ce56c427bceb7ce3fffb'
         '7cd151f96d46ba1bc651fce0e2b7e8dc')

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  ./configure --prefix=/usr \
              --sbindir=/usr/bin \
              --libexecdir=/usr/lib \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  # Convert from init.d to systemd
  rm -rf ${pkgdir}/etc/init.d
  # If ${pkgdir}/etc is empty (it should be, since /etc/init.d/ was removed) remove it
  if ! [ "$(ls -A ${pkgdir}/etc)" ]; then
     rm -rf ${pkgdir}/etc/
  fi

  install -Dm644 "${srcdir}/opensm.service" "${pkgdir}/usr/lib/systemd/system/opensm.service"
  install -Dm755 "${srcdir}/opensm.launch" "${pkgdir}/usr/bin/opensm.launch"
}
