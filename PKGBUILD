# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=iscan-plugin-gt-s650
pkgver=1.3.22
pkgrel=2
pkgdesc="EPSON Image Scan! plugin for Epson scanners (DS, EP, ES, ET, EW, L, LX, PX, WF, XP Series, FF-640, GT-S650, Perfection V19, Perfection V39)"
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:AVASYSPL')
depends=('iscan' 'iscan-data')
_plugin=${pkgname/iscan-plugin-/}
_iscan_ver=1.0.0
_plugin_rel=2
_file_ver=1.1.0
source_i686=("https://download2.ebz.epson.net/iscan/plugin/${_plugin}/deb/x86/iscan-${_plugin}-bundle-${_iscan_ver}.x86.deb.tar.gz")
source_x86_64=("https://download2.ebz.epson.net/iscan/plugin/${_plugin}/deb/x64/iscan-${_plugin}-bundle-${_iscan_ver}.x64.deb.tar.gz")
sha256sums_i686=('6f12a5d7b3c1a08a6c5f8762e1cff7ee89063eb73ec723f1822d3fa10c5b50f9')
sha256sums_x86_64=('d27e55652942f7c6e5f7f1b09296b742751c872e3963f8167e1f66fe360d9226')
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
  install -m 644 -t "${pkgdir}/usr/share/iscan" "share/iscan/esfw010c.bin"
  # Install shared data
  install -m 755 -d "${pkgdir}/usr/share/iscan-data/device"
  install -m 644 -t "${pkgdir}/usr/share/iscan-data/device" "share/iscan-data/device/50657266656374696f6e20563139.xml"
  install -m 644 -t "${pkgdir}/usr/share/iscan-data/device" "share/iscan-data/device/50657266656374696f6e20563339.xml"
  # Install documentation
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "share/doc/${pkgname}/NEWS"
  # Install licenses
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 "share/doc/${pkgname}/AVASYSPL.en.txt" "${pkgdir}/usr/share/licenses/${pkgname}/AVASYSPL"
}
