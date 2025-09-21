#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for SOCI.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: Mika Fischer <mika.fischer@zoopnet.de>

pkgname="soci"
pkgver="4.1.2"
pkgrel="1"
pkgdesc="C++ database access library."
arch=("x86_64")
url="https://github.com/SOCI/${pkgname}"
license=("BSL-1.0")
depends=("boost" "gcc-libs" "glibc" "mariadb-libs" "postgresql-libs" "sqlite" "unixodbc")
makedepends=("cmake" "git")
checkdepends=("cmake")
optdepends=("libfbclient: Firebird"
    "mariadb: MariaDB"
    "postgresql: PostgreSQL")
conflicts=("soci-git")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("96571776d7fcb814c2625ade92f1d5bbcbee2a654eb38a098c23d12d01e66ab2900fc82fdb2f1a37679f0091009f9c6880c80d939730c1bd67f3285418144eba")

_compile()
{
    # Database-specific variables are only set if needed.
    cmake -B "${srcdir}"/"${pkgname}"-"${pkgver}"/build/ \
        -D CMAKE_BUILD_TYPE=None \
        -D CMAKE_INSTALL_PREFIX=/usr/ \
        -D SOCI_ASAN=OFF \
        -D SOCI_DB2_SKIP_TESTS=ON \
        -D SOCI_FIREBIRD_SKIP_TESTS=ON \
        -D SOCI_LTO=ON \
        -D SOCI_MYSQL_SKIP_TESTS=ON \
        -D SOCI_ODBC_SKIP_TESTS=ON \
        -D SOCI_ORACLE_SKIP_TESTS=ON \
        -D SOCI_POSTGRESQL_SKIP_TESTS=ON \
        -D SOCI_SHARED=ON \
        -D SOCI_SQLITE3_BUILTIN=OFF \
        -D SOCI_TESTS="$1" \
        -D SOCI_UBSAN=ON \
        -D WITH_BOOST=ON \
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
    ctest --output-on-failure --test-dir "${srcdir}"/"${pkgname}"-"${pkgver}"/build/
    _compile "OFF"
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/

    # Install the software.
    DESTDIR="${pkgdir}"/ cmake --install "${srcdir}"/"${pkgname}"-"${pkgver}"/build/

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${pkgname}"-"${pkgver}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/

    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type d -exec chmod 755 {} +
    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type f -exec chmod 644 {} +
}
