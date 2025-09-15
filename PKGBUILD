# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=frappe-books-bin
_pkgname='Frappe Books'
pkgver=0.34.0
_electronversion=22
pkgrel=1
pkgdesc="Modern desktop accounting for freelancers and small-businesses.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
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
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.x86_64.rpm")
sha256sums=('31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_aarch64=('554905d17790bcdea7e945a8712334fb8ec4c1073d40bf3bec928f2f65d7dcc9')
sha256sums_x86_64=('5833f8263939c59e64ac5de7fc63fe4224df864f8a015af8772a26bfd51a3e2e')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/opt/${_pkgname}/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
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