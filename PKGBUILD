# Maintainer: sukanka <su975853527 at gmail dot com>
# Contributor: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=cherry-studio
_pkgname="Cherry Studio"
pkgver=2.0.11
_electron=electron41
pkgrel=1
pkgdesc="A desktop client that supports for multiple LLM providers.(Use system-wide electron)"
arch=('x86_64')
url="https://cherry-ai.com/"
_ghurl="https://github.com/CherryHQ/cherry-studio"
_arch_patch='2aca3f1bb'
license=('MIT')
depends=(
    "${_electron}"
    bun
    imagemagick
    libevdev
    mise
    ripgrep
    uv
)
makedepends=(
    'gendesk'
    'npm'
    'python'
    'python-setuptools'
    'pnpm'
    'node-gyp'
)
optdepends=(
    'ollama: use local LLM server'
    fd
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh"
    "${pkgname}-${_arch_patch}.patch::https://github.com/sukanka/cherry-studio/commit/${_arch_patch}.patch"
)
sha256sums=('d1cdf0c23fb975cfc1f8b442ff36c3c64ff51276bc0e46beb4046177a8027435'
            '44a824951155af10ff8d683a0856249c2033a195b9ba04cb5bb8dcfdff4ca463'
            '242710d37f88e41ecbd58ea2aa4d5a5216bdcb7a0134af3639b6ccd8aacafc97')

prepare() {
    sed -e "s|__ELECTRON__|${_electron}|g" -i "${srcdir}/${pkgname}.sh"

    gendesk -q -f -n --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" \
        --categories="Utility" --name="${_pkgname}" --exec="${pkgname} %U" \
        --custom="StartupWMClass=${_pkgname/ /}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -Np1 -i "${srcdir}/${pkgname}-${_arch_patch}.patch"
    sed -i "s/node-abi: '4.28.0'/node-abi: '>=4.33.0'/" pnpm-workspace.yaml
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    local electronDist="/usr/lib/${_electron}"
    local electronVersion="$(<"${electronDist}/version")"
    export HOME=${srcdir}
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export TMPDIR=${srcdir}
    export SHARP_IGNORE_GLOBAL_LIBVIPS=1
    pnpm install
    export NODE_ENV=production
    pnpm run build
    pnpm exec electron-builder --dir --publish never \
        --config.electronDist="${electronDist}" \
        --config.electronVersion="${electronVersion}"
}
_clean() {
    cd ${pkgdir}/usr/lib/${pkgname}/app.asar.unpacked/node_modules
    find . -type d \( -name '*darwin*' -o -name '*musl*' -o -name '*win32*' \) -print -prune -exec rm -r -- {} +

    if [[ $CARCH != "arm64" ]]; then
        find . -type d \( -name '*arm64*' \) -print -prune -exec rm -r -- {} +
    fi
}
package() {

    install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/CherryStudio.desktop"

    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm644 "dist/linux-unpacked"/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -Pr --no-preserve=ownership "dist/linux-unpacked"/resources/app.asar.unpacked "${pkgdir}/usr/lib/${pkgname}"
    cp -Pr --no-preserve=ownership \
        "dist/linux-unpacked"/resources/migrations \
        "dist/linux-unpacked"/resources/provider-registry \
        "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"

    for f in build/icons/*; do
        res="${f##*/}"
        res="${res%.png}"
        install -Dm644 "$f" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/${pkgname}.png"
    done
    _clean
}
