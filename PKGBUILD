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
url="https://code.rosaelefanten.org/${pkgname}"
license=("MIT-0")
depends=("glibc")
makedepends=("cmake")
checkdepends=("cmake")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/tarball/release-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=("098d6217b2be81d326977a4c2cd18d38d354f81890b5702a9f547a0f409c1ef20e2e2b89d51c36786ae9d1432c563cd63ef877f44f25669c22abf8ed84dce842")

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
