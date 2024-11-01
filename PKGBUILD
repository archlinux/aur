#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for usearch.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

declare -r _tag="6a0e2ee3db127a32c9d4d6f4b1b20eeb5b71aef1"

pkgname="usearch"
pkgver="2.16.0"
pkgrel="1"
pkgdesc="Fast open-source search and clustering engine for vectors."
arch=("x86_64")
url="https://github.com/unum-cloud/${pkgname}"
license=("Apache-2.0")
depends=("stringzilla")
makedepends=("cmake" "git")
source=("${pkgname}::git+${url}.git#tag=${_tag}"
    "git+https://github.com/Maratyszcza/FP16.git"
    "git+https://github.com/ashvardanian/SimSIMD.git"
    "git+https://github.com/ashvardanian/StringZilla.git")
sha512sums=("SKIP"
    "SKIP"
    "SKIP"
    "SKIP")

_compile()
{
    cmake -B "${srcdir}"/"${pkgname}"/build/ \
        -D CMAKE_BUILD_TYPE=None \
        -D CMAKE_INSTALL_PREFIX=/usr/ \
        -D USEARCH_BUILD_BENCH_CPP=OFF \
        -D USEARCH_BUILD_LIB_C=ON \
        -D USEARCH_BUILD_SQLITE=ON \
        -D USEARCH_BUILD_TEST_C="$1" \
        -D USEARCH_BUILD_TEST_CPP="$1" \
        -D USEARCH_BUILD_WOLFRAM=OFF \
        -D USEARCH_INSTALL=ON \
        -D USEARCH_USE_FP16LIB=OFF \
        -D USEARCH_USE_JEMALLOC=OFF \
        -D USEARCH_USE_OPENMP=OFF \
        -D USEARCH_USE_SIMSIMD=ON \
        -S "${srcdir}"/"${pkgname}"/ \
        -Wno-dev
    cmake --build "${srcdir}"/"${pkgname}"/build/
}

prepare()
{
    cd "${srcdir}"/"${pkgname}"/ || exit 1
    git submodule init

    git config submodule.fp16.url "${srcdir}"/FP16/
    git config submodule.simsimd.url "${srcdir}"/SimSIMD/
    git config submodule.stringzilla.url "${srcdir}"/StringZilla/

    git -c protocol.file.allow=always submodule update
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
    # ctest --output-on-failure --test-dir "${srcdir}"/"${pkgname}"/build/
    cd "${srcdir}"/"${pkgname}"/build/ || exit 1
    ./test_c
    ./test_cpp
    _compile "OFF"
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"/

    # Install the software.
    DESTDIR="${pkgdir}"/ cmake --install "${srcdir}"/"${pkgname}"/build/

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${pkgname}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/

    # TODO
    # cd "${srcdir}"/"${pkgname}"/docs/ || exit 1
    # make html
    # cp -r "${srcdir}"/"${pkgname}"/build/docs/* "${pkgdir}"/usr/share/doc/"${pkgname}"/

    # find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type d -exec chmod 755 {} +
    # find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type f -exec chmod 644 {} +

    # Install the license.
    install -Dm644 "${srcdir}"/"${pkgname}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
