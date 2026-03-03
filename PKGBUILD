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
license=("MIT-0")
depends=("glibc")
makedepends=("cmake")
checkdepends=("cmake")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/tarball/release-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=("fe807921ed16baf15dfef97881d1d8659bb1c2c5c5886201d9ca5d671220f3e476d630fe9e0a458ffe468ee708f79258dd7f3904cef0dbb291f8f3384effd39b")

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
