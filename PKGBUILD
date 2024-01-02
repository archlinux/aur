# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=meteor
pkgname="${_appname}-todo-desktop"
_pkgname=Meteor
pkgver=2.0.1
_electronversion=22
pkgrel=1
pkgdesc="A meter based ToDo List. used Electron-Vue"
arch=("x86_64")
url="https://hideko.f5.si/project/meteor.html"
_ghurl="https://github.com/Hideko-Dev/Meteor"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
)
makedepends=(
    'gendesk'
    'nodejs'
    'npm'
    'git'
)
source=(
    "${pkgname}::git+${_ghurl}.git#tag=${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '5ce46265f0335b03568aa06f7b4c57c5f8ffade7a226489ea39796be91a511bf')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname}.sh"
    gendesk -q -f -n --categories "Utility" --pkgname "${_appname}-todo-desktop" --name "${_pkgname}" --exec "${pkgname} %U"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    #export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    #export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    #export ELECTRONVERSION="${_electronversion}"
    cd "${srcdir}/${pkgname}"
    sed "s|--windows --linux --mac|--linux|g" -i package.json
    npm install
    npm run postinstall
    npm run pre-electron-pack
    npm run electron-pack
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname}/assets/png/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}/assets/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}