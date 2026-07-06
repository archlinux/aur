# Maintainer: yuhldr <yuhldr@gmail.com>

_pkgname=hplip
pkgname="${_pkgname}-lite"
pkgver=3.26.4
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
  "b9c61252754f35b4a237396ca8961e7b3e0c56db76d66a6712b7bf3e30e69463"
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
