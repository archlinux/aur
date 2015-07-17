# Maintainer: James Harvey <jamespharvey20@gmail.com>
# * No namcap warnings or errors

pkgname=ibacm
pkgver=1.0.9
pkgrel=1
pkgdesc='OpenFabrics Alliance InfiniBand communication manager daemon for librdmacm'
#        Helps reduce load of managing path lookup records on large InfiniBand fabrics.
#        When properly configured, can reduce SA packet load of a large IB cluster from O(n^2) to O(n).
#        Provides framework for name, address, and route resolution services over InfiniBand.
arch=('x86_64' 'i686')
url=('https://www.openfabrics.org/index.php/overview.html')
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
depends=('libibverbs' 'libibumad')
source=("https://www.openfabrics.org/downloads/rdmacm/${pkgname}-${pkgver}.tar.gz"
        'ibacm.service')
md5sums=('67c323e8c31671e27ccf5583ef8e7443'
         'ddb76ae6e28a18fcc984770b5699ea00')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Not sure why lpthread isn't used by default, without it, it gives linker errors
  ./configure --prefix=/usr \
              --sbindir=/usr/bin \
              --libexecdir=/usr/lib \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --mandir=/usr/share/man \
              CFLAGS="-lpthread" \
              CXXFLAGS="-lpthread"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  # Convert from init.d to systemd
  rm -rf ${pkgdir}/etc/init.d
  install -Dm644 "${srcdir}/ibacm.service" "${pkgdir}/etc/systemd/system/ibacm.service"
}
