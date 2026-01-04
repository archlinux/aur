#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for RediSearch.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

declare -r _pkgname="RediSearch"
declare -r _tag="7d7830113b001aa36bb9cc0fb8bd7b2c4fd464f3"

pkgname="redisearch"
pkgver="2.10.26"
pkgrel="1"
pkgdesc="A query and indexing engine for Redis, providing secondary indexing, full-text search, vector similarity search and aggregations."
arch=("any")
url="https://github.com/RediSearch/${_pkgname}"
license=("custom:RSALv2")
depends=("boost-libs" "redis")
makedepends=("boost" "conan" "git")
source=("${pkgname}::git+${url}.git#tag=${_tag}"
    "git+https://github.com/google/googletest.git"
    "git+https://github.com/redis/hiredis.git"
    "git+https://github.com/libuv/libuv.git"
    "git+https://github.com/RedisLabsModules/readies.git"
    "git+https://github.com/RedisLabsModules/RedisModulesSDK.git"
    "git+https://github.com/google/s2geometry.git"
    "git+https://github.com/RedisAI/VectorSimilarity.git")
sha512sums=("43c603c3a31e743bb4aac67089fb33ee714d6dd44f53700c1a8f023d9f6dcedf321a34da1b4528ff93fbcd0457fd379d596ec9f364ab04fe79a7474ab9c1429b"
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

    git config submodule.deps/googletest.url "${srcdir}"/googletest/
    git config submodule.deps/hiredis.url "${srcdir}"/hiredis/
    git config submodule.deps/libuv.url "${srcdir}"/libuv/
    git config submodule.deps/readies.url "${srcdir}"/readies/
    git config submodule.deps/RedisModulesSDK.url "${srcdir}"/RedisModulesSDK/
    git config submodule.deps/s2geometry.url "${srcdir}"/s2geometry/
    git config submodule.deps/VectorSimilarity.url "${srcdir}"/VectorSimilarity/

    git -c protocol.file.allow=always submodule update
}

build()
{
    cd "${srcdir}"/"${pkgname}"/ || exit 1
    make
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/lib/redis/
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"/

    # Install the software.
    install -Dm755 "${srcdir}"/"${pkgname}"/bin/linux-x64-release/search/redisearch.so "${pkgdir}"/usr/lib/redis/

    # Install the documentation.
    cp -r "${srcdir}"/"${pkgname}"/docs/* "${pkgdir}"/usr/share/doc/"${pkgname}"/
    install -Dm644 "${srcdir}"/"${pkgname}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/

    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type d -exec chmod 755 {} +
    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type f -exec chmod 644 {} +

    # Install the license.
    install -Dm644 "${srcdir}"/"${pkgname}"/LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
