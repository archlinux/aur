#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# Maintainer: Matheus Gabriel Werny de Lima <matheusgwdl@protonmail.com>

pkgname="inja"
pkgver="3.3.0"
pkgrel="1"
pkgdesc="A template engine for modern C++."
arch=("any")
url="https://github.com/pantor/${pkgname}"
license=("MIT")
depends=("nlohmann-json")
makedepends=("cmake" "doxygen")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("82e22b13f2055b28cd0166bbbb50fd42ea1c549bd1873f5e73bdb00e6d12b47d124a75d0649188dd6889ca3a9bda17eccc06888b22745f73193b879382907f0a")

build()
{
    mkdir -p "${srcdir}"/"${pkgname}"-"${pkgver}"/build/
    cd "${srcdir}"/"${pkgname}"-"${pkgver}"/build/ || exit 1
    cmake -D BUILD_BENCHMARK=OFF -D BUILD_TESTING=OFF -D INJA_BUILD_TESTS=OFF -D INJA_USE_EMBEDDED_JSON=OFF ..
    make
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"/

    # Install the software.
    cd "${srcdir}"/"${pkgname}"-"${pkgver}"/build/ || exit 1
    make DESTDIR="${pkgdir}"/ install

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${pkgname}"-"${pkgver}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/
    cd "${srcdir}"/"${pkgname}"-"${pkgver}"/doc/ || exit 1
    doxygen Doxyfile
    cp -r "${srcdir}"/"${pkgname}"-"${pkgver}"/doc/* "${pkgdir}"/usr/share/doc/"${pkgname}"/
    chmod -R 644 "${pkgdir}"/usr/share/doc/"${pkgname}"/

    # Install the license.
    install -Dm644 "${srcdir}"/"${pkgname}"-"${pkgver}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
