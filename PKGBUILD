# Maintainer: James Harvey <jamespharvey20@gmail.com>
# No namcap warnings or errors

pkgname=infiniband-diags
pkgver=1.6.6
pkgrel=1
pkgdesc='OpenFabrics Alliance diagnostic programs and scripts for InfiniBand subnets'
arch=('x86_64' 'i686')
url=('https://www.openfabrics.org/index.php/overview.html')
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
depends=('libibmad' 'opensm' 'systemd' 'glib2')
source=("https://www.openfabrics.org/downloads/management/${pkgname}-${pkgver}.tar.gz"
        'rdma-ndd.service')
md5sums=('b855ca3b98afefc2ad6a2de378ab71dd'
         '4958d94ab0760c4b5b1908d66895e118')

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
  chmod 644 "${pkgdir}/etc/infiniband-diags/ibdiag.conf"

  # Convert from init.d to systemd
  rm -rf ${pkgdir}/etc/init.d
  install -Dm644 "${srcdir}/rdma-ndd.service" "${pkgdir}/usr/lib/systemd/system/rdma-ndd.service"
}
