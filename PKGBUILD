# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=elephicon
pkgver=2.8.2
_electronversion=28
_nodeversion=18
pkgrel=1
pkgdesc="A GUI wrapper for png2icons, generates Apple ICNS and Microsoft ICO files from PNG files."
arch=('x86_64')
url="https://github.com/sprout2000/elephicon"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'git'
)
source=(
    "${pkgname}.git::git+${url}.git#tag=v${pkgver}"
    "${pkgname}.sh"
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
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --categories "Graphics;Utility" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    npm install
    npm run build
    npm run package
    cp release/.icon-set/icon_16x16.png release/.icon-set/icon_16.png
    cp release/.icon-set/icon_48x48.png release/.icon-set/icon_48.png
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/release/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/release/linux-unpacked/resources/app.asar.unpacked/dist/images/icon.png" \
        -t "${pkgdir}/usr/lib/${pkgname}/app.asar.unpacked/dist/images"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16 32 48 64 128 256 512 1024;do
        install -Dm644 "${srcdir}/${pkgname}.git/release/.icon-set/icon_${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}