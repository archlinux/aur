# Maintainer: Jean-Marc Lenoir <archlinux "at" jihemel "dot" com>

pkgname=iscan-plugin-gt-f700
pkgver=1.0.0
pkgrel=1
pkgdesc="EPSON Image Scan! plugin for Epson scanners (Perfection V350 Photo)"
arch=('i686' 'x86_64')
url="https://epson.com/Support/Scanners/Perfection-Series/Epson-Perfection-V350-Photo/s/SPT_B11B185011"
license=('custom:AVASYSPL')
depends=('iscan')
_plugin=${pkgname/iscan-plugin-/}
_iscan_ver=1.0.0
_plugin_rel=1
_file_ver=2.1.2
source_i686=("https://download2.ebz.epson.net/iscan/plugin/${_plugin}/deb/x86/iscan-${_plugin}-bundle-${_iscan_ver}.x86.deb.tar.gz")
source_x86_64=("https://download2.ebz.epson.net/iscan/plugin/${_plugin}/deb/x64/iscan-${_plugin}-bundle-${_iscan_ver}.x64.deb.tar.gz")
sha256sums_i686=('6d8caea316a8731898871cfb0c5a063479d94435c0bb1f34ffe3e2dde374f729')
sha256sums_x86_64=('effffe4a78d5abe7d4148186f15ad50fe96459e9083968a8c7d3ee1b4688b6f2')
install="${pkgname}.install"

if [ "$CARCH" = 'x86_64' ]
then
  _filearch=x64
  _debarch=amd64
else
  _filearch=x86
  _debarch=i386
fi

build() {
  cd "iscan-${_plugin}-bundle-${_iscan_ver}.${_filearch}.deb/plugins"
  bsdtar -xf "iscan-plugin-${_plugin}_${_file_ver}-${_plugin_rel}_${_debarch}.deb"
  bsdtar -xf data.tar.gz
}

package() {
  cd "iscan-${_plugin}-bundle-${_iscan_ver}.${_filearch}.deb/plugins/usr"
  # Install plugins
  install -m 755 -d "${pkgdir}/usr/lib/iscan"
  install -m 644 -t "${pkgdir}/usr/lib/iscan" "lib/iscan/libesint68.so.2.0.1"
  ln -s "libesint68.so.2.0.1" "${pkgdir}/usr/lib/iscan/libesint68.so"
  ln -s "libesint68.so.2.0.1" "${pkgdir}/usr/lib/iscan/libesint68.so.2"
  # Install firmwares
  install -m 755 -d "${pkgdir}/usr/share/iscan"
  install -m 644 -t "${pkgdir}/usr/share/iscan" "share/iscan/esfw68.bin"
  # Install licenses
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 "share/doc/${pkgname}/AVASYSPL.en.txt" "${pkgdir}/usr/share/licenses/${pkgname}/AVASYSPL"
}
