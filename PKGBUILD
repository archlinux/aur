# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fotoluks-manager-git3
_pkgname="Fotoluks Manager"
pkgver=2.0.0.r0.g2723374
_electronversion=22
_nodeversion=18
pkgrel=1
pkgdesc="Application for managing orders, setting tasks and mini-applications for working with MoySklad."
arch=('any')
url="https://github.com/Evernayt/fotoluks-manager"
license=('LicenseRef-custom')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'git'
    'nvm'
    'npm'
    'gcc'
    'make'
)
source=(
    "${pkgname%-git}.git::git+${url}.git"
)
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    _ensure_local_nvm
    gendesk -q -f -n --categories "Development" --name "${_pkgname}" --exec "${pkgname%-git} --no-sandbox %U"
    cd "${srcdir}/${pkgname%-git}.git"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    mv src/components/UI src/components/ui
    mv src/components/Toolbar src/components/toolbar
    mv src/components/Updater src/components/updater
    mv src/components/ui/Table src/components/ui/table
    mv src/components/ui/Search src/components/ui/search
    mv src/components/ui/Pagination src/components/ui/pagination
    npm install
    npm run package
    cp release/build/.icon-set/icon_256.png release/build/.icon-set/icon_256x256.png
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-git}",usr/bin}
    cp -r "${srcdir}/${pkgname%-git}.git/release/build/linux-"*/* "${pkgdir}/opt/${pkgname%-git}"
    ln -sf "/opt/${pkgname%-git}/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/${pkgname%-git}.git/release/build/.icon-set/icon_${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/release/build/linux-"*/LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}