# Maintainer: HarryLoong <local>

pkgname=epson-inkjet-printer-escpr2-clos-bin
pkgver=1.1.13
pkgrel=2
pkgdesc='Epson Inkjet Printer Driver 2 (ESC/P-R) for Linux, CLOS/Kylin binary package'
arch=('x86_64' 'aarch64')
url='https://www.epson.com.cn/drive/97ee5dd695ea4b3295b8a62e90b445b7.html?productId=53ce92f1e56342f8b89981ee9b461572'
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later' 'custom:Epson')
depends=('cups' 'glibc' 'libcups')
optdepends=('colord: color profile support')
provides=('epson-inkjet-printer-escpr2')
install=${pkgname}.install
conflicts=('epson-inkjet-printer-escpr2')
options=('!debug' '!strip')

_pkgver=${pkgver//./_}
_baseurl='https://eposs.epson.com.cn/EPSON/assets/resource/Download/Service/driver/Inkjet/L6276'
_debname="epson-inkjet-printer-escpr2_${_pkgver}_CLOS"

source_x86_64=("${_debname}_amd64.deb::${_baseurl}/${_debname}_amd64.deb")
source_aarch64=("${_debname}_arm64.deb::${_baseurl}/${_debname}_arm64.deb")

sha256sums_x86_64=('a93363290eb9a0ad857d7d3606c1bf48a386f6ca9df0376582da3188103b9c04')
sha256sums_aarch64=('ff114d0d0981f6b7ce4a80264c092449a3d1673e201d0ce1051d5e1d067a68e8')

noextract=("${_debname}_amd64.deb" "${_debname}_arm64.deb")

# Resolve architecture-specific source filename
if [ "$CARCH" = "x86_64" ]; then
  _srcdeb="${_debname}_amd64.deb"
elif [ "$CARCH" = "aarch64" ]; then
  _srcdeb="${_debname}_arm64.deb"
fi

prepare() {
  ar x "${_srcdeb}" data.tar.gz
}

package() {
  tar --no-same-owner -xzf data.tar.gz -C "${pkgdir}"

  rm -f "${pkgdir}/usr/lib/libescpr2.a"
  rm -f "${pkgdir}/usr/lib/libescpr2.la"

  install -dm755 "${pkgdir}/usr/share/ppd"
  ln -s ../cups/model/Epson/epson-inkjet-printer-escpr2 \
    "${pkgdir}/usr/share/ppd/epson-inkjet-printer-escpr2"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s ../../doc/epson-inkjet-printer-escpr2/COPYING \
    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  ln -s ../../doc/epson-inkjet-printer-escpr2/COPYING.LIB.gz \
    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.LIB.gz"
  ln -s ../../doc/epson-inkjet-printer-escpr2/COPYING.EPSON.gz \
    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.EPSON.gz"
}
