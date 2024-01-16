# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=catcat-dm-react
_pkgname="CatCatDM React"
pkgver=1.9.6
_electronversion=23
_nodeversion=18
pkgrel=3
pkgdesc="catcat弹幕姬.哔哩哔哩直播弹幕姬： 查看直播间弹幕。"
arch=('any')
url="https://github.com/kokolokksk/catcat-dm-react"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'hicolor-icon-theme'
)
makedepends=(
    'npm'
    'nvm'
    'gendesk'
    'yarn'
    'git'
    'make'
    'gcc'
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
    _ensure_local_nvm
    gendesk -f -n -q --categories "Utility" --name "${_pkgname}" --exec "${pkgname} %U"
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    sed "s|-p always|-p never|g" -i package.json
    npm install --force
    npm run package
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname}",usr/bin}
    cp -r  "${srcdir}/${pkgname}.git/release/build/linux-"*/* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname}.git/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644  "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}