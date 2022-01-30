#!/bin/bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# Maintainer: Matheus Gabriel Werny de Lima <matheusgwdl@protonmail.com>

pkgname=c-lightning
pkgver=0.10.2
pkgrel=1
pkgdesc="A Lightning Network implementation in C."
arch=("any")
url="https://github.com/ElementsProject/lightning"
license=("custom:BSD-MIT")
makedepends=("git" "gmp" "libsodium" "net-tools" "sqlite" "zlib")
optdepends=("cppcheck: Static C/C++ code analysis"
"jq: Command-line JSON processor"
"libsecp256k1: Optimised C library for EC operations on curve secp256k1"
"postgresql-libs: Libraries for use with PostgreSQL"
"shellcheck: Shell script analysis"
"valgrind: Tool for memory management")
provides=("lightning-cli" "lightning-hsmtool" "lightningd")
conflicts=("c-lightning-git")
source=("git+${url}.git")
sha256sums=("SKIP")

build()
{
    cd "${srcdir}"/"${pkgname}"/ || exit
    ./configure
    make
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"/

    # Install the software.
    cd "${srcdir}"/"${pkgname}"/ || exit
    make DESTDIR="${pkgdir}" install

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${pkgname}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/

    # Install the license.
    install -Dm644 "${srcdir}"/"${pkgname}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
