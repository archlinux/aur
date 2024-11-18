# Maintainer: Klaus Alexander Seiﬆrup <klaus at seistrup dot dk>
pkgname=dooble-git
_pkgname=Dooble
pkgver=2024.11.17.r0.g14fe723
pkgrel=1
pkgdesc="Web browser based on QtWebEngine"
arch=("x86_64")
url="https://textbrowser.github.io/dooble"
_ghurl="https://github.com/textbrowser/dooble"
license=('LicenseRef-custom')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=(
    'gpgme'
    'qt5-base'
    'qt5-declarative'
    'qt5-webengine'
)
optdependes=(
    'bzip2: needed in plugins/multimedia/libffmpegmediaplugin.so'
)
makedepends=(
    'findutils'
    'base-devel'
    'qt6-base'
    'qt6-charts'
    'gcc'
    'cmake'
    'fakeroot'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '29b1db96c081272e804e319cec3d35978ace6bbf5b930bfb5cdb11f35d8e9a6e')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
build() {
    sed -e "
        s/@appname@/${pkgname%-git}/g
        s/@runname@/${_pkgname}/g
    " -i "${srcdir}/${pkgname%-git}.sh"
    cd "${srcdir}/${pkgname//-/.}"
    sed -i "s/\/usr\/bin\/${pkgname%-git}/${pkgname%-git} %U/g" Distributions/"${pkgname%-git}".desktop
    #sed '38i\#include <QInputDialog>' -i Source/dooble.cc
    sed -i "/-Werror/d" "${pkgname%-git}.pro"
    qmake -o Makefile "${pkgname%-git}.pro"
    make
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 "${srcdir}/${pkgname//-/.}/${_pkgname}" -t "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/Data/"*.txt -t "${pkgdir}/usr/lib/${pkgname%-git}/Data"
    install -Dm644 "${srcdir}/${pkgname//-/.}/Documentation/Documents/"*.pdf -t "${pkgdir}/usr/lib/${pkgname%-git}/Documentation"
    install -Dm644 "${srcdir}/${pkgname//-/.}/Documentation/"{KDE,TO-DO} -t "${pkgdir}/usr/lib/${pkgname%-git}/Documentation"
    install -Dm644 "${srcdir}/${pkgname//-/.}/Icons/Logo/${pkgname%-git}.png" -t "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/Translations/"*.qm -t "${pkgdir}/usr/lib/${pkgname%-git}/Translations"
    install -Dm644 "${srcdir}/${pkgname//-/.}/Translations/${pkgname%-git}_zh_CN_simple.qm" "${pkgdir}/usr/lib/${pkgname%-git}/Translations/${pkgname%-git}_zh_CN.qm"
    install -Dm644 "${srcdir}/${pkgname//-/.}/Charts/"* -t "${pkgdir}/usr/lib/${pkgname%-git}/Charts"
    install -Dm644 "${srcdir}/${pkgname//-/.}/Data/"*.txt -t "${pkgdir}/usr/lib/${pkgname%-git}/Data"
    install -Dm644 "${srcdir}/${pkgname//-/.}/Data/README" -t "${pkgdir}/usr/lib/${pkgname%-git}/Data"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/Icons/Logo/${pkgname%-git}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname//-/.}/Distributions/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
}
