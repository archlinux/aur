# Maintainer: Darvin Delgado <dnmodder@gmail.com>
# Contributor: Mesmer <mesmer@fisica.if.uff.br>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: aldelaro5 <aldelaro5@gmail.com>

_pkgname='decaf-emu'
pkgname="${_pkgname}-git"
pkgver=r4931.497042c1
pkgrel=1
pkgdesc="An experimental open-source Nintendo Wii U emulator"
arch=('x86_64')
url="https://github.com/decaf-emu/decaf-emu"
license=('GPL3')
depends=('curl' 'ffmpeg' 'openssl' 'qt5-base' 'qt5-svg' 'sdl2' 'vulkan-icd-loader' 'zlib')
makedepends=('cmake' 'glslang' 'git' 'python' 'vulkan-validation-layers')
optdepends=('qt5-wayland: for Wayland support')
source=("git+https://github.com/decaf-emu/decaf-emu")
md5sums=('SKIP')


pkgver() {
    cd "$srcdir/$_pkgname"

    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgname"

    git submodule init
    git submodule update --init --recursive
}

build() {
    cd "$srcdir/$_pkgname"

    mkdir -p build && cd build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DDECAF_QT=ON
    make
}

package() {
    cd "$srcdir/$_pkgname/build"

    make DESTDIR="$pkgdir" install
}
