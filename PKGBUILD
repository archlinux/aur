# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=opencomic
_pkgname=OpenComic
pkgver=1.0.0_beta.5
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
    'electron25'
    'hicolor-icon-theme'
    'gconf'
    'libnotify'
    'libappindicator-gtk3'
    'libxtst'
    'nss'
    'java-runtime'
    'lib32-gcc-libs'
    'lib32-glibc'
    'libvips'
)
makedepends=(
    'asar'
    'gendesk'
    'npm>=8.9.0'
    'nodejs'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${url}#tag=v${pkgver//_/-}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '6c05c055f05066dafc59862fc8b7d2c170c492e2b550a9b325aa3fc3ed5de0a7')
build() {
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install --cache "${srcdir}/npm-cache"
    if [ "${CARCH}" == "aarch64" ];then
        npm run build-appimage-arm
    elif [ "${CARCH}" == "x86_64" ];then
        npm run build-appimage
    fi
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/"{app.asar.unpacked,app-update.yml} "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/images/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}