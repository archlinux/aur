# Maintainer: yuhldr <yuhldr@gmail.com>

_pkgname=hplip
pkgname="${_pkgname}-lite"
pkgver=3.23.8
pkgrel=1
pkgdesc="Only Print drivers for HP DeskJet, OfficeJet, Photosmart, Business Inkjet and some LaserJet"
arch=('x86_64')
url="https://hplipopensource.com"
license=('GPL2' 'custom')
depends=(libjpeg-turbo libcups)
makedepends=(python libusb)
provides=('hplip')
backup=('etc/hp/hplip.conf')
conflicts=('hplip')
optdepends=('cups: for printing support' 'system-config-printer')
source=(https://downloads.sourceforge.net/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('f7cc05f628c0cfd750e54ae41431c1dfdd29e97682f18b5c5ba5cb2c5b4b1b46')

prepare() {
 cd "${_pkgname}-${pkgver}"
 rm -rf ./PPD_HP
}

build() {
 cd "${_pkgname}-${pkgver}"
 ./configure --prefix=/usr \
    --enable-lite-build \
    --enable-hpcups-install \
    --enable-cups-drv-install \
    --disable-doc-build \
    --disable-fax-build \
    --disable-network-build \
    --disable-imageProcessor-build \
    --disable-scan-build
  make -j $(($(nproc) - 1))
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 COPYING
}
