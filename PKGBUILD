# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_upstreamver='0.51.0'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='github-tags'
_repo='VeriFIT/mata'


pkgname=mata
pkgver="${_upstreamver}"
pkgrel=1
epoch=1
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
sha256sums=('514d5695886ee02fb7ddf9e5e2a5293354fa0cbdc02fe7acf74d233f9e8a350b')

prepare() {
    mkdir -p build

    # Build shared library
    sed -i 's/add_library(libmata STATIC/add_library(libmata SHARED/' "${pkgname}-${pkgver}/src/CMakeLists.txt"
    sed -i 's/add_library(cudd STATIC/add_library(cudd SHARED/' "${pkgname}-${pkgver}/3rdparty/cudd/CMakeLists.txt"

    # Fix - one test is added to library instead of to tests
    sed -i 's/nfa\/tests-nfa-profiling.cc//' "${pkgname}-${pkgver}/src/CMakeLists.txt"
    sed -i 's/rra\/tests-rrt.cc/rra\/tests-rrt.cc nfa\/tests-nfa-profiling.cc/' "${pkgname}-${pkgver}/src/CMakeLists.txt"

    # Fix - plumbing inline functions are missing inline
    sed -i 's/void intersection/inline void intersection/' "${pkgname}-${pkgver}/include/mata/nfa-plumbing.hh"
    sed -i 's/void concatenate/inline void concatenate/' "${pkgname}-${pkgver}/include/mata/nfa-plumbing.hh"


    # Fix libmata dependencies
    sed -i 's/target_link_libraries(libmata simlib cudd)/target_link_libraries(libmata re2 simlib cudd)/' "${pkgname}-${pkgver}/src/CMakeLists.txt"

    # Add install target for libraries
    echo "install (TARGETS libmata LIBRARY DESTINATION lib RUNTIME DESTINATION bin)" >> "${pkgname}-${pkgver}/src/CMakeLists.txt"
    # echo "install (TARGETS re2 LIBRARY DESTINATION lib RUNTIME DESTINATION bin)" >> "${pkgname}-${pkgver}/3rdparty/re2/CMakeLists.txt"
    # echo "install (TARGETS simlib LIBRARY DESTINATION lib RUNTIME DESTINATION bin)" >> "${pkgname}-${pkgver}/3rdparty/simlib/CMakeLists.txt"
    echo "install (TARGETS cudd LIBRARY DESTINATION lib RUNTIME DESTINATION bin)" >> "${pkgname}-${pkgver}/3rdparty/cudd/CMakeLists.txt"
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
