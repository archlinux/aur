#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for Mailio.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>
# Contributor: Adrien Wu <adrien.sf.wu@gmail.com>

pkgname="mailio"
pkgver="0.25.3"
pkgrel="1"
pkgdesc="A cross platform C++ library for MIME format and SMTP, POP3 and IMAP protocols."
arch=("x86_64")
url="https://github.com/karastojko/${pkgname}"
license=("BSD-2-Clause")
depends=("gcc-libs" "glibc" "openssl")
makedepends=("boost" "cmake" "doxygen")
checkdepends=("cmake")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=("550ab52400e3085d9dfeb1405ad34a5d26c65f9d0a9321933300da78e56e0469d2b79d1dd67559e3bdbf1f73899370d8feb7a9e9996bd309cbf4f8f9fd645605")

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
    _compile "OFF"
}

check()
{
    _compile "ON"
    ctest --output-on-failure --test-dir "${srcdir}"/"${pkgname}"-"${pkgver}"/build/
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
