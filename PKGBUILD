# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=upscayl-git
_pkgname=Upscayl
pkgver=2.9.4.r1.g39eefe3
pkgrel=1
_electronversion=27
pkgdesc="Free and Open Source AI Image Upscaler for Linux, MacOS and Windows built with Linux-First philosophy."
arch=('x86_64')
url='https://upscayl.org/'
_ghurl='https://github.com/upscayl/upscayl'
license=('AGPL3')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
depends=(
    'alsa-lib'
    'libxfixes'
    'gtk3'
    'libcups'
    'vulkan-icd-loader'
    'mesa'
    'nss'
    'libxcomposite'
    'libxrandr'
    'expat'
    'at-spi2-core'
    'pango'
    'libx11'
    'libxext'
    'libdrm'
    'nspr'
    'cairo'
    'libxkbcommon'
    'libxdamage'
    'libxcb'
)
makedepends=(
    'git'
    'npm'
    'nvm'
    'elfutils'
    "electron${_electronversion}"
)
source=(
    "${pkgname%-git}::git+${_ghurl}.git"
)
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install 16
    nvm use 16
}
build() {
    sed -i "s|@electronversion@|${_electronversion}|" "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    cd "${srcdir}/${pkgname%-git}"
    electronDist="/usr/lib/electron${_electronversion}"
    electronVer="$(electron${_electronversion} --version | tail -c +2)"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    sed -e '173,175d' -e 's|"rpm"|"AppImage"|g' -e '27i\  "repository": "https://github.com/TGS963/upscayl",' -i package.json
    npm install
    npm run dist:linux
    sed "s|${pkgname%-git}-run|${pkgname%-git} --no-sandbox|g;s|org.${pkgname%-git}.${_pkgname}|${pkgname%-git}|g" \
        -i "${srcdir}/${pkgname%-git}/dist/linux-unpacked/resources/org.${pkgname%-git}.${_pkgname}.desktop"
}
package(){
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-git}",usr/bin}
    cp -r "${srcdir}/${pkgname%-git}/dist/linux-unpacked/"* "${pkgdir}/opt/${pkgname%-git}"
    ln -sf "/opt/${pkgname%-git}/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}/dist/linux-unpacked/resources/org.${pkgname%-git}.${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
}