# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Ian Heafer <archlinux at studio oneword turnip dot net>
# Contributor: Gianni Vialetto <g dot vialetto at gmail dot com>
# Contributor: Brian Miller :
# Contributor: Tom Kuther <gimpel@sonnenkinder.org>
# Contributor: Andrew Kotsyuba <avallach2000@gmail.com>

pkgname=iscan-plugin-gt-f720
pkgver=1.0.1
pkgrel=1
pkgdesc="EPSON Image Scan! plugin for Epson scanners (GT-F720, GT-S620, Perfection V30, Perfection V300 Photo)"
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:AVASYSPL')
depends=('iscan')
conflicts=('iscan-plugin-gt-x720')
_plugin=${pkgname/iscan-plugin-/}
_iscan_ver=1.0.0
_plugin_rel=2
_file_ver=0.1.1
source_i686=("https://download2.ebz.epson.net/iscan/plugin/${_plugin}/deb/x86/iscan-${_plugin}-bundle-${_iscan_ver}.x86.deb.tar.gz")
source_x86_64=("https://download2.ebz.epson.net/iscan/plugin/${_plugin}/deb/x64/iscan-${_plugin}-bundle-${_iscan_ver}.x64.deb.tar.gz")
sha256sums_i686=('594523472475bf2c822f77b3f60b78a0eaa2e0affb263e8e1a7c82b43bc94e0c')
sha256sums_x86_64=('c8b36fa3b68ba244cec9f9026bffcfc6d39f5b5a4d9c69f396e83b44b7c9108c')
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
  bsdtar -xf esci-interpreter-${_plugin}_${_file_ver}-${_plugin_rel}_${_debarch}.deb
  bsdtar -xf data.tar.gz
  gzip -fkd "usr/share/doc/esci-interpreter-${_plugin}/NEWS.gz"
}

package() {
  cd "iscan-${_plugin}-bundle-${_iscan_ver}.${_filearch}.deb/plugins/usr"
  install -m 755 -d "${pkgdir}/usr/lib/iscan"
  install -m 644 -t "${pkgdir}/usr/lib/iscan" "lib/esci/libesci-interpreter-gt-f720.so.0.0.0"
  ln -s libesci-interpreter-gt-f720.so.0.0.0 "${pkgdir}/usr/lib/iscan/libesci-interpreter-gt-f720.so"
  ln -s libesci-interpreter-gt-f720.so.0.0.0 "${pkgdir}/usr/lib/iscan/libesci-interpreter-gt-f720.so.0"

  install -m 755 -d "${pkgdir}/usr/share/esci"
  install -m 644 -t "${pkgdir}/usr/share/esci" "share/esci/esfw8b.bin"

  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "share/doc/esci-interpreter-gt-f720"/{NEWS,README}

  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 "share/doc/esci-interpreter-gt-f720/AVASYSPL.en.txt" "${pkgdir}/usr/share/licenses/${pkgname}/AVASYSPL"
}
