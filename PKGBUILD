# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=opencomic
_pkgname=OpenComic
pkgver=1.1.0
_electronversion=25
pkgrel=1
pkgdesc="Comic and Manga reader, written with Node.js and using Electron"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/ollm/OpenComic"
license=('GPL3')
conflicts=("${pkgname}")
depends=(    
    "electron${_electronversion}"
    'hicolor-icon-theme'
    'java-runtime'
    'lib32-gcc-libs'
    'lib32-glibc'
    'libvips'
)
makedepends=(
    'gendesk'
    'npm'
    'nodejs'
    'git'
    'make'
    'gcc'
)
source=(
    "${pkgname}.git::git+${url}#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            'd4272fed78cdcacd9edfb019134ac485d65b43f4d8c7a4179edbaed56af9b231')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname}.sh"
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    npm install
    if [ "${CARCH}" == "aarch64" ];then
        npm run build-appimage-arm
    elif [ "${CARCH}" == "x86_64" ];then
        npm run build-appimage
    fi
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}.git/dist/linux-"*/resources/{app.asar.unpacked,app-update.yml} "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/images/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}