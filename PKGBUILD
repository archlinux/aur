#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for Core Lightning.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

declare -r _pkgname="lightning"
declare -r _tag="2ad10864bd7e180ed3a3547e03e37390d52bd4ec"

pkgname="core-lightning"
pkgver="25.09.1"
pkgrel="1"
pkgdesc="Lightning Network implementation focusing on specification compliance and performance."
arch=("x86_64")
url="https://github.com/ElementsProject/${_pkgname}"
license=("custom:BSD-MIT")
depends=("bitcoin-cli" "gcc-libs" "glibc" "gmp" "gunicorn" "libsodium" "make" "postgresql-libs" "protobuf" "python" "python-cryptography" "python-flask" "python-flask-cors" "python-flask-restx" "python-flask-socketio" "python-gevent" "python-gevent-websocket" "python-grpcio" "python-grpcio-tools" "python-json5" "python-pyln-client" "sqlite" "zlib")
makedepends=("git" "lowdown" "net-tools" "python-mako" "rust")
optdepends=("cppcheck: Static C/C++ code analysis"
    "jq: Command-line JSON processor"
    "libsecp256k1: Optimised C library for EC operations on curve secp256k1"
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
sha512sums=("14b86f0cc0927c374c86101dadffa997d92f062aabb0cd2df23464ee25fad3c0579cf26c83ccb6b9c9a3e7285238fd45ab3cb9321e69faea6df1d37a79969b66"
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

    # TODO
    find "${srcdir}"/"${pkgname}"/ -name Makefile -exec sed -i "s/grpc_tools.protoc/grpc_tools.protoc --experimental_editions/" {} \;
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
