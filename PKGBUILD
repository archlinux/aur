# Maintainer: Vasilly Prokopyev <Vasilly.Prokopyev at google mail>
# Contributor: 欠陥電気 <misaka13514 at google mail>

pkgname=easyeda-bin
_pkgname=${pkgname%-bin}
pkgver=6.5.36
pkgrel=1
pkgdesc="A Simple and Powerful Electronic Circuit Design Tool"
arch=('x86_64')
url="https://easyeda.com/"
license=('custom')
depends=('gtk3' 'nss' 'libxss' 'alsa-lib')
makedepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.zip::https://image.easyeda.com/files/${_pkgname}-linux-x64-${pkgver}.zip"
        "LICENSE")
sha256sums=('d8835cea7545f13de64c3da98ba4e0d02a0bf04b1862405081ec0b27c1b9c250'
            '37f229a8fa5de9f1e1af1ad2046295a4837bfe3b0e1272cbb9d9f6c5747d2f10')

package() {
    install -dm755 ${pkgdir}/opt/${_pkgname}
    mv ${srcdir}/easyeda-linux-x64/* ${pkgdir}/opt/${_pkgname}

    # icon
    local _icon
    for _icon in 16 32 48 64 128 256; do
        install -Dm644 ${pkgdir}/opt/${_pkgname}/icon/${_icon}x${_icon}/${_pkgname}.png \
                       ${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps/${_pkgname}.png
    done
    rm -rf ${pkgdir}/opt/${_pkgname}/icon

    # desktop entry
    install -Dm644 ${pkgdir}/opt/${_pkgname}/EASYEDA.dkt \
                   ${pkgdir}/usr/share/applications/${_pkgname}.desktop

    sed -i 's|/opt/easyeda/icon/128x128/easyeda.png|easyeda|g' \
        ${pkgdir}/usr/share/applications/${_pkgname}.desktop
    sed -i 's|/opt/easyeda/||g' \
        ${pkgdir}/usr/share/applications/${_pkgname}.desktop
    rm -rf ${pkgdir}/opt/${_pkgname}/EASYEDA.dkt

    # soft link
    install -dm755 ${pkgdir}/usr/bin
    ln -s /opt/${_pkgname}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
    chmod 755 ${pkgdir}/opt/${_pkgname}/${_pkgname}

    # LICENSE
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
