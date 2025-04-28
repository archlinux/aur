# Maintainer:
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=dooble
pkgver=2025.04.27
pkgrel=1
pkgdesc="A minimal, scientific, and stable Web browser"
arch=('x86_64')
url="https://textbrowser.github.io/dooble"
license=('BSD-3-Clause')
depends=('bash' 'gcc-libs' 'glibc' 'gpgme' 'qt6-base' 'qt6-charts' 'qt6-declarative' 'qt6-webengine')
makedepends=('git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/textbrowser/dooble/archive/refs/tags/${pkgver}.tar.gz"
        "git+https://github.com/textbrowser/dooble-dictionaries.git"
        "${pkgname}.sh")
sha256sums=('7c683ae0a5c3b31a10a64da8c222f59e81d32c2082437928e1bbf97418fa6d1e'
            'SKIP'
            '39705af759145ffa3cb670353e8fe459228f92d70ae98aa16212006f0c239c1b')

prepare() {
    cd "${pkgname}-${pkgver}"
    sed 's|/libexec/|/|g' -i dooble.pro
}

build() {
    cd "${pkgname}-${pkgver}"
    export DOOBLE_DICTIONARIES_DIRECTORY="${srcdir}/dooble-dictionaries/Dictionaries"
    qmake6 dooble.pro
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 Dooble -t "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 Icons/Logo/dooble.png -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 Distributions/dooble.desktop -t "${pkgdir}/usr/share/applications"
    install -Dm644 Translations/dooble_*.qm -t "${pkgdir}/usr/share/${pkgname}/translations"
    install -Dm644 qtwebengine_dictionaries/* -t "${pkgdir}/usr/share/${pkgname}/qtwebengine_dictionaries"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
