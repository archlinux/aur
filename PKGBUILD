# Maintainer: Severin Kaderli <severin.kaderli@gmail.com>
_pkgname=pegasus-fe
pkgname=${_pkgname}-git
pkgver=alpha12.r12.gca00bb4
pkgrel=2
pkgdesc="A cross platform, customizable graphical frontend for launching emulators and managing your game collection."
arch=('i686' 'x86_64')
url="https://pegasus-frontend.org/"
license=('GPL3')
makedepends=(
    'git'
    'qt5-tools'
)
depends=(
    'qt-gstreamer'
    'fontconfig'
    'openssl-1.0'
    'qt5-svg'
    'qt5-multimedia'
    'qt5-gamepad'
    'qt5-graphicaleffects'
)
optdepends=(
    'polkit'
)
provides=('pegasus-fe')
conflicts=('pegasus-fe')
source=(
    "${_pkgname}::git+https://github.com/mmatyas/pegasus-frontend.git"
    "git+https://github.com/mmatyas/pegasus-frontend-translations.git#branch=master"
    "git+https://github.com/mmatyas/pegasus-theme-grid.git"
    "git+https://github.com/mmatyas/SortFilterProxyModel.git"
)
md5sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)

pkgver() {
    cd "${_pkgname}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    git submodule init
    git config submodule.lang.url "${srcdir}/pegasus-frontend-translations"
    git config submodule.src/themes/pegasus-theme-grid.url "${srcdir}/pegasus-theme-grid"
    git config submodule.thirdparty/SortFilterProxyModel.url "${srcdir}/SortFilterProxyModel"
    git submodule update
}

build() {
    cd "${srcdir}/${_pkgname}"
    mkdir -p ./build && cd build
    qmake .. \
        INSTALL_BINDIR=/usr/bin \
        INSTALL_ICONDIR=/usr/share/pixmaps \
        INSTALL_DESKTOPDIR=/usr/share/applications
    make
}

package() {
    cd "${srcdir}/${_pkgname}/build"
    make INSTALL_ROOT="${pkgdir}/" install
    install -Dm644 "../README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "../LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
