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
declare -r _tag="d7bec49aaa6e44c85e3e72dcf3c57458724cfc72"

pkgname="soci-git"
pkgver="4.1.0"
pkgrel="1"
pkgdesc="C++ database access library."
arch=("x86_64")
url="https://github.com/SOCI/${_pkgname}"
license=("BSL-1.0")
depends=("gcc-libs" "glibc" "mariadb-libs" "postgresql-libs" "sqlite3" "unixodbc")
makedepends=("cmake" "git")
provides=("${_pkgname}")
conflicts=("soci")
source=("${_pkgname}::git+${url}.git#tag=${_tag}")
sha512sums=("12cc069ed88ccd7a4fde0cbe87d895da1b3b79c826facbc0311c47244d8899104a7b4096bcdaed5d39b1c1e356a1aabbc043b0d7eb8d1a0d0133c82d41c6be39")

_compile()
{
    cmake -B "${srcdir}"/"${_pkgname}"/build/ \
        -D CMAKE_BUILD_TYPE=None \
        -D CMAKE_INSTALL_PREFIX=/usr/ \
        -D SOCI_ASAN=OFF \
        -D SOCI_SHARED=ON \
        -D SOCI_TESTS="$1" \
        -D SOCI_VISIBILITY=ON \
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
    _compile OFF
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
