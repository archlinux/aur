#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for usearch.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

readonly _pkgname="FP16"
declare -r _tag="98b0a46bce017382a6351a19577ec43a715b6835"

pkgname="fp16"
pkgver="0.0.0"
pkgrel="1"
pkgdesc="Conversion to or from half-precision floating point formats."
arch=("x86_64")
url="https://github.com/Maratyszcza/${_pkgname}"
license=("MIT")
makedepends=("cmake" "git")
checkdepends=("gtest")
source=("${_pkgname}::git+${url}.git#tag=${_tag}")
sha512sums=("d64a79ab840374362aca644bce9acb7eb376c722d93a739d78f3b3b77baed37f65adc686a9998a2a11c406252a982fdcab4dd6fd753118f340542ff111732829")

_compile()
{
    # TODO
    # -D GOOGLETEST_SOURCE_DIR=/usr/src/googletest/ \
    # -D GOOGLETEST_VERSION="$(pacman -Q gtest | cut -d " " -f 2 | cut -d "-" -f 2 || true)" \
    cmake -B "${srcdir}"/"${_pkgname}"/build/ \
        -D CMAKE_BUILD_TYPE=None \
        -D CMAKE_INSTALL_PREFIX=/usr/ \
        -D FP16_BUILD_BENCHMARKS=OFF \
        -D FP16_BUILD_COMPARATIVE_BENCHMARKS=OFF \
        -D FP16_BUILD_TESTS="$1" \
        -D FP16_INSTALL_LIBRARY=ON \
        -S "${srcdir}"/"${_pkgname}"/ \
        -Wno-dev
    cmake --build "${srcdir}"/"${_pkgname}"/build/
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
    ctest --output-on-failure --test-dir "${srcdir}"/"${_pkgname}"/build/
    _compile "OFF"
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"/

    # Install the software.
    DESTDIR="${pkgdir}"/ cmake --install "${srcdir}"/"${_pkgname}"/build/

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${_pkgname}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/

    # Install the license.
    install -Dm644 "${srcdir}"/"${_pkgname}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
