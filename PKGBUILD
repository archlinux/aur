# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
_pkgname="Snap4Arduino_desktop-gnu"
pkgname="snap4arduino"
pkgver="1.2.1"
pkgrel="1"
pkgdesc="A modification of the Snap! visual programming language that lets you seamlessly interact with almost all versions of the Arduino board."
arch=('i686' 'x86_64')
url="http://snap4arduino.org/"
license=('GPL3')
depends=('nss' 'libxtst' 'alsa-lib' 'libxss' 'gtk2' 'gconf' 'freetype2-ubuntu')
provides=("${pkgname}")

source_i686=("http://${pkgname}.org/downloads/${pkgver}/Snap4Arduino_desktop-gnu-32_${pkgver}.tar.gz")
source_x86_64=("http://${pkgname}.org/downloads/${pkgver}/Snap4Arduino_desktop-gnu-64_${pkgver}.tar.gz")

sha256sums_i686=('ece65ce5b901b29d70e54494f757aa46e439911a7192f3c861b36a8cb9f9f580')
sha256sums_x86_64=('3192a572384e28d49c6549fd038d5e47e9739c0a6e4b2b4e1b853c72630413bd')

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
    install -d ${pkgdir}/opt/${pkgname}/{icons,lib,locales,pnacl}
    install -m 644 icons/* "${pkgdir}/opt/${pkgname}/icons/"
    install -m 755 lib/* "${pkgdir}/opt/${pkgname}/lib/"
    install -m 644 locales/* "${pkgdir}/opt/${pkgname}/locales/"
    install -m 644 pnacl/* "${pkgdir}/opt/${pkgname}/pnacl/"
    rm -rf ./{icons,lib,locales,pnacl}
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
