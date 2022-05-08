pkgname=webcord
pkgver=3.1.4
pkgrel=1
pkgdesc="A Discord and Fosscord client made with the Electron."
arch=('any')
url="https://github.com/SpacingBat3/WebCord"
license=('MIT')
depends=('electron>=18' 'electron<19')
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
    'c3ce9e77eceec6b8c0771329e828e7bbc08135168abfeff40b299e7510937fc0'
    '1339d6cc4e66b75131531f7bec8aacad5c9b2bce3eafd3e1615966c355a9b759'
    'c803c7227982fad22390a8d6d11f3707171d5e9b1a394731a6a07773eab75b1f'
    '3a9b6df6be84741b5839d559301b95cb75e012fd7f20f3f8eac10cc11bccc4a1'
)

prepare() {
    cd "${srcdir}"
    npm i --ignore-scripts=true \
        "@tsconfig/node16-strictest"@"^1.0.0" \
        "@types/dompurify"@"^2.2.3" \
        "@types/marked"@"^4.0.2" \
        "@types/semver"@"^7.3.9" \
        "@types/source-map-support"@"^0.5.4" \
        "@types/spdx-expression-parse"@"^3.0.1" \
        "@types/ws"@"^8.5.1" \
        "electron"@"^18.0.1"

    cd "${_srcname}"
    npm i --omit=dev --ignore-scripts=true
    rm -r "sources/code/build"
}

build() {
    cd "${srcdir}/${_srcname}"
    tsc --sourceMap false --outDir "${srcdir}/sources/app"
}

package() {
    local lib="${pkgdir}/usr/lib/${pkgname}"

    cd "${srcdir}"
    install -Dm755 -t "${lib}" "${source[1]}"
    install -dm755 "${pkgdir}/usr/bin" && ln -s "${lib#${pkgdir}}/${source[1]}" "$_/webcord"
    install -Dm644 -t "${lib}" "${source[2]}"
    install -Dm644 "${source[3]}" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    cp -rdt "${lib}" "sources"

    cd "${_srcname}"
    install -Dm644 -t "${lib}" "package.json"
    cp -rdt "${lib}" "node_modules"
    cp -rdt "${lib}/sources" "sources/assets"
    rm -r "${lib}/sources/assets/icons/app."*
    install -Dm644 "sources/assets/icons/app.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE"
}
