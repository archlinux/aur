# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=upscayl-git
_pkgname=Upscayl
pkgver=2.9.5.r4.g99b9206
pkgrel=1
_electronversion=27
_nodeversion=18
pkgdesc="Free and Open Source AI Image Upscaler for Linux, MacOS and Windows built with Linux-First philosophy."
arch=('x86_64')
url='https://upscayl.org/'
_ghurl='https://github.com/upscayl/upscayl'
license=('AGPL3')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
depends=(
    "electron${_electronversion}"
    'libvips'
    'nodejs'
)
makedepends=(
    'git'
    'npm'
    'nvm'
    'elfutils'
    "electron${_electronversion}"
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'd4272fed78cdcacd9edfb019134ac485d65b43f4d8c7a4179edbaed56af9b231')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-git}|g" \
        -e "s|@appasar@|app|g" \
        -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    cd "${srcdir}/${pkgname//-/.}"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    sed -e '129,167d;/"zip",/d;/"deb",/d;/"rpm"/d;s|"AppImage",|"AppImage"|g' -e '27i\  "repository": "https://github.com/TGS963/upscayl",' -i package.json
    npm install
    npm run dist:linux
    sed "s|${pkgname%-git}-run|${pkgname%-git} --no-sandbox|g;s|org.${pkgname%-git}.${_pkgname}|${pkgname%-git}|g" \
        -i "${srcdir}/${pkgname//-/.}/dist/linux-unpacked/resources/org.${pkgname%-git}.${_pkgname}.desktop"
}
package(){
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/dist/linux-"*/resources/{app.asar,*.png} -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -r "${srcdir}/${pkgname//-/.}/dist/linux-"*/resources/{app.asar.unpacked,bin,models} "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname//-/.}/dist/linux-"*/resources/"org.${pkgname%-git}.${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
}