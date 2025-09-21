#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for semver.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>
# Contributor: Ruijie Yu
readonly _pkgname="semver"

pkgname="semver-cpp"
pkgver="0.3.1"
pkgrel="1"
pkgdesc="Semantic versioning for modern C++."
arch=("x86_64")
url="https://github.com/Neargye/${_pkgname}"
license=("MIT")
makedepends=("cmake")
checkdepends=("cmake")
conflicts=("semver-cpp-git")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("4757043fe7395d8167fccaf1c1ef91cc321348e21cd5503a05af8cfa57b93d256071f80527545ebc48aad572a90ffb2ad80b613d913b4c3ec7efe0b197c6c669")

_compile()
{
    cmake -B "${srcdir}"/"${_pkgname}"-"${pkgver}"/build/ \
        -D CMAKE_BUILD_TYPE=None \
        -D CMAKE_INSTALL_PREFIX=/usr/ \
        -D SEMVER_OPT_BUILD_EXAMPLES=OFF \
        -D SEMVER_OPT_BUILD_TESTS="$1" \
        -D SEMVER_OPT_INSTALL="$2" \
        -S "${srcdir}"/"${_pkgname}"-"${pkgver}"/ \
        -Wno-dev
    cmake --build "${srcdir}"/"${_pkgname}"-"${pkgver}"/build/
}

build()
{
    _compile "OFF" "ON"
}

check()
{
    _compile "ON" "OFF"
    ctest --output-on-failure --test-dir "${srcdir}"/"${_pkgname}"-"${pkgver}"/build/
    _compile "OFF" "ON"
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
