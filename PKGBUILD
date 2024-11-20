#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for usearch.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

declare -r _tag="3d7a9017b6326178c7d9cc87742b8b064388b702"

pkgname="usearch"
pkgver="2.16.5"
pkgrel="1"
pkgdesc="Fast open-source search and clustering engine for vectors."
arch=("x86_64")
url="https://github.com/unum-cloud/${pkgname}"
license=("Apache-2.0")
depends=("fp16" "simsimd" "stringzilla")
makedepends=("cmake" "git")
source=("${pkgname}::git+${url}.git#tag=${_tag}"
    "git+https://github.com/Maratyszcza/FP16.git"
    "git+https://github.com/ashvardanian/SimSIMD.git"
    "git+https://github.com/ashvardanian/StringZilla.git")
sha512sums=("9a238a710369a44dabadbe764dec07dac762e8e67cf2a589dba4bb2dbe5040d24a5df05456d5d80936cc700b0138b6fe0828b812988e41f93253516c5e56fe48"
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
        -D USEARCH_USE_FP16LIB=ON \
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
    ctest --output-on-failure --test-dir "${srcdir}"/"${pkgname}"/build/
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
