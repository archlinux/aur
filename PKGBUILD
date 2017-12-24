# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
_pkgname="Snap4Arduino_desktop-gnu"
pkgname="snap4arduino"
pkgver="1.2.4"
pkgrel="1"
pkgdesc="A modification of the Snap! visual programming language that lets you seamlessly interact with almost all versions of the Arduino board."
arch=('i686' 'x86_64')
url="http://snap4arduino.rocks/"
license=('GPL3')
depends=('nss' 'libxtst' 'alsa-lib' 'libxss' 'gtk2' 'gconf' 'freetype2')
provides=("${pkgname}")

source_i686=("https://github.com/bromagosa/${pkgname}/releases/download/${pkgver}/${_pkgname}-32_${pkgver}.tar.gz")
source_x86_64=("https://github.com/bromagosa/${pkgname}/releases/download/${pkgver}/${_pkgname}-64_${pkgver}.tar.gz")

sha256sums_i686=('e25d5c06be8fec042d5853e73386738bfb39e6ab772cf4b95c86122468dca6ad')
sha256sums_x86_64=('cde1c6fc16fd24e2d004c0bcc3a5156e515926a0a61305c895151b797674a705')

if [[ $CARCH == i686 ]]; then
    _dir="32";
else
    _dir="64";
fi

build() {
    cd "${_pkgname}-${_dir}_${pkgver}"
    sed -i "s|Icon=|Icon=/opt/Snap4Arduino/icons/128x128x32.png|g" Snap4Arduino.desktop
    sed -i "s|cd \$(dirname %k)|cd /opt/Snap4Arduino/|g" Snap4Arduino.desktop
}

package() {
    cd "${_pkgname}-${_dir}_${pkgver}"

    # Data
    install -d ${pkgdir}/opt/${pkgname}/{icons,lib,locales,pnacl,swiftshader}
    install -m 644 icons/* "${pkgdir}/opt/${pkgname}/icons/"
    install -m 755 lib/* "${pkgdir}/opt/${pkgname}/lib/"
    install -m 644 locales/* "${pkgdir}/opt/${pkgname}/locales/"
    install -m 644 pnacl/* "${pkgdir}/opt/${pkgname}/pnacl/"
    install -m 644 swiftshader/* "${pkgdir}/opt/${pkgname}/swiftshader/"
    rm -rf ./{icons,lib,locales,pnacl,swiftshader}
    chmod +x ${pkgdir}/opt/${pkgname}/pnacl/*_nexe
    
    # Desktop file
    install -Dm 644 Snap4Arduino.desktop "${pkgdir}/usr/share/applications/Snap4Arduino.desktop"
    rm Snap4Arduino.desktop

    # License
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm LICENSE

    # Rest of data
    install -m 644 ./* "${pkgdir}/opt/${pkgname}/"

    # Fix for permissions
    chmod +x ${pkgdir}/opt/${pkgname}/{chromedriver,launcher*,minidump_stackwalk,nacl_*,nwjc,payload,run}
}

# vim:set ts=4 sw=2 ft=sh et:
