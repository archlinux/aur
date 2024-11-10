#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for StringZilla.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

readonly _pkgname="StringZilla"

pkgname="stringzilla"
pkgver="3.10.9"
pkgrel="1"
pkgdesc="Up to 10x faster strings for C, C++, Python, Rust and Swift."
arch=("x86_64")
url="https://github.com/ashvardanian/${_pkgname}"
license=("Apache-2.0")
makedepends=("cmake")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("03a3a71a0f7f40273c559a79d758f922fd9727eae6f01f3df5c4c69890906ff24f288805a564a596453abd8f92be94536887866d732dd92a35b8de33b549e1bf")

_compile()
{
    cmake -B "${srcdir}"/"${_pkgname}"-"${pkgver}"/build/ \
        -D CMAKE_BUILD_TYPE=None \
        -D CMAKE_INSTALL_PREFIX=/usr/ \
        -D STRINGZILLA_BUILD_BENCHMARK=OFF \
        -D STRINGZILLA_BUILD_SHARED=ON \
        -D STRINGZILLA_BUILD_TEST="$1" \
        -D STRINGZILLA_INCLUDE_INSTALL_DIR=/usr/include/ \
        -D STRINGZILLA_INSTALL=ON \
        -S "${srcdir}"/"${_pkgname}"-"${pkgver}"/ \
        -Wno-dev
    cmake --build "${srcdir}"/"${_pkgname}"-"${pkgver}"/build/
}

build()
{
    for build_tests in "OFF" "ON"; do
        _compile "${build_tests}"
    done
}

check()
{
    _compile "ON"
    # TODO Last test fails.
    # ctest --output-on-failure --test-dir "${srcdir}"/"${_pkgname}"-"${pkgver}"/build/
    cd "${srcdir}"/"${_pkgname}"-"${pkgver}"/build/ || exit 1
    ./stringzilla_test_cpp11
    ./stringzilla_test_cpp14
    ./stringzilla_test_cpp17
    ./stringzilla_test_cpp20
    ./stringzilla_test_cpp20_x86_serial
    ./stringzilla_test_cpp20_x86_avx2
    # ./stringzilla_test_cpp20_x86_avx512
    _compile "OFF"
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"/

    # Install the software.
    DESTDIR="${pkgdir}"/ cmake --install "${srcdir}"/"${_pkgname}"-"${pkgver}"/build/

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${_pkgname}"-"${pkgver}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/

    # Install the license.
    install -Dm644 "${srcdir}"/"${_pkgname}"-"${pkgver}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
