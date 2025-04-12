# Maintainer: yuhldr <yuhldr@gmail.com>

_pkgname=hplip
pkgname="${_pkgname}-lite"
pkgver=3.25.2
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
source=(
  "https://downloads.sourceforge.net/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
  "hplip-pserror-gcc14.patch"
)
sha256sums=(
  "e872ff28eb2517705a95f6e1839efa1e50a77a33aae8905278df2bd820919653"
  "SKIP"
)

prepare() {
 cd "${_pkgname}-${pkgver}"
 patch -Np1 -i "${srcdir}/hplip-pserror-gcc14.patch"
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
