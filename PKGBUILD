#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for Solidity.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>
# Contributor: Serge K <arch@phnx47.net>
# Contributor: Nicola Squartini <tensor5@gmail.com>

pkgname="solidity"
pkgver="0.8.30"
pkgrel="1"
pkgdesc="Smart contract programming language."
arch=("x86_64")
url="https://github.com/ethereum/${pkgname}"
license=("GPL-3.0-or-later")
depends=("gcc-libs" "glibc")
optdepends=("cvc5: SMT checker"
    "z3: SMT checker")
makedepends=("boost" "cmake" "fmt" "nlohmann-json" "range-v3")
checkdepends=("cmake" "evmone")
conflicts=("solidity-bin" "solidity-git")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}.tar.gz")
sha512sums=("b08733619a4c1398a2b80d0fec83d56b3769af8dfa01a028c71ff89985f5c93d12c3c7d8bbcec29bb0816a9cc1d56bb099010e59a203bcf917b87ff1b0cf0241")

_compile()
{
    cmake -B "${srcdir}"/"${pkgname}"_"${pkgver}"/build/ \
        -D CMAKE_BUILD_TYPE=None \
        -D CMAKE_INSTALL_PREFIX=/usr/ \
        -D IGNORE_VENDORED_DEPENDENCIES=ON \
        -D ONLY_BUILD_SOLIDITY_LIBRARIES=OFF \
        -D PEDANTIC=ON \
        -D PROFILE_OPTIMIZER_STEPS=OFF \
        -D SOLC_LINK_STATIC=OFF \
        -D SOLC_STATIC_STDLIBS=OFF \
        -D STRICT_Z3_VERSION=OFF \
        -D TESTS="$1" \
        -S "${srcdir}"/"${pkgname}"_"${pkgver}"/ \
        -Wno-dev
    cmake --build "${srcdir}"/"${pkgname}"_"${pkgver}"/build/
}

build()
{
    _compile "OFF"
}

check()
{
    _compile "ON"
    "${srcdir}"/"${pkgname}"_"${pkgver}"/build/test/soltest -p true -- --testpath "${srcdir}"/"${pkgname}"_"${pkgver}"/test/
    _compile "OFF"
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/

    # Install the software.
    DESTDIR="${pkgdir}"/ cmake --install "${srcdir}"/"${pkgname}"_"${pkgver}"/build/

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${pkgname}"_"${pkgver}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/
    cp -r "${srcdir}"/"${pkgname}"_"${pkgver}"/docs/* "${pkgdir}"/usr/share/doc/"${pkgname}"/

    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type d -exec chmod 755 {} +
    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type f -exec chmod 644 {} +
}
