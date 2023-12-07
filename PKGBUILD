# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributer: Bet4 <0xbet4@gmail.com>
# Contributer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: ahrs <Forward dot to at hotmail dot co dot uk>
# Contributor: Aaron Abbott <aabmass@gmail.com>
# Contributer: fleischie
# Contributer: auk
pkgname=hyper-git
_pkgname=Hyper
pkgver=4.0.0.canary.5.r250.ga1da6e79
_electronversion=24
pkgrel=1
pkgdesc="A terminal built on web technologies"
arch=('any')
url="https://hyper.is/"
_ghurl="https://github.com/vercel/hyper"
license=('MIT')
depends=('bash' 'python' 'alsa-lib' 'libxfixes' 'cairo' 'libxcb' 'glibc' 'nspr' 'at-spi2-core' 'pango' 'nss' 'libx11' 'libcups' 'expat' \
    'libxcomposite' 'gtk3' 'libxkbcommon' 'gcc-libs' 'libxext' 'mesa' 'libxdamage' 'libxrandr' 'libdrm' 'glib2' 'dbus' 'hicolor-icon-theme')
makedepends=(
    'git'
    'npm>=9.8.1'
    'yarn'
    'nvm'
    'python>=3.8'
    'libarchive'
    'libicns'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
    "${pkgname%-git}::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '8915ca75d453698df81f7f3305cce6869f4261d754d90f0c3724b73c7b24ca84')
pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "%s" "$(git describe --tags | sed 's/\w\+\///g;s/\([^-]*-g\)/r\1/;s/-/./g;s/v//g')"
}
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install 18
    nvm use 18
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-git}|g" \
        -e "s|@appasar@|app|g" \
        -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --categories "System;Utility" --name "${_pkgname}" --exec "${pkgname%-git} --no-sandbox %U"
    cd "${srcdir}/${pkgname%-git}"
    rm -rf .yarnrc
    sed -e '/"deb",/d' -e '/"rpm",/d' -e '/"snap",/d' -e '/"pacman"/d' -e 's|"AppImage",|"AppImage"|g' -i electron-builder.json
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    yarn install --cache-folder "${srcdir}/.yarn_cache"
    yarn run dist
    cd "${srcdir}/${pkgname%-git}/dist/.icon-set"
    cp icon_32.png icon_32x32.png
    cp icon_64.png icon_64x64.png
    cp icon_128.png icon_128x128.png
    cp icon_256.png icon_256x256.png
    cp icon_512.png icon_512x512.png
    cp icon_1024.png icon_1024x1024.png
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-git}",usr/bin}
    ln -sf "/opt/${pkgname%-git}/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
    cp -r "${srcdir}/${pkgname%-git}/dist/linux-unpacked/"* "${pkgdir}/opt/${pkgname%-git}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname%-git}/dist/.icon-set/icon_${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}