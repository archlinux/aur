# Maintainer: Sythelux Rikd <dersyth@gmail.com>
# Maintainer: Mattia Basaglia <glax@dragon.best>
# Maintainer: Evert Vorster <evorster@gmail.com>
_corpname=glaxnimate
_pkgname='glaxnimate'
pkgname="glaxnimate-git"
_git_branch=master
pkgver=0.5.1+flatpak_69_g56a4473f
pkgrel=1
pkgdesc="Simple vector animation program."
url="https://glaxnimate.mattbas.org/"
license=('GPL3')
arch=('x86_64' 'i686' 'armv7h' 'aarch64' 'riscv32' 'riscv64')
makedepends=('git' 'cmake' 'make' 'gcc' 'qt6-declarative')
depends=('python' 'zlib' 'hicolor-icon-theme' 'potrace' 'ffmpeg' 'libarchive' 'qt6-tools' 'qt6-base' 'qt6-imageformats' 'qt6-svg')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
    "$_pkgname::git+https://gitlab.com/mattbas/$_pkgname/#branch=$_git_branch"
    "git+https://gitlab.com/mattbas/CMake-Lib.git"
    "git+https://github.com/KDE/breeze-icons.git"
    "git+https://gitlab.com/mattbas/python-lottie.git"
    "git+https://gitlab.com/mattbas/Qt-Color-Widgets.git"
    "git+https://gitlab.com/mattbas/Qt-History-LineEdit.git"
    "git+https://github.com/pybind/pybind11.git"
    "git+https://github.com/rpavlik/cmake-modules.git"
    "git+https://github.com/mbasaglia/QtAndroidCmake"
)
sha256sums=(
	'SKIP'
	'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
	)

prepare() {
    cd "$_pkgname/"

    # Provide git submodules
    echo "Initializing Submodules"
    git submodule init

    echo "Updating git submodule paths"
#    git submodule update --init --recursive
    git config submodule.src/cmake.url "$srcdir/CMake-Lib"
    git config submodule.src/data/icons/breeze-icons.url "$srcdir/breeze-icons"
    git config submodule.src/data/lib/python-lottie.url "$srcdir/python-lottie"
    git config submodule.src/external/Qt-Color-Widgets.url "$srcdir/Qt-Color-Widgets"
    git config submodule.src/external/Qt-History-LineEdit.url "$srcdir/Qt-History-LineEdit"
    git config submodule.src/external/pybind11.url "$srcdir/pybind11"
    git config submodule.src/external/cmake-modules.url "$srcdir/cmake-modules"
    git config submodule.src/src/android/qt-android-cmake.url "$srcdir/QtAndroidCmake"

    echo "Updating git submodules"
    git -c protocol.file.allow=always submodule update

}

pkgver() {
    cd "$srcdir/$_pkgname/"
    git describe --tags | tr - _
}

build() {
    cd "$srcdir/$_pkgname/"
    mkdir -p build
    cd build
    cmake ".." -DCMAKE_INSTALL_PREFIX=/usr
    # For more build jobs:
    # echo 'MAKEFLAGS="-j4"' >>/etc/makepkg.conf
    # (or ~/.makepkg.conf)
    make
    make translations VERBOSE=1
}

package() {
    cd "$srcdir/$_pkgname/build"
    make install DESTDIR=$pkgdir >/dev/null
}


