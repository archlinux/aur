#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for libvldmail.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

pkgname="libvldmail"
pkgver="1.2.1"
pkgrel="1"
pkgdesc="Your friendly e-mail address validation library."
arch=("x86_64")
url="https://code.rosaelefanten.org/${pkgname}"
license=("BSD-3-Clause")
depends=("glibc")
makedepends=("cmake")
checkdepends=("cmake")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/tarball/release-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=("660237ea338af8308beaf5d01003e2f33e8bb58b4de07e4d95b2ca6b9c79b05aad3172e4d7e34b83c3257faccfdde854a19b7c69b0a28d5545e7af18f246d21c")

_compile()
{
    cmake -B "${srcdir}"/"${pkgname}"-"${pkgver}"/build/ \
        -D BUILD_SHARED_LIBS=ON \
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_INSTALL_PREFIX=/usr/ \
        -D LIBVLDMAIL_TESTS="$1" \
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
    ctest -C Debug --output-on-failure --test-dir "${srcdir}"/"${pkgname}"-"${pkgver}"/build/
    _compile "OFF"
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/man/man3/

    # Install the software.
    DESTDIR="${pkgdir}"/ cmake --install "${srcdir}"/"${pkgname}"-"${pkgver}"/build/

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${pkgname}"-"${pkgver}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/
    install -Dm644 "${srcdir}"/"${pkgname}"-"${pkgver}"/validate_email.3 "${pkgdir}"/usr/share/man/man3/

    # Install the license.
    install -Dm644 "${srcdir}"/"${pkgname}"-"${pkgver}"/COPYING "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
