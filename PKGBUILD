# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Alistair Grant <akgrant0710 at gmail dot com>

pkgname=iscan-plugin-perfection-v370
pkgver=1.0.1
pkgrel=2
pkgdesc="EPSON Image Scan! plugin for Epson scanners (GT-F740, GT-S640, Perfection V37, Perfection V370)"
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:AVASYSPL')
depends=('iscan' 'iscan-data')
_plugin=${pkgname/iscan-plugin-/}
_iscan_ver=1.0.1
_plugin_rel=2
_file_ver=1.0.0
source_i686=("https://download2.ebz.epson.net/iscan/plugin/${_plugin}/deb/x86/iscan-${_plugin}-bundle-${_iscan_ver}.x86.deb.tar.gz")
source_x86_64=("https://download2.ebz.epson.net/iscan/plugin/${_plugin}/deb/x64/iscan-${_plugin}-bundle-${_iscan_ver}.x64.deb.tar.gz")
sha256sums_i686=('f63d65d7d180bc445617ecd5579d55fd9f614291cac5f13548d3cec86384a064')
sha256sums_x86_64=('3ecead560f50d991f3987a9a845393e9690c03d268ef87ea47a4f2a12cb23891')
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
  bsdtar -xf "${pkgname}_${_file_ver}-${_plugin_rel}_${_debarch}.deb"
  bsdtar -xf data.tar.gz
  gzip -fkd "usr/share/doc/${pkgname}/NEWS.gz"
}

package() {
  cd "iscan-${_plugin}-bundle-${_iscan_ver}.${_filearch}.deb/plugins/usr"
  # Install plugins
  install -m 755 -d "${pkgdir}/usr/lib/iscan"
  install -m 644 -t "${pkgdir}/usr/lib/iscan" "lib/iscan/lib${pkgname}.so.0.0.0"
  ln -s "lib${pkgname}.so.0.0.0" "${pkgdir}/usr/lib/iscan/lib${pkgname}.so"
  ln -s "lib${pkgname}.so.0.0.0" "${pkgdir}/usr/lib/iscan/lib${pkgname}.so.0"
  # Install firmwares
  install -m 755 -d "${pkgdir}/usr/share/iscan"
  install -m 644 -t "${pkgdir}/usr/share/iscan" "share/iscan/esfwdd.bin"
  # Install shared data
  install -m 755 -d "${pkgdir}/usr/share/iscan-data/device"
  install -m 644 -t "${pkgdir}/usr/share/iscan-data/device" "share/iscan-data/device/47542d46373430.xml"
  install -m 644 -t "${pkgdir}/usr/share/iscan-data/device" "share/iscan-data/device/47542d53363430.xml"
  # Install documentation
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "share/doc/${pkgname}/NEWS"
  # Install licenses
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 "share/doc/${pkgname}/AVASYSPL.en.txt" "${pkgdir}/usr/share/licenses/${pkgname}/AVASYSPL"
}
