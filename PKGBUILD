#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for Inja.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

declare -r _tag="17eb440d6792960c1a56d2b8832b9edd23eadab3"

pkgname="inja"
pkgver="3.4.0"
pkgrel="1"
pkgdesc="A template engine for modern C++."
arch=("any")
url="https://github.com/Spixmaster/${pkgname}"
license=("MIT")
depends=("nlohmann-json")
makedepends=("cmake" "doxygen")
checkdepends=("doctest")
source=("${pkgname}::git+${url}.git#tag=${_tag}")
sha512sums=("SKIP")

build()
{
    for status in "OFF" "ON"; do
        cmake -B "${srcdir}"/"${pkgname}"/build/ -D BUILD_BENCHMARK=OFF -D BUILD_TESTING="${status}" -D CMAKE_BUILD_TYPE=None -D CMAKE_INSTALL_PREFIX=/usr/ -D COVERALLS=OFF -D INJA_BUILD_TESTS="${status}" -D INJA_EXPORT=ON -D INJA_INSTALL=ON -D INJA_INSTALL_SINGLE_HEADER=ON -D INJA_USE_EMBEDDED_JSON=OFF -S "${srcdir}"/"${pkgname}"/ -Wno-dev
        cmake --build "${srcdir}"/"${pkgname}"/build/
    done
}

check()
{
    cd "${srcdir}"/"${pkgname}"/build/ || exit 1
    ./inja_test
    ./single_inja_test
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

    cd "${srcdir}"/"${pkgname}"/doc/ || exit 1
    doxygen Doxyfile
    cp -r "${srcdir}"/"${pkgname}"/doc/* "${pkgdir}"/usr/share/doc/"${pkgname}"/

    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type d -exec chmod 755 {} +
    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type f -exec chmod 644 {} +

    # Install the license.
    install -Dm644 "${srcdir}"/"${pkgname}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
