# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>

pkgname=ibacm
pkgver=1.2.1
pkgrel=1
pkgdesc='OpenFabrics Alliance InfiniBand communication manager daemon for librdmacm'
arch=('x86_64' 'i686')
url='https://www.openfabrics.org/index.php/overview.html'
license=('GPL2' 'custom:"Open Fabrics Alliance BSD"')
depends=('libibverbs' 'libibumad')
source=("https://downloads.openfabrics.org/downloads/rdmacm/${pkgname}-${pkgver}.tar.gz"
        'ibacm.service')
md5sums=('4efc8ac70bc2334f2195137d4f1c6385'
         'ddb76ae6e28a18fcc984770b5699ea00')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
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
  # If ${pkgdir}/etc is empty (it should be, since /etc/init.d/ was removed) remove it
  if ! [ "$(ls -A ${pkgdir}/etc)" ]; then
     rm -rf ${pkgdir}/etc/
  fi

  install -Dm644 "${srcdir}/ibacm.service" "${pkgdir}/usr/lib/systemd/system/ibacm.service"
}
