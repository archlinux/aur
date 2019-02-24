# Maintainer: Aetf <aetf at unlimitedcodeworks dot xyz>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Peng Zhang <pczhang@gmail.com>

pkgname=alglib
pkgver=3.15.0
pkgrel=1
pkgdesc="A cross-platform numerical analysis and data processing library (third version). Free Version"
arch=('i686' 'x86_64')
url="http://www.alglib.net"
license=('GPL2')
#depends=('gmp' 'mpfr')
depends=('gcc-libs')
makedepends=('cmake')
options=('staticlibs')
source=("http://www.alglib.net/translator/re/alglib-${pkgver}.cpp.gpl.zip")
sha256sums=('3b9026cbe0ebca373f9d519f9355be2464df3bce7118d7c5f76a30e282a6ffa7')

prepare() {
    # generate a simple cmake file to build the library since the release
    # doesn't provide any build system
    cd ${srcdir}/cpp
    cat > CMakeLists.txt <<END
cmake_minimum_required(VERSION 3.0)
project(alglib VERSION ${pkgver})

file(GLOB SRCS src/*.cpp)
file(GLOB HEADERS src/*.h)

add_library(alglib_static STATIC \${SRCS})
set_target_properties(alglib_static PROPERTIES
    OUTPUT_NAME alglib
    PUBLIC_HEADER "\${HEADERS}"
)

add_library(alglib SHARED \${SRCS})
set_target_properties(alglib PROPERTIES
    VERSION "\${PROJECT_VERSION}"
    SOVERSION "\${PROJECT_VERSION_MAJOR}"
    PUBLIC_HEADER "\${HEADERS}"
)

include(GNUInstallDirs)
install(TARGETS alglib alglib_static
    LIBRARY DESTINATION "\${CMAKE_INSTALL_LIBDIR}"
    ARCHIVE DESTINATION "\${CMAKE_INSTALL_LIBDIR}"
    PUBLIC_HEADER DESTINATION "\${CMAKE_INSTALL_INCLUDEDIR}/libalglib"
)
install(FILES manual.cpp.html DESTINATION "\${CMAKE_INSTALL_DOCDIR}")
END
    mkdir -p build && cd build
}

build() {
    cd ${srcdir}/cpp/build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib ..
    make VERBOSE=1
}

package() {
    cd ${srcdir}/cpp/build
    make DESTDIR=${pkgdir}/ install
}
