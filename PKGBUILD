pkgname=webcord
pkgver=4.3.0
pkgrel=1
pkgdesc='A Discord and SpaceBar Electron-based client implemented without Discord API'
arch=('any')
_repo='WebCord'
url="https://github.com/SpacingBat3/${_repo}"
license=('MIT')
_electron='electron25'
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
    '298f0a47abaa896f894d93e1d4a76325381c989630161750af5e91593af9aa27'
    'c803c7227982fad22390a8d6d11f3707171d5e9b1a394731a6a07773eab75b1f'
    '43ccf5216bb029deb2af2792218b35793f930200117f5bf8201a2406f66af583'
)

prepare() {
    npm i -E --ignore-scripts --include=optional --prefix=. "esbuild@0.17.15"

    cd "${_snapshot}"
    npm ci --omit=dev --ignore-scripts --prefix=.
    rm -r "sources/code/build"
    rm "sources/assets/icons/app.ic"*
}

build() {
    cd "${_snapshot}"
    shopt -s globstar
    npx esbuild "sources/code/"**/*".ts" \
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
