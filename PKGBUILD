# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Conor Anderson <conor@conr.ca>
# Contributor: Maxim Baz <$pkgname at maximbaz dot com>
pkgname=wire-desktop-git
pkgver=3.32.3079.r284.g3c4b3ee0
_electronversion=27
_nodeversion=14
pkgrel=1
pkgdesc='End-to-end encrypted messenger with file sharing, voice calls and video conferences'
arch=('any')
url="https://wire.com/"
_ghurl="https://github.com/wireapp/wire-desktop"
license=('GPL3')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=(
    'electron27'
)
makedepends=(
    'git'
    'npm'
    'nvm'
    'yarn'
    'gendesk'
)
optdepends=(
    'emoji-font: colorful emoji'
)
source=(
    "${pkgname%-git}::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '8915ca75d453698df81f7f3305cce6869f4261d754d90f0c3724b73c7b24ca84')
pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --tags | sed 's/\w\+\///g;s/\([^-]*-g\)/r\1/;s/-/./g'
}
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --categories "Network" --name "${pkgname%-git}" --exec "${pkgname%-git}"
    cd "${srcdir}/${pkgname%-git}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    sed "s|, 'deb', 'rpm'||g" -i bin/build-tools/lib/build-linux.ts
    yarn install --immutable #--cache-folder "${srcdir}/.yarn_cache"
    yarn build:linux:internal
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}/wrap/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}/resources/icons/256x256.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}