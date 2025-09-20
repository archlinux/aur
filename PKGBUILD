#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for StringZilla.
# Maintainer: Collins Kimutai <ngenocollins599@gmail.com>

pkgname=stringzilla
pkgver=4.0.13
pkgrel=1
pkgdesc="Up to 10x faster strings for C, C++, Python, Rust and Swift."
arch=("x86_64")
url="https://github.com/ashvardanian/StringZilla"
license=("Apache-2.0")
makedepends=("cmake" "git")
source=("git+https://github.com/ashvardanian/StringZilla.git#tag=v4.0.13")
noextract=("StringZilla")  
sha512sums=('SKIP')
validpgpkeys=()

prepare() {
    cd "$srcdir/StringZilla" || exit
    git submodule update --init --recursive
}

_compile() {
    cd "$srcdir/StringZilla" || exit
    mkdir -p build
    cmake -B build \
        -D CMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -D CMAKE_BUILD_TYPE=None \
        -D CMAKE_INSTALL_PREFIX=/usr/ \
        -D STRINGZILLA_BUILD_BENCHMARK=OFF \
        -D STRINGZILLA_BUILD_SHARED=ON \
        -D STRINGZILLA_BUILD_TEST="$1" \
        -D STRINGZILLA_INCLUDE_INSTALL_DIR=/usr/include/ \
        -D STRINGZILLA_INSTALL=ON \
        -Wno-dev
    cmake --build build
}

build() {
    for build_tests in "OFF" "ON"; do
        _compile "${build_tests}"
    done
}

check() {
    _compile "ON"
    cd "$srcdir/StringZilla/build" || exit
    ./stringzilla_test_cpp11
    ./stringzilla_test_cpp14
    ./stringzilla_test_cpp17
    ./stringzilla_test_cpp20
    #./stringzilla_test_cpp20_x86_serial
    #./stringzilla_test_cpp20_x86_avx2
    # ./stringzilla_test_cpp20_x86_avx512
    _compile "OFF"
}

package() {
    cd "$srcdir/StringZilla/build" || exit
    DESTDIR="${pkgdir}" cmake --install .
    # Documentation
    install -Dm644 ../README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    # License
    install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

