# Maintainer: James Harvey <jamespharvey20@gmail.com>
# * OpenFabrics Alliance InfiniBand subnet manager (SM) and subnet administrator (SA)
#    * One subnet manager is required to run each InfiniBand subnet, before initializing InfiniBand hardware
# * No Namcap warnings or errors
# Up to date with fedora's opensm-3.3.17-5.fc23.src.rpm

pkgname=opensm-systemd-multiple-interfaces
_pkgbase=opensm
pkgver=3.3.21
pkgrel=1
pkgdesc='OpenFabrics Alliance InfiniBand Subnet Manager and Administrator'
arch=('x86_64' 'i686')
url='https://www.openfabrics.org/index.php/overview.html'
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
provides=('opensm')
conflicts=('opensm')
depends=('libibumad' 'rdma')
source=("https://github.com/linux-rdma/opensm/archive/${pkgver}.tar.gz"
        'opensm.service'
        'opensm.launch'
        'opensm_extra.conf')
md5sums=('7149ad46987749ae80a00124dd1e3f9d'
         'd70efe82917527515520aca4fff840e9'
         'b8827f86be787ede5093c7395bb03928'
         '733983c333d652907145a7ae8ab09d85')

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  ./autogen.sh
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

  install -Dm644 "${srcdir}/opensm.service" "${pkgdir}/usr/lib/systemd/system/opensm.service"
  install -Dm755 "${srcdir}/opensm.launch" "${pkgdir}/usr/bin/opensm.launch"
  install -Dm644 "${srcdir}/opensm_extra.conf" "${pkgdir}/etc/opensm_extra.conf"
}
