#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for semver.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>
# Contributor: Ruijie Yu
readonly _pkgname="semver"

pkgname="semver-cpp"
pkgver="1.0.1"
pkgrel="1"
pkgdesc="Semantic versioning for modern C++."
arch=("x86_64")
url="https://github.com/Neargye/${_pkgname}"
license=("MIT")
makedepends=("cmake")
checkdepends=("cmake")
conflicts=("semver-cpp-git")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("ba3a53a5304f62fe40a96b10f4bd611a2a13caf8e634ae049b56363c6f93ec665a8b7e0c6b2e2ffdc9efe7900d3c181f1ef5502643314cfeb304fe84add9ce83")

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
