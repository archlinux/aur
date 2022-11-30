# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>
pkgname=easyeda-pro-electron
_pkgname=${pkgname%-electron}
pkgver=1.8.39
pkgrel=1
pkgdesc="EasyEDA Professional Edition. Run with system electron."
arch=('any')
url="https://pro.easyeda.com/"
license=('custom')
depends=('electron19')
makedepends=()
provides=(${_pkgname})
conflicts=(${_pkgname} ${_pkgname}-git ${_pkgname} ${_pkgname}-bin)
install=${pkgname}.install
source=("${_pkgname}-${pkgver}.zip::https://image.easyeda.com/files/easyeda-pro-linux-x64-${pkgver}.zip"
        "LICENSE"
        "${_pkgname}.sh"
        "${pkgname}.install")
sha256sums=('989319b4f876ac6c275d6bbef50acb606fcc5a54b1f3e4a94e5d1c33f8ca0707'
            'c25d162b032c680a34856d65062aa7ffab56a478ee972eeb3e78543d2eb40f74'
            '0dda63f830844a61609442afad8b4838bd523c5a7a4f5df7a0d14331d2277777'
            'cc1661c75c9366d2fe43c4b864cf81acb9aae7cab505ce21e7de2db3c68cde76')

package() {
    cd ${srcdir}
    install -Dm755 ${_pkgname}.sh ${pkgdir}/usr/bin/${_pkgname}
    install -Dm644 LICENSE        ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

    cd ${srcdir}/${_pkgname}-linux-x64
	install -dm755  ${pkgdir}/usr/lib/${_pkgname}
    cp -r resources ${pkgdir}/usr/lib/${_pkgname}
    cp -r locales   ${pkgdir}/usr/lib/${_pkgname}

    # icon
    local _icon
    for _icon in 16 32 64 128 256 512; do
        install -Dm644 icon/icon_${_icon}x${_icon}.png \
                       ${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps/${_pkgname}.png
    done
    install -Dm644 icon/icon_512x512@2x.png \
                   ${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${_pkgname}.png

    # desktop entry
    install -Dm644 EasyEDA-PRO.dkt \
                   ${pkgdir}/usr/share/applications/${_pkgname}.desktop

    sed -i 's|/opt/easyeda-pro/icon/icon_128x128.png|easyeda-pro|g' \
        ${pkgdir}/usr/share/applications/${_pkgname}.desktop
    sed -i 's|/opt/easyeda-pro/||g' \
        ${pkgdir}/usr/share/applications/${_pkgname}.desktop
}
