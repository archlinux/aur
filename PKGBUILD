# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=dupe-clear-git
_pkgname=DupeClear
pkgver=3.0.r65.gb9c3d0d
pkgrel=1
pkgdesc="A duplicate file cleaner."
arch=('any')
url="https://mozib.io/dupeclear"
_ghurl="https://github.com/antikmozib/Dupe-Clear"
license=('GPL-3.0-only')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    'dotnet-runtime>=8'
)
makedepends=(
    'gendesk'
    'git'
)
options=(
    '!strip'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '9887c2b5cc4171f8768feae7da23aa6765eaa859434757d416fb8988a36936c8')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
    set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
prepare() {
    sed -e "
        s/@appname@/${pkgname%-git}/g
        s/@runname@/${_pkgname}.Desktop/g
    " -i "${srcdir}/${pkgname%-git}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-git}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${pkgname%-git}" --exec="${pkgname%-git}"
    icotool -x "${srcdir}/${pkgname%-git}.git/${_pkgname}/Assets/Icons/${_pkgname}.ico" -o "${srcdir}/${pkgname%-git}.git"
}
build() {
    cd "${srcdir}/${pkgname%-git}.git"
    dotnet build DupeClear.Desktop
    find "${srcdir}/${pkgname%-git}.git/${_pkgname}.Desktop/bin/Debug/net8.0-windows" \
        -type f \( -name "*.dll" -o -name "*.so" -o -name "*.json" -o -name "*.pdb" \) \
        -exec chmod 644 {} +
    rm -rf "${srcdir}/${pkgname%-git}.git/${_pkgname}.Desktop/bin/Debug/net8.0-windows/runtimes/"{osx,win,win-arm64,win-x64,win-x86}
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname%-git}.git/${_pkgname}.Desktop/bin/Debug/net8.0-windows/"* "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    icon_sizes=(16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256)
    for _icons in "${icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname%-git}.git/${_pkgname}_"*_"${_icons}"*.png \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}