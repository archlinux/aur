# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ih8rtcgui
pkgver=0.0.4
_electronversion=25
pkgrel=3
pkgdesc="RTC Jazz (EWM) simple desktop application to manage/view workitems"
arch=('x86_64')
url="https://github.com/kenny59/ih8rtcgui"
license=('custom')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'npm'
    'nodejs'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}"
    "${pkgname}.sh")
sha256sums=('SKIP'
            '1c5d56c725567d14d63de7e88a0031cde456f7fb5d64a03c37cbedca05b8b902')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@asar@|app|g" \
        -i "${srcdir}/${pkgname}.sh"
    gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/npm_cache"
    sed "s|--win|--linux AppImage|g" -i package.json
    npm install
    npm run build
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked//LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}