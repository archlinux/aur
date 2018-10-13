# Maintainer: James Harvey <jamespharvey20@gmail.com>
# No namcap warnings or errors
# Up to date with fedora's infiniband-diags-1.6.4-4.fc23.src.rpm

pkgname=infiniband-diags
pkgver=2.0.0
pkgrel=1
pkgdesc='OpenFabrics Alliance diagnostic programs and scripts for InfiniBand subnets'
arch=('x86_64' 'i686')
url='https://www.openfabrics.org/index.php/overview.html'
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
provides=('libibmad')
conflicts=('libibmad')
replaces=('libibmad')
depends=('opensm' 'systemd' 'glib2')
source=("https://github.com/linux-rdma/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('4357e6563477a693949efa18d5f7d720')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
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
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  chmod 644 "${pkgdir}/etc/infiniband-diags/ibdiag.conf"

  # Remove init.d script.  (rdma-ndd and its .service were moved upstream ito rdma-core.)
  rm -rf ${pkgdir}/etc/init.d

  # 1.6.7 - 2.0.0 erroneously makes an empty /var/run directory - remove /var/run and /var with rmdir rather than "rm -r" so it will fail if not empty (future versions)
  rmdir "${pkgdir}/var/run"
  rmdir "${pkgdir}/var"
}
