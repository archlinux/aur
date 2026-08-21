# Maintainer: Klaus Alexander Seiﬆrup <klaus at seistrup dot dk>
pkgname=dooble-git
_pkgname=Dooble
pkgver=2026.08.20.r0.g4f10357
pkgrel=1
pkgdesc="Web browser based on QtWebEngine"
arch=('x86_64')
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
    'qt6-base'
    'qt6-charts'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
    "${pkgname//-/.}-dictionaries::git+https://github.com/textbrowser/dooble-dictionaries"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'SKIP'
            '3a1457d397f4de6102c5722d7cae9e43da056117504d04ae74c5f8fec5c5fd52')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
prepare() {
    cd "${srcdir}/${pkgname//-/.}"
    sed -i -e "
        s/@appname@/${pkgname%-git}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-git}.sh"
    export DOOBLE_DICTIONARIES_DIRECTORY="${srcdir}/${pkgname//-/.}-dictionaries/Dictionaries"
    sed -i "s/\/usr\/bin\/${pkgname%-git}/${pkgname%-git} %U/g" Distributions/"${pkgname%-git}".desktop
    sed -i "/-Werror/d" "${pkgname%-git}.pro"
    sed -i \
        -e '/^void dooble_web_engine_page::resize_certificate_error_widget/i\
#endif' \
        -e '/^void dooble_web_engine_page::connect_certificate_error_signals/i\
#if (QT_VERSION >= QT_VERSION_CHECK(6, 0, 0))' \
        Source/dooble_web_engine_page.cc
    cd "${srcdir}/${pkgname//-/.}/Translations"
    ln -sf qtbase_zh_CN.qm dooble_zh_CN.qm
    ln -sf dooble_zh_CN_simple.ts dooble_zh_CN.ts
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    qmake -o Makefile "${pkgname%-git}.pro"
    make
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 "${srcdir}/${pkgname//-/.}/${_pkgname}" -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -a "${srcdir}/${pkgname//-/.}/"{Charts,Contributions,Data,Distributions,Documentation,Icons,Translations,UI} \
        "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -a "${srcdir}/${pkgname//-/.}-dictionaries/Dictionaries" "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/Icons/Logo/${pkgname%-git}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname//-/.}/Distributions/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
}
