#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for Mailio.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>
# Contributor: Adrien Wu <adrien.sf.wu@gmail.com>

declare -r _tag="af96e877473877d7f1979b753b0784958f4083c5"

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
# source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz") TODO
source=("${pkgname}::git+${url}.git#tag=${_tag}")
sha512sums=("bc640f868edde674e7859987976f1c590269001bb60167b589f37408ab4bb34907206e17892c7ff169dc12d3e9032ba999a9fc2015f4214a1ecb0234825c1cd3")

_compile()
{
    cmake -B "${srcdir}"/"${pkgname}"/build/ \
        -D BUILD_SHARED_LIBS=ON \
        -D MAILIO_BUILD_DOCUMENTATION=ON \
        -D MAILIO_BUILD_EXAMPLES=OFF \
        -D MAILIO_BUILD_TESTS="$1" \
        -D MAILIO_DYN_LINK_TESTS=ON \
        -D CMAKE_BUILD_TYPE=None \
        -D CMAKE_INSTALL_PREFIX=/usr/ \
        -S "${srcdir}"/"${pkgname}"/ \
        -Wno-dev
    cmake --build "${srcdir}"/"${pkgname}"/build/
}

build()
{
    _compile "OFF"
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

    cp -r "${srcdir}"/"${pkgname}"/build/docs/"${pkgname}"/* "${pkgdir}"/usr/share/doc/"${pkgname}"/

    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type d -exec chmod 755 {} +
    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type f -exec chmod 644 {} +

    # Install the license.
    install -Dm644 "${srcdir}"/"${pkgname}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
