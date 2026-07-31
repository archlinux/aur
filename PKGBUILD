#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for CLI11.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

readonly _pkgname="CLI11"

pkgname="cli11-compiled"
pkgver="2.7.0"
pkgrel="1"
pkgdesc="Command line parser for C++."
arch=("x86_64")
url="https://github.com/CLIUtils/${_pkgname}"
license=("BSD-3-Clause")
makedepends=("cmake" "doxygen")
checkdepends=("catch2" "cmake")
provides=("cli11")
conflicts=("cli11")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
options=("!strip")
sha512sums=("e5e8045bf96cbfd515c367a2f4a8c16ac3abb57dbec8fff16491cc72b016923f8029296340eb44421dfbc05b61eed3c7e1f37f0bba751a2dd9d751f3770101de")

_compile()
{
    cmake -B "${srcdir}"/"${_pkgname}"-"${pkgver}"/build/ \
        -D BUILD_SHARED_LIBS=ON \
        -D CLI11_BOOST=OFF \
        -D CLI11_BUILD_DOCS=ON \
        -D CLI11_BUILD_EXAMPLES=OFF \
        -D CLI11_BUILD_EXAMPLES_JSON=OFF \
        -D CLI11_BUILD_TESTS="$1" \
        -D CLI11_CUDA_TESTS=OFF \
        -D CLI11_DISABLE_IMPL_HEADERS_INSTALL=ON \
        -D CLI11_FORCE_LIBCXX=OFF \
        -D CLI11_FULL_INSTALL=OFF \
        -D CLI11_INSTALL=ON \
        -D CLI11_INSTALL_PACKAGE_TESTS="$1" \
        -D CLI11_MODULE_TESTS=OFF \
        -D CLI11_MODULES=OFF \
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
