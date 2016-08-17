# Maintainer: James Harvey <jamespharvey20@gmail.com>
# No namcap warnings or errors
# Up to date with fedora's infiniband-diags-1.6.4-4.fc23.src.rpm

pkgname=infiniband-diags
pkgver=1.6.7
pkgrel=1
pkgdesc='OpenFabrics Alliance diagnostic programs and scripts for InfiniBand subnets'
arch=('x86_64' 'i686')
url='https://www.openfabrics.org/index.php/overview.html'
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
depends=('libibmad' 'opensm' 'systemd' 'glib2')
source=("https://www.openfabrics.org/downloads/management/${pkgname}-${pkgver}.tar.gz"
        'rdma-ndd.service')
md5sums=('e100bb49f4227a70e0831152b2e4d61e'
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

  # 1.6.7 erroneously makes an empty /var/run directory - remove /var/run and /var with rmdir rather than "rm -r" so it will fail if not empty (future versions)
  rmdir "${pkgdir}/var/run"
  rmdir "${pkgdir}/var"
}
