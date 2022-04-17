# Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Contributor: Sebastian Meyer <aur@mailhell.seb7.de> 
# Contributor: Pedro H. Lara Campos <root@pedrohlc.com>

pkgname=lib32-sdl12-compat
_commit=030111ab691581d2eb0cd44586d69a4398185560
pkgver=1.2.52
pkgrel=2
pkgdesc="Provides a binary and source compatible API for programs written against SDL 1.2, but it uses SDL 2.0 behind the scenes. (32-bit)"
url="https://github.com/libsdl-org/sdl12-compat.git"
depends=('lib32-sdl2' 'lib32-glu' 'sdl12-compat')
makedepends=('cmake' 'git')
arch=('i686' 'x86_64')
conflicts=('lib32-sdl')
provides=('lib32-sdl=1.12.15')
license=('zlib')
source=("git+https://github.com/libsdl-org/sdl12-compat.git#commit=$_commit")
sha256sums=('SKIP')

build() {
    mkdir -p build
    cd build

    export CFLAGS+=" -m32"
    export CXXFLAGS+=" -m32"
    export LDFLAGS+=" -m32"
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    cmake -DSDL12TESTS=0 -DCMAKE_INSTALL_PREFIX=/usr ../sdl12-compat
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install

    cd "${pkgdir}"/usr
    rm -rf {bin,include,share}
    mv lib lib32
    sed -i'' -e 's/usr\/lib/usr\/lib32/g' lib32/pkgconfig/sdl12_compat.pc

    install -Dm644 "${srcdir}/sdl12-compat/LICENSE.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
