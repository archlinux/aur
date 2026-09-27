# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=reflective-rapidjson
pkgname=reflective-rapidjson
pkgver=0.0.17
pkgrel=2
pkgdesc='Code generator for serializing/deserializing C++ objects to/from JSON using Clang and RapidJSON'
arch=('x86_64')
url="https://github.com/Martchus/${_reponame}"
license=('GPL-2.0-or-later')
depends=(
    'c++utilities'
    'glibc'
    'libgcc'
    'libstdc++'
    'rapidjson'
    'llvm-libs'
    'clang'
)
makedepends=(
    'cmake'
    'clang-tools-extra'
    'doxygen'
    'graphviz'
    'llvm'
    'ninja'
)
checkdepends=(
    'cppunit'
    'boost'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('4402950a92ddb4befe94782a00a37bd36a340ddd8eecd41e6c76bd1a1ae59ca0')

build() {
    local cmake_options=(
        -B build
        -S "${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
        -G Ninja
        -D CMAKE_BUILD_TYPE=Release
        -D CMAKE_INSTALL_PREFIX=/usr
        -D BUILD_SHARED_LIBS=ON
    )
    cmake "${cmake_options[@]}"
    cmake --build build --target all apidoc
}

check() {
    cmake --build build --target tests

    local ctest_flags=(
        --test-dir build
        --output-on-failure
        --parallel $(nproc)
    )
    ctest "${ctest_flags[@]}"
}

package_reflective-rapidjson() {
    depends+=(
        'libc++utilities.so'
        'libLLVM.so'
    )
    optdepends=(
        "boost: use Boost.Hana instead of code generator"
        "$pkgname-doc: API documentation"
    )

    DESTDIR="${pkgdir}" cmake --install build
    rm -rf "${pkgdir}/usr/share/${pkgbase}/api-doc"
}

package_reflective-rapidjson-doc() {
    pkgdesc+=" - API documentation"
    depends=()

    DESTDIR="${pkgdir}" cmake --build build --target install-api-doc
}
