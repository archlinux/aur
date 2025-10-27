#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for CLI11.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

readonly _pkgname="CLI11"

pkgname="cli11-compiled"
pkgver="2.6.1"
pkgrel="1"
pkgdesc="Command line parser for C++."
arch=("x86_64")
url="https://github.com/CLIUtils/${_pkgname}"
license=("BSD-3-Clause")
makedepends=("cmake" "doxygen")
checkdepends=("catch2" "cmake")
conflicts=("cli11")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
options=("!strip")
sha512sums=("28ff846ca0b736c784d1660b4d1470f34f55fed650c80fb6a2ec26519eaacbb80dd1aa951a4517097579f4aa0cf9527a13f3359744e589e31f852d1bea0ecfc8")

_compile()
{
    cmake -B "${srcdir}"/"${_pkgname}"-"${pkgver}"/build/ \
        -D CLI11_BUILD_DOCS=ON \
        -D CLI11_BUILD_EXAMPLES=OFF \
        -D CLI11_BUILD_EXAMPLES_JSON=OFF \
        -D CLI11_BUILD_TESTS="$1" \
        -D CLI11_CUDA_TESTS=OFF \
        -D CLI11_FORCE_LIBCXX=OFF \
        -D CLI11_INSTALL=ON \
        -D CLI11_PRECOMPILED=ON \
        -D CLI11_SANITIZERS=OFF \
        -D CLI11_SINGLE_FILE=OFF \
        -D CLI11_SINGLE_FILE_TESTS=OFF \
        -D CLI11_WARNINGS_AS_ERRORS=OFF \
        -D CMAKE_BUILD_TYPE=None \
        -D CMAKE_INSTALL_PREFIX=/usr/ \
        -S "${srcdir}"/"${_pkgname}"-"${pkgver}"/ \
        -Wno-dev
    cmake --build "${srcdir}"/"${_pkgname}"-"${pkgver}"/build/
}

build()
{
    _compile "OFF"
}

check()
{
    _compile "ON"
    ctest --output-on-failure --test-dir "${srcdir}"/"${_pkgname}"-"${pkgver}"/build/
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

    cd "${srcdir}"/"${_pkgname}"-"${pkgver}"/ || exit 1
    doxygen "${srcdir}"/"${_pkgname}"-"${pkgver}"/docs/Doxyfile
    cp -r "${srcdir}"/"${_pkgname}"-"${pkgver}"/html/* "${pkgdir}"/usr/share/doc/"${pkgname}"/

    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type d -exec chmod 755 {} +
    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type f -exec chmod 644 {} +

    # Install the license.
    install -Dm644 "${srcdir}"/"${_pkgname}"-"${pkgver}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
