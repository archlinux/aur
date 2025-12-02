# Maintainer: AntKinton <antoniovx@gmail.com>
_pkgname=pegasus-frontend
pkgname=${_pkgname}-stable-git
pkgver=alpha16.r82.gc3462e68
pkgrel=1

# ----------------------------------------------------------
# Extract the commit hash dynamically from pkgver()
# ----------------------------------------------------------
_commit="${pkgver##*.}"   # extract text after last '.'
_commit="${_commit#g}"     # remove leading 'g'
echo "Using commit: ${_commit}"

pkgdesc="Stable version of Pegasus Frontend: A cross platform, customizable frontend for launching emulators and managing your game collection."
arch=('x86_64')
url="https://pegasus-frontend.org/"
license=('GPL3')

# ---------------------------------------------------------------------
# Autogenerate .install file dynamically
# ---------------------------------------------------------------------
_install_file="${pkgname}.install"
install="${_install_file}"

provides=("${_pkgname}-stable-git")
conflicts=("${_pkgname}-latest-git")

source=(
    "${_pkgname}::git+https://github.com/mmatyas/pegasus-frontend.git#commit=${_commit}"
    "git+https://github.com/mmatyas/pegasus-frontend-translations.git"
    "git+https://github.com/mmatyas/pegasus-theme-grid.git"
    "git+https://github.com/mmatyas/SortFilterProxyModel.git"
)
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

depends=(
    'qt5-declarative' 'qt5-graphicaleffects' 'qt5-imageformats'
    'qt5-multimedia' 'qt5-quickcontrols' 'qt5-quickcontrols2'
    'qt5-svg' 'gst-libav' 'gst-plugins-good'
)

makedepends=('git' 'qt5-base' 'qt5-tools' 'binutils')
optdepends=('qt5-gamepad: Gamepad support' 'sdl2: SDL2 support' 'polkit: Polkit support')

prepare() {
    cd "${srcdir}/${_pkgname}"
    git submodule init
    git config submodule.lang.url "${srcdir}/pegasus-frontend-translations"
    git config submodule.src/themes/pegasus-theme-grid.url "${srcdir}/pegasus-theme-grid"
    git config submodule.thirdparty/SortFilterProxyModel.url "${srcdir}/SortFilterProxyModel"
    git -c protocol.file.allow=always submodule update
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
        INSTALL_APPSTREAMDIR=/usr/share/metainfo
    make
}

package() {
    cd "${srcdir}/${_pkgname}/build"
    make INSTALL_ROOT="${pkgdir}/" install
}

