# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mkfont
pkgver=1.2.2
_electronversion=24
pkgrel=5
pkgdesc="A free (libre) tool to create & export fonts from existing assets. Component-based workflow, with advanced features to nit-pick & tweak metrics in a non-destructive way!"
arch=('any')
url="https://nebukam.github.io/mkfont/"
_ghurl="https://github.com/Nebukam/mkfont"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'yarn'
    'npm'
    'nodejs'
    'git'
    'make'
    'gcc'
    'node-gyp'
)
source=(
    "${pkgname}.git::git+${_ghurl}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            'd4272fed78cdcacd9edfb019134ac485d65b43f4d8c7a4179edbaed56af9b231')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname}.sh"
    gendesk -f -n -q --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    #Just build linux packages
    sed "36s|true|false|;70s|false|true|" -i nkmjs.config.json
    yarn install --cache-folder "${srcdir}/.yarn_cache"
    yarn run nkmjs build
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/builds/${pkgver}/desktop/linux-x64.git/linux-"*/resources/app.asar \
        -t  "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/assets/128.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}