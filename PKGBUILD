# Maintainer: James Harvey <jamespharvey20@gmail.com>
# * No namcap warnings or errors, unless building with optdepends librdmacm (and, in turn, libibverbs).
#    * In that case, namcap warns that librdmacm is detected but optional, which is correct, but is exactly what the user is then trying to do, so not something needing fixing

pkgname=qperf
pkgver=0.4.9
pkgrel=1
pkgdesc='OpenFabrics Alliance InfiniBand performance benchmark for bandwidth and latency'
#        Works over TCP/IP and RDMA
arch=('x86_64' 'i686')
url=('https://www.openfabrics.org/index.php/overview.html')
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
depends=('glibc')
# qperf builds without libibverbs, but then has no RDMA support, and only works over TCP/iP
# libibverbs has no InfiniBand-related dependencies, but including libibverbs then makes librdmacm a required dependency, in order to use libibverbs
# only including librdmacm as an optdepends since that depends on libibverbs, and there's no way to say in a PKGFILE if you're including libibverbs, librdmacm is a depends, otherwise it isn't.
optdepends=('librdmacm')
source=("https://www.openfabrics.org/downloads/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('a9eea1953ee5379e57ae5fd7b09fecf2')

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
}
