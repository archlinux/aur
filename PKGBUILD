# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Maintainer: Facundo Tuesca  <facutuesca AT gmail DOT com>

_watch=('http://support.epson.net/linux/src/scanner/iscan/')

pkgname=iscan-plugin-perfection-v330
pkgver=1.0.0
pkgrel=4
pkgdesc="EPSON Image Scan! plugin for Epson scanners GT-F730, GT-S630, Perfection V33, Perfection V330 Photo"
_plugin=${pkgname/iscan-plugin-/}
_iscan_ver=2.30.4
arch=('i686' 'x86_64')
url="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom')
depends=('iscan-for-epson-v500-photo')
install="${pkgname}.install"
source_i686=("https://download2.ebz.epson.net/iscan/plugin/perfection-v330/rpm/x86/iscan-${_plugin}-bundle-${_iscan_ver}.x86.rpm.tar.gz")
source_x86_64=("https://download2.ebz.epson.net/iscan/plugin/perfection-v330/rpm/x64/iscan-${_plugin}-bundle-${_iscan_ver}.x64.rpm.tar.gz")
sha256sums_i686=('3e476c49f17c306fe4fb5930f2049dd3feb95673e4b5b3b13a1b4e755fba0d17')
sha256sums_x86_64=('118d518f7c9c3288f97988094abc5958c7840845e2c16ba7b52839ed2e01cc14')

if [[ $CARCH = x86_64 ]]; then
  _filearch=x64
  _64=64
else
  _filearch=x86
fi

prepare() {
    cd "iscan-${_plugin}-bundle-${_iscan_ver}.${_filearch}.rpm/plugins"
    bsdtar -xf "esci-interpreter-${_plugin}-${pkgver}-1.${CARCH}.rpm"
}

package() {
    cd "iscan-${_plugin}-bundle-${_iscan_ver}.${_filearch}.rpm/plugins/usr"
    # install plugin
    install -Dm 755 -t "${pkgdir}/usr/lib/esci" "lib${_64}/esci/libesci-interpreter-${_plugin}.so.0.0.0"
    ln -s "libesci-interpreter-${_plugin}.so.0.0.0" "${pkgdir}/usr/lib/esci/libesci-interpreter-${_plugin}.so"
    ln -s "libesci-interpreter-${_plugin}.so.0.0.0" "${pkgdir}/usr/lib/esci/libesci-interpreter-${_plugin}.so.0"    
    # install firmware
    install -Dm 644 -t "${pkgdir}/usr/share/esci" "share/esci/esfwad.bin"
    # install shared data
    install -Dm 644 -t "${pkgdir}/usr/share/iscan-data/device" share/iscan-data/device/47542d{4637,5336}3330.xml
    # install license
    install -Dm 644 "share/doc/esci-interpreter-${_plugin}-${pkgver}/COPYING.EPSON.en.txt" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.EPSON"
}
