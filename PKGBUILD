# Maintainer: Klaus Alexander Seiﬆrup <klaus at seistrup dot dk>
pkgname=dooble-git
_pkgname=Dooble
pkgver=2024.01.25.r25.gd1fdfdcf
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
    'base-devel'
    'fakeroot'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '8c1c658ce21dc1f5fe8687c7406b3f263dc53e2498662c538d963644e9dacdf1')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
build() {
    sed -e "s|@appname@|${pkgname%-git}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-git}.sh"
    cd "${srcdir}/${pkgname//-/.}"
    sed "s|/usr/bin/${pkgname%-git}|${pkgname%-git} %U|g" -i Distributions/"${pkgname%-git}".desktop
    sed '38i\#include <QInputDialog>' -i Source/dooble.cc
    qmake -o Makefile "${pkgname%-git}.pro"
    make
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 "${srcdir}/${pkgname//-/.}/${_pkgname}" -t "${pkgdir}/opt/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/Data/"*.txt -t "${pkgdir}/opt/${pkgname%-git}/Data"
    install -Dm644 "${srcdir}/${pkgname//-/.}/Documentation/Documents/"*.pdf -t "${pkgdir}/opt/${pkgname%-git}/Documentation"
    install -Dm644 "${srcdir}/${pkgname//-/.}/Documentation/"{KDE,TO-DO} -t "${pkgdir}/opt/${pkgname%-git}/Documentation"
    install -Dm644 "${srcdir}/${pkgname//-/.}/Icons/Logo/${pkgname%-git}.png" -t "${pkgdir}/opt/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/Translations/"*.qm -t "${pkgdir}/opt/${pkgname%-git}/Translations"
    install -Dm644 "${srcdir}/${pkgname//-/.}/Translations/${pkgname%-git}_zh_CN_simple.qm" "${pkgdir}/opt/${pkgname%-git}/Translations/${pkgname%-git}_zh_CN.qm"
    install -Dm644 "${srcdir}/${pkgname//-/.}/Charts/"* -t "${pkgdir}/opt/${pkgname%-git}/Charts"
    install -Dm644 "${srcdir}/${pkgname//-/.}/Data/"*.txt -t "${pkgdir}/opt/${pkgname%-git}/Data"
    install -Dm644 "${srcdir}/${pkgname//-/.}/Data/README" -t "${pkgdir}/opt/${pkgname%-git}/Data"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/Icons/Logo/${pkgname%-git}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname//-/.}/Distributions/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
}