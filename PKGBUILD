#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for SOCI.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: Mika Fischer <mika.fischer@zoopnet.de>

readonly _pkgname="soci"
declare -r _tag="470fec2e6729d0ab965286c22204e945affbc84a"

pkgname="soci-git"
pkgver="4.1.0"
pkgrel="1"
pkgdesc="C++ database access library."
arch=("x86_64")
url="https://github.com/SOCI/${_pkgname}"
license=("BSL-1.0")
depends=("gcc-libs" "glibc" "mariadb-libs" "postgresql-libs")
makedepends=("cmake" "git")
optdepends=("db2-odbc-cli: DB2
firebird: Firebird
mariadb: MariaDB
oracle-instantclient-basic: Oracle
postgresql: PostgreSQL
sqlite3: SQLite
unixodbc: ODBC")
provides=("${_pkgname}")
conflicts=("soci")
source=("${_pkgname}::git+${url}.git#tag=${_tag}")
sha512sums=("e2d1df9d46f6b7846b8da4aa59e2caca05cd533853d2d69f66ac2b4656ed4ad8c454eeba1a3b3b6fb4abb78b4da3c75de9ced3b2a842bd6109a9e6f4341b4e17")

_compile()
{
    cmake -B "${srcdir}"/"${_pkgname}"/build/ \
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
        -D SOCI_SQLITE3_SKIP_TESTS=ON \
        -D SOCI_TESTS="$1" \
        -D SOCI_UBSAN=OFF \
        -S "${srcdir}"/"${_pkgname}"/ \
        -Wno-dev
    cmake --build "${srcdir}"/"${_pkgname}"/build/
}

pkgver()
{
    cd "${srcdir}"/"${_pkgname}"/ || exit 1
    git describe --long --tags | sed "s/-/_/g" || true
}

build()
{
    for build_tests in "OFF" "ON"; do
        _compile "${build_tests}"
    done
}

check()
{
    _compile "ON"
    ctest --output-on-failure --test-dir "${srcdir}"/"${_pkgname}"/build/
    _compile "OFF"
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/

    # Install the software.
    DESTDIR="${pkgdir}"/ cmake --install "${srcdir}"/"${_pkgname}"/build/

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${_pkgname}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/
    cp -r "${srcdir}"/"${_pkgname}"/docs/* "${pkgdir}"/usr/share/doc/"${pkgname}"/

    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type d -exec chmod 755 {} +
    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type f -exec chmod 644 {} +
}
