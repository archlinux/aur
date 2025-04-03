#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for Mailio.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>
# Contributor: Adrien Wu <adrien.sf.wu@gmail.com>

pkgname="mailio"
pkgver="0.24.1"
pkgrel="1"
pkgdesc="A cross platform C++ library for MIME format and SMTP, POP3 and IMAP protocols."
arch=("x86_64")
url="https://github.com/karastojko/${pkgname}"
license=("BSD-2-Clause")
depends=("gcc-libs" "glibc" "openssl")
makedepends=("boost" "cmake" "doxygen")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=("32c8f9e24fde2b45a456f1636cf68ef17f0f9298fb09fd037398fdcbe4675847d2edf3379ef62f6a6557b09b1259d4b93444c059da63e0ceef34fe91546e741e")

_compile()
{
    cmake -B "${srcdir}"/"${pkgname}"-"${pkgver}"/build/ \
        -D BUILD_SHARED_LIBS=ON \
        -D MAILIO_BUILD_DOCUMENTATION=ON \
        -D MAILIO_BUILD_EXAMPLES=OFF \
        -D MAILIO_BUILD_TESTS="$1" \
        -D MAILIO_DYN_LINK_TESTS=ON \
        -D CMAKE_BUILD_TYPE=None \
        -D CMAKE_INSTALL_PREFIX=/usr/ \
        -S "${srcdir}"/"${pkgname}"-"${pkgver}"/ \
        -Wno-dev
    cmake --build "${srcdir}"/"${pkgname}"-"${pkgver}"/build/
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
    # ctest --output-on-failure --test-dir "${srcdir}"/"${pkgname}"-"${pkgver}"/build/ TODO
    # "${srcdir}"/"${pkgname}"-"${pkgver}"/build/test/test_message TODO
    _compile "OFF"
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"/

    # Install the software.
    DESTDIR="${pkgdir}"/ cmake --install "${srcdir}"/"${pkgname}"-"${pkgver}"/build/

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${pkgname}"-"${pkgver}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/

    cp -r "${srcdir}"/"${pkgname}"-"${pkgver}"/build/docs/"${pkgname}"/* "${pkgdir}"/usr/share/doc/"${pkgname}"/

    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type d -exec chmod 755 {} +
    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type f -exec chmod 644 {} +

    # Install the license.
    install -Dm644 "${srcdir}"/"${pkgname}"-"${pkgver}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
