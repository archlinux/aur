# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributer: Bet4 <0xbet4@gmail.com>
# Contributer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: ahrs <Forward dot to at hotmail dot co dot uk>
# Contributor: Aaron Abbott <aabmass@gmail.com>
# Contributer: fleischie
# Contributer: auk
pkgname=hyper-git
_pkgname=Hyper
pkgver=4.0.0.canary.5.r298.g2207fa95
_electronversion=24
pkgrel=1
pkgdesc="A terminal built on web technologies"
arch=('any')
url="https://hyper.is/"
_ghurl="https://github.com/vercel/hyper"
license=('MIT')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=(
    'hicolor-icon-theme'
    'nodejs'
    'gtk3'
    'alsa-lib'
    'nspr'
    'nss'
)
makedepends=(
    'git'
    'npm'
    'yarn'
    'nvm'
    'python>=3.8'
    'libarchive'
    'libicns'
)
_electron_file_list=(
	chrome-sandbox
	chrome_{1,2}00_percent.pak
	chrome_crashpad_handler
	libvk_swiftshader.so
	libvulkan.so.1
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
)
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    printf "%s" "$(git describe --tags | sed 's/\w\+\///g;s/\([^-]*-g\)/r\1/;s/-/./g;s/v//g')"
}
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install 18
    nvm use 18
}
build() {
    _ensure_local_nvm
    gendesk -q -f -n --categories "System" --name "${_pkgname}" --exec "${pkgname%-git} --no-sandbox %U"
    cd "${srcdir}/${pkgname//-/.}"
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export npm_config_disturl=https://electronjs.org/headers
    export HOME="${srcdir}/.electron-gyp"
    sed 's/\ \&\& husky install//g' -i package.json
    sed -e '/"deb",/d' -e '/"rpm",/d' -e '/"snap",/d' -e '/"pacman"/d' -e 's|"AppImage",|"AppImage"|g' -i electron-builder.json
    install -Dm755 -d "${srcdir}/${pkgname//-/.}/node_modules/electron/dist"
    yarn install --cache-folder "${srcdir}/.yarn_cache"
    yarn run build
    yarn run dist
    cd "${srcdir}/${pkgname//-/.}/dist/.icon-set"
    cp icon_16x16.png icon_16.png
    cp icon_48x48.png icon_48.png
    for _files in "${_electron_file_list[@]}"; do
		rm -rf "${srcdir}/${pkgname//-/.}/dist/linux-"*/"${_files}"
	done
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-git}",usr/bin}
    ln -sf "/opt/${pkgname%-git}/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
    cp -r "${srcdir}/${pkgname//-/.}/dist/linux-"*/* "${pkgdir}/opt/${pkgname%-git}"
    for _icons in 16 32 48 64 128 256 512 1024;do
        install -Dm644 "${srcdir}/${pkgname//-/.}/dist/.icon-set/icon_${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}