# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=masscode-git
_pkgname=massCode
pkgver=v3.10.0.r2.gae9eb6b
_electronversion=16
pkgrel=1
pkgdesc="A free and open source code snippets manager for developers"
arch=('any')
url="https://masscode.io/"
_ghurl="https://github.com/massCodeIO/massCode"
license=('MIT')
makedepends=(
    'npm'
    'pnpm>=8.0.0'
    'git'
    'nvm'
    'gendesk'
)
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-git}::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '779f956756ea4f3f91df0fac3d9338d82fc8a74d54f9dea63abe305b8355420c')
pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --tags | sed 's/\w\+\///g;s/\([^-]*-g\)/r\1/;s/-/./g'
}
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install 16
    nvm use 16
}
build() {
    sed "s|@electronversion@|${_electronversion}|" -i "${srcdir}/${pkgname%-git}.sh"
    gendesk -q -f -n --categories "Development" --name "${_pkgname}" --exec "${pkgname%-git}"
    _ensure_local_nvm
    cd "${srcdir}/${pkgname%-git}"
    sed "s|snap|AppImage|g" -i config/electron-builder.ts
    pnpm config set store-dir "${srcdir}/.pnpm_store"
    pnpm config set cache-dir "${srcdir}/.pnpm_cache"
    pnpm config set link-workspace-packages true
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    export PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
    pnpm install
    pnpm run build
    pnpm run release
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-git}/resources"
    install -Dm644 "${srcdir}/${pkgname%-git}/config/icons/256x256.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}