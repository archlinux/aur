#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for Inja.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

declare -r _tag="17ba53cb9e0950625512fd939af91050bc6f3a3d"

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
sha512sums=("2c2e0425f0b63c4f777227fb87caf8f223b8653a87894e5b185f1b09f7799f9633dc59a08806c494ae8cb6e8ba28bb06e3f4900e843a9e1ebe809d77662d2063")

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
