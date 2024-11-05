#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for StringZilla.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

readonly _pkgname="SimSIMD"

pkgname="simsimd"
pkgver="6.0.1"
pkgrel="1"
pkgdesc="Up to 200x faster dot products and similarity metrics."
arch=("x86_64")
url="https://github.com/ashvardanian/${_pkgname}"
license=("Apache-2.0")
makedepends=("cmake")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("889fd41365f978c236d8ddc33600f02839f7169cca26f18bc45322c167e56ae21a15a7ff1e8d51b47f70066a8b2611ae23c5be2f9897a6287690613d3e6e33dc")

_compile()
{
    cmake -B "${srcdir}"/"${_pkgname}"-"${pkgver}"/build/ \
        -D CMAKE_BUILD_TYPE=None \
        -D CMAKE_INSTALL_PREFIX=/usr/ \
        -D SIMSIMD_BUILD_BENCHMARKS=OFF \
        -D SIMSIMD_BUILD_BENCHMARKS_WITH_CBLAS=OFF \
        -D SIMSIMD_BUILD_SHARED=ON \
        -D SIMSIMD_BUILD_TESTS="$1" \
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
    # TODO
    # ctest --output-on-failure --test-dir "${srcdir}"/"${_pkgname}"-"${pkgver}"/build/
    cd "${srcdir}"/"${_pkgname}"-"${pkgver}"/build/ || exit 1
    ./simsimd_test_compile_time
    ./simsimd_test_run_time
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
