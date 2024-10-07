_electron='electron32'

pkgname=webcord
pkgver=4.10.2
pkgrel=1
pkgdesc='A Discord and SpaceBar Electron-based client implemented without Discord API'
arch=('any')
_repo='WebCord'
url="https://github.com/SpacingBat3/${_repo}"
license=('MIT')
options=('!strip' '!emptydirs')

depends=("${_electron}")
makedepends=('npm' 'esbuild')

_snapshot="${_repo}-${pkgver}"
source=(
    "${url}/archive/v${pkgver}/${_snapshot}.tar.gz"
    'buildInfo.json'
    'webcord.desktop'
    'webcord.sh'
)

sha256sums=(
    '868115f11bd43d3cec142b43c9c37da69b47d5b3e8488a3f172f7d016b522b99'
    'c803c7227982fad22390a8d6d11f3707171d5e9b1a394731a6a07773eab75b1f'
    '5923151d1cc05d7e2ab0cb2103921f5f3985e08e48c74e7aa12003b32c0e2bae'
    'c41c46200b0dacf7d2ae3983e66bb9aad8314fdfc821f3ed559245ca205c087c'
)

prepare() {
    cd "${_snapshot}"
    npm ci --omit=dev --ignore-scripts --no-bin-links --prefix=.
    rm -r 'sources/code/build'
    rm 'sources/assets/icons/app.ic'*
}

build() {
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

    cd "${_snapshot}"
    esbuild 'sources/code/**/*.ts' "${common[@]}" "${cjs[@]}"
    esbuild 'sources/code/**/*.mts' "${common[@]}" "${esm[@]}"
}

package() {
    local lib="/usr/lib/${pkgname}"
    local pkg_lib="${pkgdir}${lib}"
    install -Dm644 "${source[1]}" -t "${pkg_lib}"
    install -Dm644 "${source[2]}" -t "${pkgdir}/usr/share/applications"

    sed -e "s|@ELECTRON@|${_electron}|;s|@APP_DIR@|${lib}|" "${source[3]}" |
        install -Dm755 '/dev/stdin' "${pkgdir}/usr/bin/${pkgname}"

    cd "${_snapshot}"
    cp -r --parents -t "${pkg_lib}" \
        'package.json' 'app' 'sources/'{'assets','translations'} 'node_modules'
    ln -s '../sources/translations' -T "${pkg_lib}/app/translations"

    local pkg_icons="${pkgdir}/usr/share/icons/hicolor/512x512/apps"
    install -dm755 "${pkg_icons}"
    ln -s "${lib}/sources/assets/icons/app.png" -T "${pkg_icons}/${pkgname}.png"

    install -Dm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
