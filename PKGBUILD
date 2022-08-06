pkgname=webcord
pkgver=3.6.0
pkgrel=1
pkgdesc="A Discord and Fosscord client made with the Electron."
arch=('any')
url="https://github.com/SpacingBat3/WebCord"
license=('MIT')
depends=('electron19')
makedepends=('npm' 'typescript' 'git')
options=('!strip' '!emptydirs')

_srcname="WebCord-${pkgver}"

source=(
    "${_srcname}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
    "run.sh"
    "buildInfo.json"
    "app.desktop"
)

sha256sums=(
    '3191f1420a51e13840a6ecc518c9560c9044282f0a6bc055285b7cc53273e118'
    '0f907649efc3dc60320ea84bfc6489996d2664523348641c9b6e7642bd062be0'
    'c803c7227982fad22390a8d6d11f3707171d5e9b1a394731a6a07773eab75b1f'
    '3a9b6df6be84741b5839d559301b95cb75e012fd7f20f3f8eac10cc11bccc4a1'
)

prepare() {
    cd "${srcdir}"
    npm i --ignore-scripts \
        "@tsconfig/node16-strictest"@"^1.0.0" \
        "@types/dompurify"@"^2.3.3" \
        "@types/marked"@"^4.0.2" \
        "@types/semver"@"^7.3.9" \
        "@types/source-map-support"@"^0.5.4" \
        "@types/spdx-expression-parse"@"^3.0.1" \
        "@types/ws"@"^8.5.1" \
        "electron"@"^19.0.1"

    cd "${_srcname}"
    npm i --omit=dev --ignore-scripts "@types/node"@"^18.0.0"
    rm -r "sources/code/build"
}

build() {
    cd "${srcdir}/${_srcname}"
    tsc --sourceMap false --outDir "${srcdir}/app"
}

package() {
    local lib="${pkgdir}/usr/lib/${pkgname}"

    cd "${srcdir}"
    install -Dm755 -t "${lib}" "${source[1]}"
    install -Dm644 -t "${lib}" "${source[2]}"
    install -Dm644 "${source[3]}" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    cp -rdt "${lib}" "app"

    local bin="${pkgdir}/usr/bin"
    install -dm755 "${bin}"
    ln -s "${lib#${pkgdir}}/${source[1]}" "${bin}/webcord"

    cd "${_srcname}"
    install -Dm644 -t "${lib}" "package.json"
    cp -rdt "${lib}" "node_modules"
    rm -r "${lib}/node_modules/@types"

    local sources="${lib}/sources"
    install -dm755 "${sources}"
    cp -rdt "${sources}" "sources/assets"
    rm -r "${sources}/assets/icons/app.ic"*

    local icons="${pkgdir}/usr/share/icons/hicolor/256x256/apps"
    install -dm755 "${icons}"
    ln -s "${sources#${pkgdir}}/assets/icons/app.png" "${icons}/${pkgname}.png"

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE"
}
