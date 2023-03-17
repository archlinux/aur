#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for Core Lightning.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

declare -r _pkgname="lightning"
declare -r _tag="bfc6fedfbfc7f8006fc6d3c40d558f7d6abfa2bd"

pkgname="core-lightning"
pkgver="23.02.2"
pkgrel="2"
pkgdesc="Lightning Network implementation focusing on specification compliance and performance."
arch=("x86_64")
url="https://github.com/ElementsProject/${_pkgname}"
license=("custom:BSD-MIT")
depends=("bitcoin-cli" "postgresql-libs" "python" "sqlite")
makedepends=("git" "gmp" "libsodium" "mrkd" "net-tools" "python-mako" "rust" "zlib")
optdepends=("cppcheck: Static C/C++ code analysis"
    "jq: Command-line JSON processor"
    "libsecp256k1: Optimised C library for EC operations on curve secp256k1"
    "lowdown: Markdown translator"
    "shellcheck: Shell script analysis"
    "valgrind: Tool for memory management problems")
conflicts=("core-lightning-git")
source=("${pkgname}::git+${url}.git#tag=${_tag}"
    "git+https://github.com/ElementsProject/libwally-core.git"
    "git+https://github.com/ianlancetaylor/libbacktrace.git"
    "git+https://github.com/jedisct1/libsodium.git"
    "git+https://github.com/kristapsdz/lowdown.git"
    "git+https://github.com/rustyrussell/lnprototest.git"
    "git+https://github.com/valyala/gheap.git"
    "git+https://github.com/zserge/jsmn.git")
sha512sums=("SKIP"
    "SKIP"
    "SKIP"
    "SKIP"
    "SKIP"
    "SKIP"
    "SKIP"
    "SKIP")

prepare()
{
    cd "${srcdir}"/"${pkgname}"/ || exit 1
    git submodule init

    git config submodule.daemon/jsmn.url "${srcdir}"/jsmn/
    git config submodule.external/gheap.url "${srcdir}"/gheap/
    git config submodule.external/libbacktrace.url "${srcdir}"/libbacktrace/
    git config submodule.external/libwally-core.url "${srcdir}"/libwally-core/
    git config submodule.external/lnprototest.url "${srcdir}"/lnprototest/
    git config submodule.external/lowdown.url "${srcdir}"/lowdown/
    git config submodule.libsodium.url "${srcdir}"/libsodium/

    git -c protocol.file.allow=always submodule update
}

build()
{
    cd "${srcdir}"/"${pkgname}"/ || exit 1
    ./configure --prefix=/usr/
    make libexecdir=/usr/lib/
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"/

    # Install the software.
    cd "${srcdir}"/"${pkgname}"/ || exit 1
    make DESTDIR="${pkgdir}"/ libexecdir=/usr/lib/ install

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${pkgname}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/
    cp -r "${srcdir}"/"${pkgname}"/doc/* "${pkgdir}"/usr/share/doc/"${pkgname}"/

    cd "${pkgdir}"/usr/share/doc/"${pkgname}"/ || exit 1
    declare -r _list="$(ls -l)"
    declare _links
    _links="$(echo "${_list}" | grep "^l")"
    _links="$(echo "${_links}" | tr -s " ")"
    declare -r _to_remove="$(echo "${_links}" | cut -d " " -f 9)"
    # shellcheck disable=SC2086
    rm -r ${_to_remove}

    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type d -exec chmod 755 {} +
    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type f -exec chmod 644 {} +

    # Install the license.
    install -Dm644 "${srcdir}"/"${pkgname}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
