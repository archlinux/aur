# Maintainer: sukanka <su975853527 at gmail dot com>
# Contributor: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=cherry-studio
_pkgname="Cherry Studio"
pkgver=1.6.6
_electron=electron38
pkgrel=1
pkgdesc="A desktop client that supports for multiple LLM providers.(Use system-wide electron)"
arch=('x86_64')
url="https://cherry-ai.com/"
_ghurl="https://github.com/CherryHQ/cherry-studio"
license=('MIT')
depends=(
    "${_electron}"
    libvips
    imagemagick
)
makedepends=(
    'gendesk'
    'npm'
    'yarn'
    'jq'
    'moreutils'
    'python'
    'python-setuptools'
)
optdepends=(
    'ollama: use local LLM server'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('8f43c11aef1810a4949ee1909f4e1faa1e7299e3e68a0c9a218cab48675187b7'
            '44a824951155af10ff8d683a0856249c2033a195b9ba04cb5bb8dcfdff4ca463')

prepare() {
    sed -e "s|__ELECTRON__|${_electron}|g" -i "${srcdir}/${pkgname}.sh"

    gendesk -q -f -n --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" \
        --categories="Utility" --name="${_pkgname}" --exec="${pkgname} %U" \
        --custom="StartupWMClass=${_pkgname/ /}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    local electronDist="/usr/lib/${_electron}"
    local electronVersion="$(<$electronDist/version)"
    # electron@36.7.1 not found on npm,
    # electronVersion="${electronVersion%.*}.0"
    jq ".devDependencies.electron = \"$electronVersion\"" package.json |
        jq ".build.electronDist = \"$electronDist\"" |
        jq ".build.electronVersion = \"$electronVersion\"" |
        sponge package.json

    # jq '.resolutions."node-abi"="^4.12.0"' package.json | sponge package.json

    #  no auto update
    sed -i package.json -e "s|electron-builder --dir|& --p never|g"

}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export HOME=${srcdir}
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export TMPDIR=${srcdir}
    export npm_config_nodedir=/usr
    ELECTRON_SKIP_BINARY_DOWNLOAD=1 yarn add node-addon-api node-gyp
    ELECTRON_SKIP_BINARY_DOWNLOAD=1 yarn install
    export NODE_ENV=production
    yarn run build:unpack
}
package() {

    install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"

    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm644 "dist/linux-unpacked"/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -Pr --no-preserve=ownership "dist/linux-unpacked"/resources/app.asar.unpacked "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"

    for f in build/icons/*; do
        res="${f##*/}"
        res="${res%.png}"
        install -Dm644 "$f" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/${pkgname}.png"
    done
}
