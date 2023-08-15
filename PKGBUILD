_electron='electron26'

pkgname=webcord
pkgver=4.4.0
pkgrel=1
pkgdesc='A Discord and SpaceBar Electron-based client implemented without Discord API'
arch=('any')
_repo='WebCord'
url="https://github.com/SpacingBat3/${_repo}"
license=('MIT')
depends=("${_electron}")
makedepends=('npm')
options=('!strip' '!emptydirs')

_snapshot="${_repo}-${pkgver}"
source=(
    "${_snapshot}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
    "buildInfo.json"
    "webcord.desktop"
)

sha256sums=(
    'aa9668102cdec283e2a2af09738c8750ee1bbb57af24de529efc2b1a5e642a82'
    'c803c7227982fad22390a8d6d11f3707171d5e9b1a394731a6a07773eab75b1f'
    '5923151d1cc05d7e2ab0cb2103921f5f3985e08e48c74e7aa12003b32c0e2bae'
)

prepare() {
    npm i -E --ignore-scripts --include=optional --prefix=. "esbuild@0.19.2"

    cd "${_snapshot}"
    npm ci --omit=dev --ignore-scripts --prefix=.
    rm -r "sources/code/build"
    rm "sources/assets/icons/app.ic"*
}

build() {
    cd "${_snapshot}"
    npx esbuild "sources/code/**/*.ts" \
        --outbase="sources" --outdir="app" --minify \
        --platform=node --target=es2022 --format=cjs --supported:dynamic-import=false
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
    echo "#!/bin/sh
exec '${_electron}' '${lib}' \"\$@\"
" > "${exec}"
    chmod +x "${exec}"
}
