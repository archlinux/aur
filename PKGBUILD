# Maintainer: James Harvey <jamespharvey20@gmail.com>
# * No namcap warnings or errors

pkgname=srptools
pkgver=1.0.3
pkgrel=1
pkgdesc='OpenFabrics Alliance InfiniBand SCSI RDMA discovery tools'
arch=('x86_64' 'i686')
url=('https://www.openfabrics.org/index.php/overview.html')
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
depends=('libibumad' 'libibverbs' 'bash')
source=("https://www.openfabrics.org/downloads/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        'srptools.service')
md5sums=('f3a463673dcf52c726eb7df2f7c391de'
         '82a077aa4c1aa3a243bcccb03042df77')

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
  install -Dm644 "${srcdir}/srptools.service" "${pkgdir}/etc/systemd/system/srptools.service"
}
