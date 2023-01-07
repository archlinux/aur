pkgname=webcord
pkgver=4.1.1
pkgrel=2
pkgdesc="A Discord and Fosscord client made with the Electron API."
arch=('any')
_repo='WebCord'
url="https://github.com/SpacingBat3/${_repo}"
license=('MIT')
makedepends=('npm' 'esbuild')
options=('!strip' '!emptydirs')

_emin=17
_emax=22
optdepends=()

for ((i = _emax; i >= _emin; i--)); do
    optdepends+=("electron${i}: runtime")
done

_srcname="${_repo}-${pkgver}"

source=(
    "${_srcname}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
    "buildInfo.json"
    "webcord.desktop"
)

sha256sums=(
    '3f22e5db824b73780f33b1eba8e9bf7cd3998cf65cf9304d3fc0c624319192f9'
    'c803c7227982fad22390a8d6d11f3707171d5e9b1a394731a6a07773eab75b1f'
    '43ccf5216bb029deb2af2792218b35793f930200117f5bf8201a2406f66af583'
)

prepare() {
    cd "${_srcname}"
    npm ci --omit=dev --ignore-scripts --prefix=.
    rm -r "sources/code/build"
    rm "sources/assets/icons/app.ic"*
}

build() {
    cd "${_srcname}"
    shopt -s globstar
    esbuild "sources/code/"**/*".ts" --outbase="sources" --outdir="app" --platform=node --format=cjs --supported:dynamic-import=false
}

package() {
    local lib="/usr/lib/${pkgname}"
    local bin="/usr/bin"
    local exec="${pkgdir}${bin}/webcord"
    local sources="${lib}/sources"
    local icons="/usr/share/icons/hicolor/512x512/apps"

    install -dm755 "${pkgdir}"{"${bin}","${sources}","${icons}"}
    install -Dm644 -t "${pkgdir}${lib}" "${source[1]}"
    install -Dm644 -t "${pkgdir}/usr/share/applications" "${source[2]}"

    cd "${_srcname}"
    cp -rdt "${pkgdir}${lib}" "package.json" "app" "node_modules"
    cp -rdt "${pkgdir}${sources}" "sources/"{"assets","translations"}
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE"

    ln -sT "../sources/translations" "${pkgdir}${lib}/app/translations"
    ln -sT "${sources}/assets/icons/app.png" "${pkgdir}${icons}/${pkgname}.png"

    echo "#!/bin/sh

for i in {${_emax}..${_emin}}; do
    cmd=\"electron\${i}\"
    if command -v \"\${cmd}\" > /dev/null; then
        echo \"Found Electron \${i}.\"
        exec \"\${cmd}\" '${lib}' \"\$@\"
    fi
done

echo 'No compatible Electron version found!'
exit 1" > "${exec}"

    chmod +x "${exec}"
}
