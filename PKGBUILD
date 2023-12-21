# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=yt-music-player
_pkgname="YouTube Music"
pkgver=2.0.0
_electronversion=15
pkgrel=1
pkgdesc="YouTube Music player that runs in your system tray/menu"
arch=('any')
url="https://github.com/TBR-Development/YT-Music-Player"
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'nodejs'
    'yarn'
    'gendesk'
    'git'
)
source=(
    "${pkgname}::git+${url}.git#tag=${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '5ce46265f0335b03568aa06f7b4c57c5f8ffade7a226489ea39796be91a511bf')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@appasar@|app|g" \
        -i "${srcdir}/${pkgname}.sh"
    gendesk -q -f -n --categories "AudioVideo" --name "${_pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}"
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    yarn install --cache-folder "${srcdir}/.yarn_cache"
    yarn package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}/out/${_pkgname}-linux-"*/swiftshader/* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    cp -r "${srcdir}/${pkgname}/out/${_pkgname}-linux-"*/resources/app "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644  "${srcdir}/${pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}