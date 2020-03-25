# Maintainer: Jean-Marc Lenoir <archlinux "at" jihemel "dot" com>

pkgname=iscan-plugin-gt-f700
pkgver=2.30.4
pkgrel=1
pkgdesc="EPSON Image Scan! plugin for Epson scanners (Perfection V350 Photo)"
arch=('i686' 'x86_64')
url="https://epson.com/Support/Scanners/Perfection-Series/Epson-Perfection-V350-Photo/s/SPT_B11B185011"
license=('custom:EPSON EULA')
depends=('iscan')
install="${pkgname}.install"

_plugin=${pkgname/iscan-plugin-/}
_plugin_rel=1
_plugin_ver=2.1.3
if [ "$CARCH" = 'x86_64' ]
then
  _filearch=x64
  _debarch=amd64
else
  _filearch=x86
  _debarch=i386
fi
source_i686=("https://download2.ebz.epson.net/iscan/plugin/${_plugin}/deb/x86/iscan-${_plugin}-bundle-${pkgver}.x86.deb.tar.gz")
source_x86_64=("https://download2.ebz.epson.net/iscan/plugin/${_plugin}/deb/x64/iscan-${_plugin}-bundle-${pkgver}.x64.deb.tar.gz")
sha256sums_i686=('726f2be09354654de027beb48c84aa3096af2511d4a3f943f7cca6c8ba91dc11')
sha256sums_x86_64=('2bc95e5972b83e05fef0dbc60731312941c8239509b1e251cc5a55e62c842e00')


prepare(){
  cd "${srcdir}/iscan-${_plugin}-bundle-${pkgver}.${_filearch}.deb"/plugins
  ar x "iscan-plugin-${_plugin}_${_plugin_ver}-${_plugin_rel}_${_debarch}.deb"
  tar -zxf data.tar.gz
  # licenses
  gunzip -f "usr/share/doc/${pkgname}"/{COPYING.EPSON.en.txt,COPYING.EPSON.ja.txt}.gz
}

package(){
  cd "${srcdir}/iscan-${_plugin}-bundle-${pkgver}.${_filearch}.deb"/plugins
  # Install plugins
  install -m 755 -d "${pkgdir}"/usr/lib/iscan
  install -m 755 -t "${pkgdir}"/usr/lib/iscan usr/lib/iscan/libesint68.so.2.0.1
  ln -sf libesint68.so.2.0.1 "${pkgdir}"/usr/lib/iscan/libesint68.so.2
  ln -sf libesint68.so.2.0.1 "${pkgdir}"/usr/lib/iscan/libesint68.so
  # Install firmwares
  install -m 755 -d "${pkgdir}"/usr/share/iscan
  install -m 644 -t "${pkgdir}"/usr/share/iscan/ usr/share/iscan/esfw68.bin
  # Install licenses
  install -m 755 -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
  install -m 644 usr/share/doc/"${pkgname}"/{COPYING.EPSON.en.txt,COPYING.EPSON.ja.txt,copyright} "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
