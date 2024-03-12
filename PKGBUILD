#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for CLI11.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

readonly _pkgname="CLI11"

pkgname="cli11-compiled"
pkgver="2.4.1"
pkgrel="1"
pkgdesc="Command line parser for C++."
arch=("x86_64")
url="https://github.com/CLIUtils/${_pkgname}"
license=("BSD")
makedepends=("cmake" "doxygen")
checkdepends=("catch2")
conflicts=("cli11")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("965290d09977672d3bc3c57ca4b89a88c2c09461da6e866b18217d702d4d5a0977588fcb8fef1a3c3804e61ad80d276029f47469cc83dbfdc7021ee35f6b7269")

build()
{
    for status in "ON" "OFF"; do
        cmake -B "${srcdir}"/"${_pkgname}"-"${pkgver}"/build/ \
            -D CLI11_BUILD_DOCS=ON \
            -D CLI11_BUILD_EXAMPLES=OFF \
            -D CLI11_BUILD_EXAMPLES_JSON=OFF \
            -D CLI11_BUILD_TESTS="${status}" \
            -D CLI11_CUDA_TESTS=OFF \
            -D CLI11_INSTALL=ON \
            -D CLI11_FORCE_LIBCXX=OFF \
            -D CLI11_PRECOMPILED=ON \
            -D CLI11_SINGLE_FILE=OFF \
            -D CLI11_SINGLE_FILE_TESTS=OFF \
            -D CMAKE_BUILD_TYPE=None \
            -D CMAKE_INSTALL_PREFIX=/usr/ \
            -S "${srcdir}"/"${_pkgname}"-"${pkgver}"/ \
            -Wno-dev
        cmake --build "${srcdir}"/"${_pkgname}"-"${pkgver}"/build/
    done
}

check()
{
    ctest --output-on-failure --test-dir "${srcdir}"/"${_pkgname}"-"${pkgver}"/build/
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

    cd "${srcdir}"/"${_pkgname}"-"${pkgver}"/docs/ || exit 1
    doxygen Doxyfile
    cp -r "${srcdir}"/"${_pkgname}"-"${pkgver}"/docs/* "${pkgdir}"/usr/share/doc/"${pkgname}"/

    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type d -exec chmod 755 {} +
    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type f -exec chmod 644 {} +

    # Install the license.
    install -Dm644 "${srcdir}"/"${_pkgname}"-"${pkgver}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
