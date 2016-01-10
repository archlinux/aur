# Maintainer: Alistair Grant <akgrant0710 at gmail dot com>
# Copied from iscan-plugin-gt-f720:
# _Maintainer Muflone http://www.muflone.com/contacts/english/
# _Contributor Ian Heafer <archlinux at studio oneword turnip dot net>
# _Contributor Gianni Vialetto <g dot vialetto at gmail dot com>
# _Contributor Brian Miller :
# _Contributor Tom Kuther <gimpel@sonnenkinder.org>
# _Contributor Andrew Kotsyuba <avallach2000@gmail.com>
#
# Note: This will probably also work for the V37, but is untested.

pkgname=iscan-plugin-perfection-v370
pkgver=1.0.0
pkgrel=1
pkgdesc="EPSON Image Scan! plugin for Epson Perfection V370 scanner"
arch=('i686' 'x86_64')
url="http://support.epson.net/linux/en/iscan.php?model=perfection-v370&version=1.0.0"
license=('custom:AVASYSPL')
depends=('iscan' 'iscan-data')
source_i686=("https://download2.ebz.epson.net/iscan/plugin/perfection-v370/deb/x86/iscan-perfection-v370-bundle-${pkgver}.x86.deb.tar.gz")
source_x86_64=("https://download2.ebz.epson.net/iscan/plugin/perfection-v370/deb/x64/iscan-perfection-v370-bundle-${pkgver}.x64.deb.tar.gz")
sha256sums_i686=('502b03830c28e13c2a653250c61c522b4bef236a460d2ada354537aa97abaa24')
sha256sums_x86_64=('72e76642798abab25b935413b105f36c88474041e486d3216c861f584ced6f76')
install="${pkgname}.install"

if [ "$CARCH" = 'x86_64' ]
then
  _filearch=x64
  _debarch=amd64
else
  _filearch=x86
  _debarch=i386
fi

_bundle_name=iscan-perfection-v370-bundle-${pkgver}.${_filearch}.deb

build() {
  cd "${srcdir}/${_bundle_name}/core"
  ar xf iscan_2.30.1-1~usb0.1.ltdl7_amd64.deb
  bsdtar -xf data.tar.gz

  cd "${srcdir}/${_bundle_name}/plugins"
  bsdtar -xf iscan-plugin-perfection-v370_1.0.0-2_${_debarch}.deb
  bsdtar -xf data.tar.gz
  gzip -fkd "usr/share/doc/iscan-plugin-perfection-v370/NEWS.gz"
}

package() {
  cd "${srcdir}/${_bundle_name}/core"
#  install -m 755 -d "${pkgdir}/etc/sane.d"
#  install -m 644 -t "${pkgdir}/etc/sane.d" "etc/sane.d/epkowa.conf"

  cd "${srcdir}/${_bundle_name}/plugins"
  install -m 755 -d "${pkgdir}/usr/share/iscan"
  install -m 644 -t "${pkgdir}/usr/share/iscan" "usr/share/iscan/esfwdd.bin"
  install -m 755 -d "${pkgdir}/usr/share/iscan-data/device"
  install -m 644 -t "${pkgdir}/usr/share/iscan-data/device" "usr/share/iscan-data/device/47542d46373430.xml"
  install -m 644 -t "${pkgdir}/usr/share/iscan-data/device" "usr/share/iscan-data/device/47542d53363430.xml"

  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 "usr/share/doc/${pkgname}/AVASYSPL.en.txt" "${pkgdir}/usr/share/licenses/${pkgname}/AVASYSPL"

  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "usr/share/doc/${pkgname}"/{NEWS,README}

  install -m 755 -d "${pkgdir}/usr/lib/iscan"
  install -m 644 -t "${pkgdir}/usr/lib/iscan" "usr/lib/iscan/libiscan-plugin-perfection-v370.so.0.0.0"
  cd "${pkgdir}/usr/lib/iscan"
  ln -s libiscan-plugin-perfection-v370.so.0.0.0 libiscan-plugin-perfection-v370.so
  ln -s libiscan-plugin-perfection-v370.so.0.0.0 libiscan-plugin-perfection-v370.so.0
}
