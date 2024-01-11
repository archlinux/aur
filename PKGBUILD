# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tts-vue
pkgver=1.9.15
_electronversion=19
_nodeversion=16
pkgrel=4
pkgdesc="Microsoft speech synthesis tool, built using Electron+Vue+ElementPlus+Vite.微软语音合成工具,使用Electron+Vue+ElementPlus+Vite构建。"
arch=('x86_64')
url="https://tts-doc.loker.vip/home.html"
_ghurl="https://github.com/LokerL/tts-vue"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'libdrm'
    'mesa'
    'expat'
    'nss'
    'cairo'
    'gtk3'
    'libxcb'
    'nspr'
    'pango'
    'libxkbcommon'
    'at-spi2-core'
    'libxcomposite'
    'libxdamage'
    'libx11'
    'libxrandr'
    'alsa-lib'
    'libcups'
    'libxext'
    'libxfixes'
)
makedepends=(
    'gendesk'
    'nvm'
    'npm'
    'git'
)
source=(
    "${pkgname}.git::git+${_ghurl}.git#tag=${pkgver}"
)
sha256sums=('SKIP'
            'd4272fed78cdcacd9edfb019134ac485d65b43f4d8c7a4179edbaed56af9b231')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    _ensure_local_nvm
    gendesk -q -f -n --categories "Utility" --exec "${pkgname} --no-sandbox %U"
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    npm install
    npm run build
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname}",usr/bin}
    cp -r "${srcdir}/${pkgname}.git/release/${pkgver}/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/dist/node.png" -t "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}