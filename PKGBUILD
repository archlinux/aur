# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=hihat-git
pkgver=latest.r6.gfdd6211
_electronversion=26
_nodeversion=14
pkgrel=1
pkgdesc="A minimalist offline music library player for desktop, built on Electron, React, and Material UI."
arch=('any')
url="https://github.com/johnnyshankman/hihat"
license=('MIT')
conflicts=(
    "${pkgname%-git}"
)
provides=(
    "${pkgname%-git}"
)
depends=(
    #"electron${_electronversion}"
    'hicolor-icon-theme'
    'libcups'
    'libxcomposite'
    'libdrm'
    'mesa'
    'libxkbcommon'
    'alsa-lib'
    'nspr'
    'expat'
    'libxrandr'
    'cairo'
    'gtk3'
    'libx11'
    'libxcb'
    'nss'
    'pango'
    'libxfixes'
    'libxext'
    'libxdamage'
    'at-spi2-core'
)
makedepends=(
    'gendesk'
    'git'
    'nvm'
    'npm>=7'
)
source=(
    "${pkgname%-git}"::"git+${url}.git"
    #"${pkgname%-git}.sh"
)
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    gendesk -q -f -n --categories "AudioVideo" --name "${pkgname%-git}" --exec "${pkgname%-git} --no-sandbox %U"
    _ensure_local_nvm
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    cd "${srcdir}/${pkgname%-git}"
    npm install
    npm run package
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-git}",usr/bin}
    cp -r "${srcdir}/${pkgname%-git}/release/build/linux-unpacked/"* "${pkgdir}/opt/${pkgname%-git}"
    ln -sf "/opt/${pkgname%-git}/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname%-git}/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}