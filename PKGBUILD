# Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Contributor: Davorin Učakar <davorin.ucakar@gmail.com>
pkgname=libsquish-fixed-tables
_pkgname=libsquish
pkgver=1.15
pkgrel=1
pkgdesc="DXT compression library with Rich Geldreich's fixed solid color lookup tables"
depends=('gcc-libs')
makedepends=('cmake')
arch=('x86_64')
provides=('libsquish')
conflicts=('libsquish')
url='http://sourceforge.net/projects/libsquish/'
license=('MIT')
source=("http://downloads.sourceforge.net/project/libsquish/libsquish-${pkgver}.tgz"
        "fixed_solid_color_lookup_tables.patch")
sha256sums=('628796eeba608866183a61d080d46967c9dda6723bc0a3ec52324c85d2147269'
            'f489515ba5ba8aed12876becdc82201041bb54b5be0b05dbd3c0b9e907290cfc')

prepare() {
    cd "${srcdir}"
    patch -Np1 -i "${srcdir}/fixed_solid_color_lookup_tables.patch"
}

build() {
    mkdir -p "${srcdir}/build" && cd "${srcdir}/build"
    cmake \
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D BUILD_SHARED_LIBS=ON \
        ..
    make
}

package() {
    cd "${srcdir}/build"
    cmake -D CMAKE_INSTALL_PREFIX="${pkgdir}/usr" -P cmake_install.cmake
    install -Dm 644 ../CMakeModules/FindlibSquish.cmake "${pkgdir}/usr/share/cmake/Modules/FindlibSquish.cmake"
    install -Dm 644 ../LICENSE.txt "${pkgdir}/usr/share/licenses/$_pkgname/LICENSE"
}
