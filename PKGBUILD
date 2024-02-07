# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ringer-client-desktop
_pkgname=Ringer
pkgver=4.0.0
_electronversion=28
pkgrel=1
pkgdesc="A new cross platform messaging app"
arch=('any')
url="https://github.com/Lif-Platforms/Ringer-Client-Desktop"
license=('GPL-2.0-only')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
    'python'
    'nodejs'
)
makedepends=(
    'yarn'
    'npm'
    'git'
)
options=(
    '!strip'
)
source=(
    "${pkgname}.git::git+${url}#tag=${pkgver}"
    "${pkgname}.desktop"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '5ae75de25c7204dba7bfbbbe3c9f58cf6f565963359735a471e1f61ee8692181'
            '0fb7b939a071f4a08476bdd5aa143d2aa8cd335c83309f9919be16cd5c3e2014')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@runname@|app|g" \
        -i "${srcdir}/${pkgname}.sh"
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export ELECTRONVERSION="${_electronversion}"
    export npm_config_disturl="https://electronjs.org/headers"
    HOME="${srcdir}/.electron-gyp"
    sed "s|development|production|g" -i .env
    yarn install --cache-folder "${srcdir}/.yarn_cache"
    npx electron-packager . "${_pkgname}" --platform=linux --out=out
    rm -rf "${srcdir}/${pkgname}.git/out/${_pkgname}-linux-"*/resources/app/node_modules/.cache
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}.git/out/${_pkgname}-linux-"*/resources/app "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/public/${_pkgname}-Icon-Production.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}