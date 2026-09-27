# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=reflective-rapidjson
pkgname=reflective-rapidjson-git
_name=${pkgname%-git}
pkgver=276.cd126d0
pkgrel=2
pkgdesc='Code generator for serializing/deserializing C++ objects to/from JSON using Clang and RapidJSON'
arch=('x86_64')
url="https://github.com/Martchus/${_reponame}"
license=('GPL-2.0-or-later')
depends=(
    'glibc'
    'libgcc'
    'libstdc++'
    'c++utilities-git'
    'rapidjson'
    'llvm-libs'
    'clang'
)
makedepends=(
    'cmake'
    'git'
    'clang-tools-extra'
    'llvm'
    'ninja'
)
checkdepends=(
    'cppunit'
    'boost'
)
optdepends=(
    "boost: use Boost.Hana instead of code generator"
    "$_name-doc: for API documentation"
)
source=("${_reponame}::${MARTCHUS_GIT_URL_PREFIX:-git+https://github.com/Martchus}/${_reponame}.git")
sha256sums=('SKIP')

pkgver() {
    echo "$(git -C "${_reponame}" rev-list --count HEAD).$(git -C "${_reponame}" rev-parse --short HEAD)"
}

build() {
    local cmake_options=(
        -B build
        -S "${PROJECT_DIR_NAME:-$_reponame}"
        -G Ninja
        -D CMAKE_BUILD_TYPE=Release
        -D CMAKE_INSTALL_PREFIX=/usr
        -D BUILD_SHARED_LIBS=ON
        -D CONFIGURATION_NAME:STRING='git'
        -D CONFIGURATION_PACKAGE_SUFFIX:STRING='-git'
        -D CONFIGURATION_TARGET_SUFFIX:STRING='git'
    )
    cmake "${cmake_options[@]}"
    cmake --build build --target all
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

package() {
    depends+=(
        'libc++utilities-git.so'
        'libLLVM.so'
    )

    DESTDIR="${pkgdir}" cmake --install build
}
