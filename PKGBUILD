# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=frappe-books-bin
_pkgname='Frappe Books'
pkgver=0.32.0
_electronversion=22
pkgrel=1
pkgdesc="Modern desktop accounting for freelancers and small-businesses.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://frappebooks.com/"
_ghurl="https://github.com/frappe/books"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "frappebooks"
)
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'asar'
)
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.${CARCH}.rpm"
    "${pkgname%-bin}.sh"
)
sha256sums=('9318f45e7590521f62820f94c9909749cc9cb2ff83f87404e679a8fe7cd54ce1'
            'f2fe8c189974ffb9d445e9a42bd4f1d5b60185607c3fcafae79ab44be224e013')
_get_electron_version() {
    _electronversion="$(strings "${srcdir}/opt/${_pkgname}/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_electronversion}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _get_electron_version
    sed -i -e "
        s/\"\/opt\/${_pkgname}\/${pkgname%-bin}\"/${pkgname%-bin}/g
        s/Finance/Utility/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed -i -e "
        s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g
        s/\"..\/creds\/log_creds.txt\"/\".\/creds\/log_creds.txt\"/g
        s/\"..\", \"..\",/\"..\",/g
        s/\`..\/translations\/\${code}.csv\`/\`.\/translations\/\${code}.csv\`/g
        s/\`..\/..\/translations\/\${code}.csv\`/\`.\/translations\/\${code}.csv\`/g
        s/\`..\/templates\`/\`.\/templates\`/g
    " "${srcdir}/app.asar.unpacked/main.js"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/"{creds,templates,translations} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}
