pkgname=webcord
pkgver=3.0.1
pkgrel=1
pkgdesc="A Discord web-based client made with the Electron API."
arch=('any')
url="https://github.com/SpacingBat3/WebCord"
license=('MIT')
depends=('electron>=17')
makedepends=('npm' 'typescript' 'git')
conflicts=("${pkgname}")
options=('!strip' '!emptydirs')

_srcname="WebCord-${pkgver}"

source=(
    "${_srcname}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
    "package.json"
    "buildInfo.json"
    "app.desktop"
)

sha512sums=(
    '92c54c9114b67aed10a87b63ac57ec8f43af52e8d50801cc77ec8c07379dfac4bb6d0fa189b97ba4c09fce4145680bf658f9ad0b21b0fc896bfb669a9d1d36c8'
    '9761e1f579422e478fcf6546658878dbae1e4cd2fcc1e4d107d2a2730b7b6c9671e03ca049c3e8b21447b4dc48f336a01de8aebfeace25d80f0984e1211d2b4f'
    '0c81274928a1dfd2d9adb2f8a7df011bb6d178a00bb4378ff0c9ccd17c6fbc180521c76c79969cd81eac611b9636e04036de906dd5be34cadc370fd93b0d21a4'
    '873224ab8ad4ee1877173136726da3e14686d48426953be57d2d9d5881791a1041517982e9af9c2259b14fb2bd0b63da370995b548d769f17c85348c1a4c3c31'
)

prepare() {
    cd "${srcdir}"
    ELECTRON_SKIP_BINARY_DOWNLOAD=1 npm i

    cd "${_srcname}"
    npm i --omit=dev
    rm -r "sources/code/build"
}

build() {
    cd "${srcdir}/${_srcname}"
    tsc --sourceMap false
}

package() {
    cd "${srcdir}"

    local bin="${pkgname}"
    echo "#!/bin/sh" >"${bin}"
    echo "electron '/usr/lib/${pkgname}' \$@" >>"${bin}"
    install -Dm755 -t "${pkgdir}/usr/bin" "${bin}"

    install -Dm644 "app.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    local lib="${pkgdir}/usr/lib/${pkgname}"

    install -Dm644 -t "${lib}" "buildInfo.json"

    cd "${_srcname}"

    install -Dm644 -t "${lib}" "package.json"
    cp -rt "${lib}" "sources" "node_modules"

    rm -r \
        "${lib}/sources/app/.build" \
        "${lib}/sources/code" \
        "${lib}/sources/assets/icons/app.ic"*

    install -dm755 "${pkgdir}/usr/share/icons/hicolor/256x256/apps" && ln -s "/usr/lib/${pkgname}/sources/assets/icons/app.png" "$_/${pkgname}.png"

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE"
}
