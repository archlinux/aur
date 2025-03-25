#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for Inja.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

declare -r _tag="34514c2658f809404b9a165591f242ee10250519"

pkgname="inja"
pkgver="3.4.0"
pkgrel="1"
pkgdesc="A template engine for modern C++."
arch=("any")
url="https://github.com/pantor/${pkgname}"
license=("MIT")
depends=("nlohmann-json")
makedepends=("cmake" "doxygen" "git")
checkdepends=("doctest")
source=("${pkgname}::git+${url}.git#tag=${_tag}")
sha512sums=("cfb5fbc0922f985e13827412b4e90a826023ded1411b75b858d15b009484835c6a19ae1e2075ca072414430ee1c0a9213ff65f680d13d021072aa5c2facd55a7")

_compile()
{
    cmake -B "${srcdir}"/"${pkgname}"/build/ \
        -D BUILD_TESTING="$1" \
        -D CMAKE_BUILD_TYPE=None \
        -D CMAKE_INSTALL_PREFIX=/usr/ \
        -D COVERALLS=OFF \
        -D INJA_BUILD_TESTS="$1" \
        -D INJA_EXPORT=ON \
        -D INJA_INSTALL=ON \
        -D INJA_INSTALL_SINGLE_HEADER=ON \
        -D INJA_USE_EMBEDDED_JSON=OFF \
        -S "${srcdir}"/"${pkgname}"/ \
        -Wno-dev
    cmake --build "${srcdir}"/"${pkgname}"/build/
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
    ctest --output-on-failure --test-dir "${srcdir}"/"${pkgname}"/build/
    _compile "OFF"
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
