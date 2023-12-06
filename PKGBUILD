# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=hex-music-player
pkgver=1.0.0
_electronversion=24
pkgrel=4
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
    "${pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install 16
    nvm use 16
}
build() {
    _ensure_local_nvm
    gendesk -f -n -q --categories "AudioVideo" --name "${pkgname}" --exec "${pkgname} --no-sandbox %U"
    cd "${srcdir}/${pkgname}-${pkgver}"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    rm -rf .yarnrc.yml
    yarn install --cache-folder "${srcdir}/.yarn_cache"
    yarn build
    cp "${srcdir}/${pkgname}-${pkgver}/release/\${version}/.icon-set/icon_1024.png" \
        "${srcdir}/${pkgname}-${pkgver}/release/\${version}/.icon-set/icon_1024x1024.png"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/bin" "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/release/${pkgver}/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/release/\${version}/.icon-set/icon_${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}