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
declare -r _tag="e337a092d49641f2ba29ccaa7eb79023d0819641"

pkgname="soci-git"
pkgver="v4.0.1_866_ge337a092"
pkgrel="1"
pkgdesc="C++ database access library."
arch=("x86_64")
url="https://github.com/SOCI/${_pkgname}"
license=("BSL-1.0")
depends=("boost" "gcc-libs" "glibc" "mariadb-libs" "postgresql-libs" "sqlite" "unixodbc")
makedepends=("cmake" "git")
optdepends=("libfbclient: Firebird"
    "mariadb: MariaDB"
    "postgresql: PostgreSQL")
provides=("${_pkgname}")
conflicts=("soci")
source=("${_pkgname}::git+${url}.git#tag=${_tag}")
sha512sums=("e775d4e9d5a3f950fbe544de34a914d69c362e060b4a550820a494a5a04e33c7767eb38c5d042fba7eaff9fe92539da91d6b57cdfe3e62eb13771fdd4aea9e26")

_compile()
{
    # Database-specific variables are only set if needed.
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
        -D SOCI_TESTS="$1" \
        -D SOCI_UBSAN=ON \
        -D WITH_BOOST=ON \
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
