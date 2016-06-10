# Maintainer: James Harvey <jamespharvey20@gmail.com>
# * Namcap warns that rdma is an unrequired dependency, but srptools needs the ib_srpt kernel module, loaded by rdma if SRP_LOAD=yes in its /etc/rdma.conf
# Up to date with fedora's srptools-1.0.3-1.fc23.src.rpm

pkgname=srptools
pkgver=1.0.3
pkgrel=3
pkgdesc='OpenFabrics Alliance InfiniBand SCSI RDMA discovery tools'
arch=('x86_64' 'i686')
url='https://www.openfabrics.org/index.php/overview.html'
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
depends=('libibumad' 'libibverbs' 'rdma')
source=("https://www.openfabrics.org/downloads/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        'srptools.service')
md5sums=('f3a463673dcf52c726eb7df2f7c391de'
         '7a3b9055eb8b5963b16b8e79a5f58be2')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # srp_daemon.sh isn't updated with the sbindir configure option
  sed -i "s|prog=/usr/sbin/srp_daemon|prog=/usr/bin/srp_daemon|" srp_daemon/srp_daemon.sh
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
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  # Convert from init.d to systemd
  rm -rf ${pkgdir}/etc/init.d
  install -Dm644 "${srcdir}/srptools.service" "${pkgdir}/usr/lib/systemd/system/srptools.service"
}
