_electron='electron28'

pkgname=webcord
pkgver=4.7.0
pkgrel=1
pkgdesc='A Discord and SpaceBar Electron-based client implemented without Discord API'
arch=('any')
_repo='WebCord'
url="https://github.com/SpacingBat3/${_repo}"
license=('MIT')
depends=("${_electron}")
makedepends=('npm' 'esbuild')
options=('!strip' '!emptydirs')

_snapshot="${_repo}-${pkgver}"
source=(
    "${_snapshot}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
    "buildInfo.json"
    "webcord.desktop"
    "webcord.sh"
)

sha256sums=(
    '17df721b62e77f86f2bd1a8cb5b449167bcd85f61249f6b4508f386b4ab72093'
    'c803c7227982fad22390a8d6d11f3707171d5e9b1a394731a6a07773eab75b1f'
    '5923151d1cc05d7e2ab0cb2103921f5f3985e08e48c74e7aa12003b32c0e2bae'
    '2645eafeaae58769f958c7372c3522ec93034b678d4e7ca90ab872b8dbd18ee5'
)

prepare() {
    cd "${_snapshot}"
    npm ci --omit=dev --ignore-scripts --prefix=.
    rm -r "sources/code/build"
    rm "sources/assets/icons/app.ic"*
}

build() {
    cd "${_snapshot}"

    local flags=(
        --outbase="sources"
        --outdir="app"
        --minify
        --platform=node
        --target=es2022
    )

    esbuild "sources/code/**/*.ts" \
        "${flags[@]}" --format=cjs

    esbuild "sources/code/**/*.mts" \
        "${flags[@]}" --format=esm --out-extension:".js=.mjs"
}

package() {
    local bin="/usr/bin"
    local lib="/usr/lib/${pkgname}"
    local icons="/usr/share/icons/hicolor/512x512/apps"

    install -dm755 "${pkgdir}"{"${bin}","${lib}","${icons}"}

    install -Dm644 "${source[1]}" \
        -t "${pkgdir}${lib}"

    install -Dm644 "${source[2]}" \
        -t "${pkgdir}/usr/share/applications"

    local exec="${pkgdir}${bin}/${pkgname}"
    sed -e "s|@ELECTRON@|${_electron}|;s|@APP_DIR@|${lib}|" "${source[3]}" > "${exec}"
    chmod +x "${exec}"

    cd "${_snapshot}"

    cp -r --parents "package.json" "app" "sources/"{"assets","translations"} "node_modules" \
        -t "${pkgdir}${lib}"

    install -Dm644 "LICENSE" \
        -t "${pkgdir}/usr/share/licenses/${pkgname}"

    ln -sT "../sources/translations" "${pkgdir}${lib}/app/translations"
    ln -sT "${lib}/sources/assets/icons/app.png" "${pkgdir}${icons}/${pkgname}.png"
}
