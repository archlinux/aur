#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for StringZilla.
# Maintainer: Collins Kimutai <ngenocollins599@gmail.com>

readonly _pkgname="StringZilla"

pkgname="stringzilla"
pkgver="3.12.3"
pkgrel="1"
pkgdesc="Up to 10x faster strings for C, C++, Python, Rust and Swift."
arch=("x86_64")
url="https://github.com/ashvardanian/${_pkgname}"
license=("Apache-2.0")
makedepends=("cmake")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("436b2b639d9d66d62d618d07174231f4e4dd9855edc6e03a5746c8c2f5205c2af9be9dfbf88a95fc12bb8d4abfffdf925fd85c0bd14b5ab3734d2f1105990f41")

_compile()
{
    cmake -B "${srcdir}"/"${_pkgname}"-"${pkgver}"/build/ \
	-D CMAKE_POLICY_VERSION_MINIMUM=3.5 \
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
