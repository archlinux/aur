# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>
pkgname=easyeda-pro-electron
_pkgname=${pkgname%-electron}
pkgver=1.9.23
pkgrel=1
pkgdesc="EasyEDA Professional Edition. Run with system electron."
arch=('any')
url="https://pro.easyeda.com/"
license=('custom')
depends=('electron' 'libnotify' 'libappindicator-gtk3')
makedepends=()
provides=(${_pkgname})
conflicts=(${_pkgname} ${_pkgname}-git ${_pkgname} ${_pkgname}-bin)
install=${pkgname}.install
source=("${_pkgname}-${pkgver}.zip::https://image.easyeda.com/files/easyeda-pro-linux-x64-${pkgver}.zip"
        "LICENSE"
        "${_pkgname}.sh"
        "${pkgname}.install")
sha256sums=('11b753b8a3bbf6f71b6a87c4e187324758cdf6e34bdd93fd3f6cddb4b020978a'
            'c25d162b032c680a34856d65062aa7ffab56a478ee972eeb3e78543d2eb40f74'
            '89289056ed4b5d051280e3a69dfb550b6914f470f201be1ca3b165ddd4f3e435'
            'cc1661c75c9366d2fe43c4b864cf81acb9aae7cab505ce21e7de2db3c68cde76')

package() {
    cd ${srcdir}
    install -Dm755 ${_pkgname}.sh ${pkgdir}/usr/bin/${_pkgname}
    install -Dm644 LICENSE        ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

    cd ${srcdir}/${_pkgname}
    install -dm755  ${pkgdir}/usr/lib/${_pkgname}
    cp -dpr --no-preserve=ownership resources ${pkgdir}/usr/lib/${_pkgname}
    cp -dpr --no-preserve=ownership locales   ${pkgdir}/usr/lib/${_pkgname}

    # icon
    local _icon
    for _icon in 16 32 64 128 256 512; do
        install -Dm644 icon/icon_${_icon}x${_icon}.png \
                       ${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps/${_pkgname}.png
    done
    install -Dm644 icon/icon_512x512@2x.png \
                   ${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${_pkgname}.png

    # desktop entry
    install -Dm644 easyeda-pro.dkt \
                   ${pkgdir}/usr/share/applications/${_pkgname}.desktop

    sed -i 's|/opt/easyeda-pro/icon/icon_128x128.png|easyeda-pro|g' \
        ${pkgdir}/usr/share/applications/${_pkgname}.desktop
    sed -i 's|/opt/easyeda-pro/||g' \
        ${pkgdir}/usr/share/applications/${_pkgname}.desktop
}
