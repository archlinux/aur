# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Maintainer: Facundo Tuesca  <facutuesca AT gmail DOT com>

pkgname=iscan-plugin-perfection-v330
pkgver=1.0.0
pkgrel=2
pkgdesc="EPSON Image Scan! plugin for Epson scanners GT-F730, GT-S630, Perfection V33, Perfection V330 Photo"
_plugin=${pkgname/iscan-plugin-/}
_iscan_ver=2.30.4
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom')
depends=('iscan')
install="${pkgname}.install"
source_i686=("https://download2.ebz.epson.net/iscan/plugin/perfection-v330/rpm/x86/iscan-${_plugin}-bundle-${_iscan_ver}.x86.rpm.tar.gz")
source_x86_64=("https://download2.ebz.epson.net/iscan/plugin/perfection-v330/rpm/x64/iscan-${_plugin}-bundle-${_iscan_ver}.x64.rpm.tar.gz")
sha256sums_i686=('23e9f5594f4194016e19d6807c38bbbc4929fd4bcddb64b53b984cef47b06d56')
sha256sums_x86_64=('38082e6c080fbbfb96fa005bd8e42b36728ad6ebeff5084b677b3ee6ea2b389a')

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
    install -Dm 644 -t "${pkgdir}/usr/share/iscan-data/device" share/iscan-data/device/{47542d46373330,47542d53363330}.xml
    # install license
	install -Dm 644 "share/doc/esci-interpreter-${_plugin}-${pkgver}/COPYING.EPSON.en.txt" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.EPSON"
}
