# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=losslesscut-git
pkgver=3.58.0.r57.g5df1269
_electronversion=27
pkgrel=1
pkgdesc="The swiss army knife of lossless video/audio editing"
arch=('x86_64')
url="https://github.com/mifi/lossless-cut"
license=('GPL2')
conflicts=(
    "${pkgname%-git}"
)
provides=(
    "${pkgname%-git}"
)
depends=(
    #"electron${_electronversion}"
    'libxcb'
    'mesa'
    'at-spi2-core'
    'libcups'
    'libxkbcommon'
    'libxcomposite'
    'gtk3'
    'libxext'
    'libxfixes'
    'nspr'
    'cairo'
    'pango'
    'libxdamage'
    'nss'
    'expat'
    'alsa-lib'
    'libx11'
    'libxrandr'
    'libdrm'
)
makedepends=(
    'gendesk'
    'git'
    'nvm'
    'npm'
    'yarn'
)
source=(
    "${pkgname%-git}"::"git+${url}.git"
)
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install 18
    nvm use 18
}
build() {
    _ensure_local_nvm
    gendesk -q -f -n --categories "Utility" --name="${pkgname%-git}" --exec="${pkgname%-git} --no-sandbox %U"
    cd "${srcdir}/${pkgname%-git}"
    rm -rf ffmpeg
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    sed -e '425,430d' -e '411,422d' -e '404,407d' -i package.json
    yarn install
    yarn download-ffmpeg-linux-x64
    yarn prepack-linux
    yarn pack-linux
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-git}",usr/bin}
    cp -r "${srcdir}/${pkgname%-git}/dist/linux-unpacked/"* "${pkgdir}/opt/${pkgname%-git}"
    ln -sf "/opt/${pkgname%-git}/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-git}/icon-build/app-512.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
}