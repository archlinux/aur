# Maintainer: Sythelux Rikd <dersyth@gmail.com>
# Maintainer: Mattia Basaglia <glax@dragon.best>
_corpname=glaxnimate
_pkgname='glaxnimate'
pkgname="glaxnimate-git"
_git_branch=master
pkgver=0.5.3_51_g110a1d77
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
)
sha256sums=('SKIP')

prepare() {
    cd "$_pkgname/"

    # Provide git submodules
    git submodule init
    git submodule update --init --recursive
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

