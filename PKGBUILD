# Maintainer: yuhldr <yuhldr@gmail.com>

_pkgname=hplip
pkgname="${_pkgname}-lite"
pkgver=3.23.12
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
sha256sums=('a76c2ac8deb31ddb5f0da31398d25ac57440928a0692dcb060a48daa718e69ed')

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
