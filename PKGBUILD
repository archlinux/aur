pkgname=webcord
pkgver=3.3.0
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
    'd75baf875d8bd0ccb7becf3248e5609b49ceb8e4e9ba6aa7f39c39083ea62da7'
    '0f907649efc3dc60320ea84bfc6489996d2664523348641c9b6e7642bd062be0'
    'c803c7227982fad22390a8d6d11f3707171d5e9b1a394731a6a07773eab75b1f'
    '3a9b6df6be84741b5839d559301b95cb75e012fd7f20f3f8eac10cc11bccc4a1'
)

prepare() {
    cd "${srcdir}"
    npm i --ignore-scripts=true \
        "@tsconfig/node16-strictest"@"^1.0.0" \
        "@types/dompurify"@"^2.3.3" \
        "@types/marked"@"^4.0.2" \
        "@types/semver"@"^7.3.9" \
        "@types/source-map-support"@"^0.5.4" \
        "@types/spdx-expression-parse"@"^3.0.1" \
        "@types/ws"@"^8.5.1" \
        "electron"@"^19.0.1"

    cd "${_srcname}"
    npm i --omit=dev --ignore-scripts=true
    rm -r "sources/code/build"
}

build() {
    cd "${srcdir}/${_srcname}"
    tsc --sourceMap false --outDir "${srcdir}/app"
}

package() {
    local lib="${pkgdir}/usr/lib/${pkgname}"
    local sources="${lib}/sources"

    cd "${srcdir}"
    install -Dm755 -t "${lib}" "${source[1]}"
    install -dm755 "${pkgdir}/usr/bin" && ln -s "${lib#${pkgdir}}/${source[1]}" "$_/webcord"
    install -Dm644 -t "${lib}" "${source[2]}"
    install -Dm644 "${source[3]}" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    cp -rdt "${lib}" "app"

    cd "${_srcname}"
    install -Dm644 -t "${lib}" "package.json"
    cp -rdt "${lib}" "node_modules"
    mkdir -p "${sources}"
    cp -rdt "${sources}" "sources/assets"
    rm -r "${sources}/assets/icons/app."*
    install -Dm644 "sources/assets/icons/app.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE"
}
