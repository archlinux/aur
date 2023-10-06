_electron='electron25'

pkgname=webcord
pkgver=4.4.2
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
)

sha256sums=(
    '735092e9410c9f03f0a3079cec5fa191c45f8359b537847a57756ae891a5af79'
    'c803c7227982fad22390a8d6d11f3707171d5e9b1a394731a6a07773eab75b1f'
    '5923151d1cc05d7e2ab0cb2103921f5f3985e08e48c74e7aa12003b32c0e2bae'
)

prepare() {
    cd "${_snapshot}"
    npm ci --omit=dev --ignore-scripts --prefix=.
    rm -r "sources/code/build"
    rm "sources/assets/icons/app.ic"*
}

build() {
    cd "${_snapshot}"

    local common=(
        --outbase="sources"
        --outdir="app"
        --minify
        --platform=node
        --target=es2022
    )

    esbuild "sources/code/**/*.ts" \
        "${common[@]}" --format=cjs

    esbuild "sources/code/**/*.mts" \
        "${common[@]}" --format=esm --out-extension:".js=.mjs"
}

package() {
    local bin="/usr/bin"
    local lib="/usr/lib/${pkgname}"
    local icons="/usr/share/icons/hicolor/512x512/apps"

    install -dm755 "${pkgdir}"{"${bin}","${lib}","${icons}"}
    install -Dm644 -t "${pkgdir}${lib}" "${source[1]}"
    install -Dm644 -t "${pkgdir}/usr/share/applications" "${source[2]}"

    cd "${_snapshot}"
    cp --parents -rt "${pkgdir}${lib}" "package.json" "app" "sources/"{"assets","translations"} "node_modules"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE"

    ln -sT "../sources/translations" "${pkgdir}${lib}/app/translations"
    ln -sT "${lib}/sources/assets/icons/app.png" "${pkgdir}${icons}/${pkgname}.png"

    local exec="${pkgdir}${bin}/${pkgname}"
    echo -n "#!/bin/sh
exec '${_electron}' '${lib}' \"\$@\"
" > "${exec}"
    chmod +x "${exec}"
}
