#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for StringZilla.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

readonly _pkgname="SimSIMD"

pkgname="simsimd"
pkgver="6.1.0"
pkgrel="1"
pkgdesc="Up to 200x faster dot products and similarity metrics."
arch=("x86_64")
url="https://github.com/ashvardanian/${_pkgname}"
license=("Apache-2.0")
makedepends=("cmake")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("73dc15e81b6061bb444b7115a2f3bd092f6f7209658107daeec934f47ef193a420134cc5fd56beeb6aa8b486edff6928ad94ac029b48a5b41a0200b77acc5591")

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
