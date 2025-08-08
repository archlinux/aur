# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=calmly-writer-bin
_pkgname='Calmly Writer'
pkgver=2.0.60
_electronversion=34
pkgrel=1
pkgdesc="An editor designed to focus on what you want to tell, with a simple, unobtrusive and ease-to-use user interface."
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.calmlywriter.com"
license=('LicenseRef-custom')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
options=('!strip')
depends=(
    "electron${_electronversion}"
)
source_aarch64=("${pkgname%-bin}_${pkgver}-aarch64.rpm::${url}/releases/linux/rpm/arm64/${pkgname%-bin}-${pkgver}.arm64.rpm")
source_x86_64=("${pkgname%-bin}_${pkgver}-x86_64.rpm::${url}/releases/linux/rpm/x64/${pkgname%-bin}-${pkgver}.x86_64.rpm")
source=(
    "LICENSE.html::${url}/eula.htm"
    "${pkgname%-bin}.sh"
)
sha256sums=('ab9ee67a02dca392372a108443df43587671306b91e2d91923728ba770a37e83'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_aarch64=('9a48a3b28679d83a1883e82c06ffae994daeed70e7a5f26802488658f08f2101')
sha256sums_x86_64=('49394a074d9b25d7c42fab83b3547dd1c5b97ad94adf03643bd90648c44dce7c')
_get_electron_version() {
    _electronversion="$(strings "${srcdir}/opt/${_pkgname}/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_electronversion}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _get_electron_version
    sed -i "s/\"\/opt\/${_pkgname}\/${pkgname%-bin}\"/${pkgname%-bin}/g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    rm -rf "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/"{7zip-bin/mac,app-builder-bin/mac,font-list/libs/{darwin,win32}}
    case "${CARCH}" in
        aarch64)
            rm -rf "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/7zip-bin/linux/"{arm,ia32,x64}
            rm -rf "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/app-builder-bin/linux/"{arm,ia32,loong64,riscv64,x64}
            ;;
        x86_64)
            rm -rf "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/7zip-bin/linux/"{arm,arm64,ia32}
            rm -rf "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/app-builder-bin/linux/"{arm,arm64,ia32,loong64,riscv64}
            ;;
    esac
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 32x32 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
