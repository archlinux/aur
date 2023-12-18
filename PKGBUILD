# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributer: Bet4 <0xbet4@gmail.com>
# Contributer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: ahrs <Forward dot to at hotmail dot co dot uk>
# Contributor: Aaron Abbott <aabmass@gmail.com>
# Contributer: fleischie
# Contributer: auk
pkgname=hyper-git
_pkgname=Hyper
pkgver=4.0.0.canary.5.r258.g7e6cbe05
_electronversion=24
pkgrel=1
pkgdesc="A terminal built on web technologies"
arch=('any')
url="https://hyper.is/"
_ghurl="https://github.com/vercel/hyper"
license=('MIT')
depends=(
    'alsa-lib'
    'libxfixes'
    'cairo'
    'libxcb'
    'nspr'
    'at-spi2-core'
    'pango'
    'nss'
    'libx11'
    'libcups'
    'expat'
    'libxcomposite'
    'gtk3'
    'libxkbcommon'
    'libxext'
    'mesa'
    'libxdamage'
    'libxrandr'
    'libdrm'
    'hicolor-icon-theme'
)
makedepends=(
    'git'
    'npm'
    'yarn'
    'nvm'
    'python>=3.8'
    'libarchive'
    'libicns'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
    "${pkgname%-git}::git+${_ghurl}.git"
)
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "%s" "$(git describe --tags | sed 's/\w\+\///g;s/\([^-]*-g\)/r\1/;s/-/./g;s/v//g')"
}
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install 18
    nvm use 18
}
build() {
    _ensure_local_nvm
    gendesk -q -f -n --categories "System;Utility" --name "${_pkgname}" --exec "${pkgname%-git} --no-sandbox %U"
    cd "${srcdir}/${pkgname%-git}"
    rm -rf .yarnrc
    sed -e '/"deb",/d' -e '/"rpm",/d' -e '/"snap",/d' -e '/"pacman"/d' -e 's|"AppImage",|"AppImage"|g' -i electron-builder.json
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    install -Dm755 -d "${srcdir}/${pkgname%-git}/node_modules/electron/dist"
    yarn install --cache-folder "${srcdir}/.yarn_cache"
    yarn run dist
    cd "${srcdir}/${pkgname%-git}/dist/.icon-set"
    cp icon_32.png icon_32x32.png
    cp icon_64.png icon_64x64.png
    cp icon_128.png icon_128x128.png
    cp icon_256.png icon_256x256.png
    cp icon_512.png icon_512x512.png
    cp icon_1024.png icon_1024x1024.png
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-git}",usr/bin}
    ln -sf "/opt/${pkgname%-git}/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
    cp -r "${srcdir}/${pkgname%-git}/dist/linux-unpacked/"* "${pkgdir}/opt/${pkgname%-git}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname%-git}/dist/.icon-set/icon_${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}