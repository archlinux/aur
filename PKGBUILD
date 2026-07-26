#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for semver.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>
# Contributor: Ruijie Yu
readonly _pkgname="semver"

pkgname="semver-cpp"
pkgver="1.0.0"
pkgrel="1"
pkgdesc="Semantic versioning for modern C++."
arch=("x86_64")
url="https://github.com/Neargye/${_pkgname}"
license=("MIT")
makedepends=("cmake")
checkdepends=("cmake")
conflicts=("semver-cpp-git")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("dbef2a5d6d6e38b1136edb0576b6b1480c5d646caffcce07a92782bb2678ca1478be5c4a1451e0c1beb887d28cf19af2c0f5f006462e0a5c47b8a59499d59024")

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
