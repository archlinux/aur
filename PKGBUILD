# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_upstreamver='1.4.1'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='github-tags'
_repo='VeriFIT/mata'


pkgname=mata
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="Open source automata library that offers interface for different kinds of automata (NFA, AFA, etc.)"
arch=('x86_64')
url="https://github.com/${_repo}"
license=('GPL3')
groups=()
depends=(
  'gcovr'
  'lcov'
  'xdg-utils'
)
makedepends=(
    'cmake'
)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('33f5a7f4d68403ab2e5c48b4050162c25702d0f89ef9c101f2573ff9af7ac09a')

prepare() {
    mkdir -p build

    # Build shared library
    sed -i 's/add_library(libmata STATIC/add_library(libmata SHARED/' "${pkgname}-${pkgver}/src/CMakeLists.txt"

    # Fix libmata dependencies
    sed -i 's/target_link_libraries(libmata simlib)/target_link_libraries(libmata re2 simlib)/' "${pkgname}-${pkgver}/src/CMakeLists.txt"

    # Add install target for libraries
    echo "install (TARGETS libmata LIBRARY DESTINATION lib RUNTIME DESTINATION bin)" >> "${pkgname}-${pkgver}/src/CMakeLists.txt"
    # echo "install (TARGETS re2 LIBRARY DESTINATION lib RUNTIME DESTINATION bin)" >> "${pkgname}-${pkgver}/3rdparty/re2/CMakeLists.txt"
    # echo "install (TARGETS simlib LIBRARY DESTINATION lib RUNTIME DESTINATION bin)" >> "${pkgname}-${pkgver}/3rdparty/simlib/CMakeLists.txt"
    echo "install (TARGETS mata-code LIBRARY DESTINATION lib RUNTIME DESTINATION bin)" >> "${pkgname}-${pkgver}/cli/CMakeLists.txt"
}

build() {
    cmake -B build -S "${pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib
    cmake --build build
}

check(){
    cd "${pkgname}-${pkgver}"
    ctest --output-on-failure ${MAKE_FLAGS}
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
