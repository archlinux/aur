# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=super-controller
pkgver=1.3.5
_electronversion=19
_nodeversion=14
pkgrel=4
pkgdesc="Give your MIDI devices super powers: take control of the lights, messages, and communication between controllers."
arch=('any')
url="https://github.com/aolsenjazz/super-controller"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'git'
    'node-gyp'
    'gcc'
    'make'
)
source=(
    "${pkgname}.git::git+${url}.git#tag=v${pkgver}"
)
sha256sums=('SKIP')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname} %U"
    _ensure_local_nvm
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    npm run post-clone
    npm run package
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname}",usr/bin}
    cp -r "${srcdir}/${pkgname}.git/release/build/linux-"*/* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname}.git/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}