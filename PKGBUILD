# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nvm-desktop
pkgver=2.6.2
_nvmdver="${pkgver}"
_electronversion=27
_nodeversion=20
pkgrel=1
pkgdesc="A version management desktop client for the Nodejs."
arch=('x86_64')
url="https://github.com/1111mp/nvm-desktop"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'nss'
    'cairo'
    'libxcb'
    'libxrandr'
    'gtk3'
    'dbus'
    'expat'
    'libdrm'
    'mesa'
    'libxcomposite'
    'pango'
    'at-spi2-core'
    'libxext'
    'libxkbcommon'
    'nspr'
    'alsa-lib'
    'hicolor-icon-theme'
    'libcups'
    'libxdamage'
    'libxfixes'
    'libx11'
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'yarn'
    'git'
)
source=(
    "${pkgname}::git+${url}.git#tag=v${pkgver}"
    "nvmd-${_nvmdver}.zip::https://github.com/1111mp/nvmd-command/releases/download/v${_nvmdver}/Linux-x64.zip"
)
sha256sums=('SKIP'
            'fca1144f6ecdce96f76a15c57bf4668e603fc4fab78218ae60ff61a7555df194')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    gendesk -f -n -q --categories "Development;Utility" --name "${pkgname}" --exec "${pkgname} --no-sandbox %U"
    cd "${srcdir}/${pkgname}"
    install -Dm755 "${srcdir}/Linux-x64/nvmd" -t "${srcdir}/${pkgname}/assets/sources"
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    yarn install --cache-folder "${srcdir}/.yarn_cache"
    yarn package
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/${pkgname}/release/build/linux-unpacked/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname}/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}