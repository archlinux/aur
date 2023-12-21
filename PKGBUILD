# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ih8rtcgui
pkgver=0.0.7
_electronversion=25
pkgrel=1
pkgdesc="RTC Jazz (EWM) simple desktop application to manage/view workitems"
arch=('x86_64')
url="https://github.com/kenny59/ih8rtcgui"
license=('ISC')
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
    "${pkgname}::git+${url}.git#tag=v${pkgver}"
    "${pkgname}.sh")
sha256sums=('SKIP'
            '5ce46265f0335b03568aa06f7b4c57c5f8ffade7a226489ea39796be91a511bf')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@asar@|app|g" \
        -i "${srcdir}/${pkgname}.sh"
    gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    sed "s|--win|--linux AppImage|g" -i package.json
    npm install
    npm run build
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}/dist/linux-unpacked/resources/app" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}/dist/linux-unpacked//LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}