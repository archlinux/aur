#!/bin/bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# Maintainer: Matheus Gabriel Werny de Lima <matheusgwdl@protonmail.com>

pkgname=inja
pkgver=3.3.0
pkgrel=1
pkgdesc="A template engine for modern C++."
arch=("any")
url="https://github.com/pantor/${pkgname}"
license=("MIT")
depends=("nlohmann-json")
makedepends=("cmake" "gcc" "make")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("e628d994762dcdaa9a97f63a9b8b73d9af51af0ffa5acea6bdbba0aceaf8ee25")

build()
{
    mkdir -p "${srcdir}"/"${pkgname}"-"${pkgver}"/build/
    cd "${srcdir}"/"${pkgname}"-"${pkgver}"/build/ || exit
    cmake -D BUILD_BENCHMARK=OFF -D BUILD_TESTING=OFF -D INJA_BUILD_TESTS=OFF -D INJA_USE_EMBEDDED_JSON=OFF ..
    make
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"/

    # Install the software.
    cd "${srcdir}"/"${pkgname}"-"${pkgver}"/build/ || exit
    make DESTDIR="${pkgdir}" install

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${pkgname}"-"${pkgver}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/

    # Install the license.
    install -Dm644 "${srcdir}"/"${pkgname}"-"${pkgver}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
