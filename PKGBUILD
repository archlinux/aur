#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for libvldmail.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

pkgname="libvldmail"
pkgver="1.2.2"
pkgrel="1"
pkgdesc="Your friendly e-mail address validation library."
arch=("x86_64")
url="https://github.com/Spixmaster/${pkgname}"
license=("BSD-3-Clause")
depends=("glibc")
makedepends=("cmake")
checkdepends=("cmake")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/release-${pkgver}.tar.gz")
sha512sums=("a772d32f65519ff40fd8ee72f9a4e72e2d5ffde895957f43218636a26645d1ebec1f732d4af772650495a6eb5b33a8029ed3074b0476fab5b4cfa84975211ff4")

_compile()
{
    cmake -B "${srcdir}"/"${pkgname}"-release-"${pkgver}"/build/ \
        -D BUILD_SHARED_LIBS=ON \
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_INSTALL_PREFIX=/usr/ \
        -D LIBVLDMAIL_TESTS="$1" \
        -S "${srcdir}"/"${pkgname}"-release-"${pkgver}"/ \
        -Wno-dev
    cmake --build "${srcdir}"/"${pkgname}"-release-"${pkgver}"/build/
}

build()
{
    _compile "OFF"
}

check()
{
    _compile "ON"
    ctest -C Debug --output-on-failure --test-dir "${srcdir}"/"${pkgname}"-release-"${pkgver}"/build/
    _compile "OFF"
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/man/man3/

    # Install the software.
    DESTDIR="${pkgdir}"/ cmake --install "${srcdir}"/"${pkgname}"-release-"${pkgver}"/build/

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${pkgname}"-release-"${pkgver}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/
    install -Dm644 "${srcdir}"/"${pkgname}"-release-"${pkgver}"/validate_email.3 "${pkgdir}"/usr/share/man/man3/

    # Install the license.
    install -Dm644 "${srcdir}"/"${pkgname}"-release-"${pkgver}"/COPYING "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
