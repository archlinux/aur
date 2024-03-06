_electron='electron29'

pkgname=webcord
pkgver=4.8.0
pkgrel=2
pkgdesc='A Discord and SpaceBar Electron-based client implemented without Discord API'
arch=('any')
_repo='WebCord'
url="https://github.com/SpacingBat3/${_repo}"
license=('MIT')
depends=("${_electron}")
makedepends=('npm' 'esbuild>=0.19')
options=('!strip' '!emptydirs')

_snapshot="${_repo}-${pkgver}"
source=(
    "${_snapshot}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
    'buildInfo.json'
    'webcord.desktop'
    'webcord.sh'
)

sha256sums=(
    '63042e914192891bf62e6394354fb4f32bedbe7be873c654d61bb21f7f361e8e'
    'c803c7227982fad22390a8d6d11f3707171d5e9b1a394731a6a07773eab75b1f'
    '5923151d1cc05d7e2ab0cb2103921f5f3985e08e48c74e7aa12003b32c0e2bae'
    '2645eafeaae58769f958c7372c3522ec93034b678d4e7ca90ab872b8dbd18ee5'
)

prepare() {
    cd "${_snapshot}"
    npm ci --omit=dev --ignore-scripts --prefix=.
    rm -r 'sources/code/build'
    rm 'sources/assets/icons/app.ic'*
}

build() {
    cd "${_snapshot}"

    local common=(
        --outbase='sources'
        --outdir='app'
        --minify
        --platform=node
        --target=es2022
    )

    local cjs=(
        --format=cjs
    )

    local esm=(
        --format=esm
        --out-extension:'.js=.mjs'
    )

    esbuild 'sources/code/**/*.ts' "${common[@]}" "${cjs[@]}"
    esbuild 'sources/code/**/*.mts' "${common[@]}" "${esm[@]}"
}

package() {
    local lib="/usr/lib/${pkgname}"
    local pkg_lib="${pkgdir}${lib}"
    install -Dm644 "${source[1]}" -t "${pkg_lib}"
    install -Dm644 "${source[2]}" -t "${pkgdir}/usr/share/applications"

    local pkg_bin="${pkgdir}/usr/bin"
    local exec="${pkg_bin}/${pkgname}"
    install -dm755 "${pkg_bin}"
    sed -e "s|@ELECTRON@|${_electron}|;s|@APP_DIR@|${lib}|" "${source[3]}" > "${exec}"
    chmod 755 "${exec}"

    cd "${_snapshot}"
    cp -r --parents 'package.json' 'app' 'sources/'{'assets','translations'} 'node_modules' -t "${pkg_lib}"
    ln -s "../sources/translations" -T "${pkg_lib}/app/translations"

    local pkg_icons="${pkgdir}/usr/share/icons/hicolor/512x512/apps"
    install -dm755 "${pkg_icons}"
    ln -s "${lib}/sources/assets/icons/app.png" -T "${pkg_icons}/${pkgname}.png"

    install -Dm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
