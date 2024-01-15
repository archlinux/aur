# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=hex-music-player
_pkgname="Hex Music Player"
pkgver=1.0.0
_electronversion=24
_nodeversion=16
pkgrel=5
pkgdesc="Music client for Plex Media Server"
arch=('any')
url="https://github.com/meisandrew/hex-music-player"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'libxrandr'
    'nss'
    'libxdamage'
    'alsa-lib'
    'expat'
    'at-spi2-core'
    'mesa'
    'pango'
    'libcups'
    'libxkbcommon'
    'libxcb'
    'gtk3'
    'libdrm'
    'cairo'
    'libxext'
    'nspr'
    'libxfixes'
    'libxcomposite'
    'libx11'
    'hicolor-icon-theme'
)
makedepends=(
    'gendesk'
    'yarn'
    'npm'
    'nvm'
    'git'
)
source=(
    "${pkgname}.git::git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    _ensure_local_nvm
    gendesk -f -n -q --categories "AudioVideo" --name "${_pkgname}" --exec "${pkgname} %U"
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    # .yarnrc.yml existed.
    sed "s|\/\${version}||g" -i electron-builder.json5
    yarn install
    yarn run build
    cp "${srcdir}/${pkgname}.git/release/.icon-set/icon_1024.png" \
       "${srcdir}/${pkgname}.git/release/.icon-set/icon_1024x1024.png"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/bin" "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/${pkgname}.git/release/linux-"*/* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname}.git/release/.icon-set/icon_${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}