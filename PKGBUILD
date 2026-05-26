# Maintainer: HarryLoong <local>

pkgname=epson-inkjet-printer-l8050
pkgver=1.1.12
pkgrel=1
pkgdesc='Epson ESC/P-R2 printer driver (L8050/L8058/L6160 etc.), from UOS signed DEB'
arch=('x86_64' 'aarch64')
url='https://www.epson.com.cn/services/supportproduct.html?p=53ce92f1e56342f8b89981ee9b461572&tab=1'
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later' 'custom:Epson')
depends=('cups' 'glibc' 'libcups')
optdepends=('colord: color profile support')
provides=('epson-inkjet-printer-escpr2')
install=${pkgname}.install
conflicts=('epson-inkjet-printer-escpr2')
options=('!debug' '!strip')

_pkgver=${pkgver//./_}
_uosver=21
_baseurl='https://eposs.epson.com.cn/EPSON/assets/resource/Download/Service/driver/Inkjet/L8058'
_debname="signed_epson-inkjet-printer-escpr2_${_pkgver}_UOS_${_uosver}"

source_x86_64=("${_debname}_amd64.deb::${_baseurl}/${_debname}_amd64.deb")
source_aarch64=("${_debname}_arm64.deb::${_baseurl}/${_debname}_arm64.deb")

sha256sums_x86_64=('b28f668b8a6248ce2dc950af6904ec5b4ec138d99b87a61bb3de5241d5021a3c')
sha256sums_aarch64=('b5262ea984320a1404561c479895c43ac4bc0f07ffda9e0216e7404a800bcfca')

noextract=("${_debname}_amd64.deb" "${_debname}_arm64.deb")

# Resolve architecture-specific source filename
if [ "$CARCH" = "x86_64" ]; then
  _srcdeb="${_debname}_amd64.deb"
elif [ "$CARCH" = "aarch64" ]; then
  _srcdeb="${_debname}_arm64.deb"
fi

prepare() {
  ar x "${_srcdeb}" data.tar.xz
}

package() {
  tar --no-same-owner -xJf data.tar.xz -C "${pkgdir}"

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
