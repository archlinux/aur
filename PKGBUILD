# Maintainer: Severin Kaderli <severin.kaderli@gmail.com>
_pkgname=pegasus-frontend
pkgname=${_pkgname}-git
pkgver=alpha13.r30.g7648b41
pkgrel=1
pkgdesc="A cross platform, customizable graphical frontend for launching emulators and managing your game collection."
arch=('i686' 'x86_64')
url="https://pegasus-frontend.org/"
license=('GPL3')
makedepends=(
    'git'
    'qt5-tools'
    'qt5-quickcontrols'
    'qt5-gamepad'
    'qt5-svg'
    'qt5-multimedia'
    'qt5-graphicaleffects'
    'qt5-declarative'
    'qt5-imageformats'
    'sdl2'
)
depends=(
    'qt-gstreamer'
    'fontconfig'
    'openssl-1.0'
)
optdepends=(
    'polkit'
)
provides=('pegasus-frontend')
conflicts=('pegasus-frontend')
source=(
    "${_pkgname}::git+https://github.com/mmatyas/pegasus-frontend.git"
    "git+https://github.com/mmatyas/pegasus-frontend-translations.git"
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
        USE_SDL_GAMEPAD=1 \
        INSTALL_BINDIR=/usr/bin \
        INSTALL_DOCDIR=/usr/share/doc/pegasus-frontend \
        INSTALL_ICONDIR=/usr/share/pixmaps \
        INSTALL_DESKTOPDIR=/usr/share/applications \
        INSTALL_APPSTREAMDIR=/app/share/metainfo
    make
}

package() {
    cd "${srcdir}/${_pkgname}/build"
    make INSTALL_ROOT="${pkgdir}/" install
}
