# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
_pkgname="Snap4Arduino_desktop-gnu"
_tname="Snap4Arduino"
pkgname="snap4arduino"
pkgver="5.1.0"
pkgrel="1"
pkgdesc="A modification of the Snap! visual programming language that lets you seamlessly interact with almost all versions of the Arduino board."
arch=('i686' 'x86_64')
url="http://snap4arduino.rocks/"
license=('AGPL3' 'MIT')
depends=('nss' 'libxtst' 'alsa-lib' 'libxss' 'gtk3' 'gconf' 'freetype2')
options=('!strip')

source_i686=("${_pkgname}-32_${pkgver}.tar.gz::https://github.com/bromagosa/${_tname}/releases/download/${pkgver}/${_pkgname}-32_${pkgver}.tar.gz")
source_x86_64=("${_pkgname}-64_${pkgver}.tar.gz::https://github.com/bromagosa/${_tname}/releases/download/${pkgver}/${_pkgname}-64_${pkgver}.tar.gz")

sha256sums_i686=('0b599275f5d1132335116967ff2983a434c4ae4260395b05292fbfa5562cc312')
sha256sums_x86_64=('52d32af4d73d4568a3bbb1f8f5392c77902a12993a4dc7cdc6575aa67f1da8a0')

if [[ $CARCH == i686 ]]; then
    _dir="32";
else
    _dir="64";
fi

build() {
    cd "${_pkgname}-${_dir}_${pkgver}"
    sed -i "s|Icon=|Icon=/opt/${_tname}/icons/128x128x32.png|g" ${_tname}.desktop
    sed -i "s|'cd \$(dirname %k)|\"cd /opt/${_tname}/|g" ${_tname}.desktop
    sed -i "s|launcher.sh'|run\"|g" ${_tname}.desktop
}

package() {
    cd "${_pkgname}-${_dir}_${pkgver}"

    # Data
    install -d ${pkgdir}/opt/${_tname}/{icons,lib,locales,pnacl,swiftshader}
    install -d ${pkgdir}/usr/share/{applications,licenses}
    install -m 644 icons/* "${pkgdir}/opt/${_tname}/icons/"
    install -m 755 lib/* "${pkgdir}/opt/${_tname}/lib/"
    install -m 644 locales/* "${pkgdir}/opt/${_tname}/locales/"
    install -m 644 pnacl/* "${pkgdir}/opt/${_tname}/pnacl/"
    install -m 644 swiftshader/* "${pkgdir}/opt/${_tname}/swiftshader/"
    rm -rf ./{icons,lib,locales,pnacl,swiftshader}
    chmod +x ${pkgdir}/opt/${_tname}/pnacl/*_nexe

    # Desktop file
    install -D -m 644 ${_tname}.desktop "${pkgdir}/usr/share/applications/${_tname}.desktop"
    rm ${_tname}.desktop

    # License
    install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm LICENSE

    # Rest of data
    install -m 644 ./* "${pkgdir}/opt/${_tname}/"

    # Fix for permissions
    chmod +x ${pkgdir}/opt/${_tname}/{chromedriver,launcher*,minidump_stackwalk,nacl_*,nwjc,payload,run}
}

# vim:set ts=4 sw=4 et syn=sh ft=sh:
