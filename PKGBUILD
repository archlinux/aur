# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>

pkgname=infiniband-diags
pkgver=2.2.0
pkgrel=1
pkgdesc='OpenFabrics Alliance diagnostic programs and scripts for InfiniBand subnets'
arch=('x86_64' 'i686')
url='https://www.openfabrics.org/index.php/overview.html'
license=('GPL2' 'custom:"OpenIB.org BSD"')
provides=('libibmad')
conflicts=('libibmad' 'rdma-core')
replaces=('libibmad')
depends=('opensm' 'perl')
makedepends=('python-docutils')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/linux-rdma/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('8f3bae228a53e0f69a242f8d315230dd1e7d7ee8a1bf14ebde80603173a43ff3')

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
  install -Dm644 README "${pkgdir}/usr/share/docs/${pkgname}/README"
  chmod 644 "${pkgdir}/etc/infiniband-diags/ibdiag.conf"

  # Remove init.d script.  (rdma-ndd and its .service were moved upstream ito rdma-core.)
  rm -rf "${pkgdir}/etc/init.d"

  # 1.6.7 - 2.1.0 erroneously makes an empty /var/run directory
  rmdir "${pkgdir}/var/run"
  rmdir "${pkgdir}/var"
}
