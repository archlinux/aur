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

pkgname="soci-git"
pkgver="v4.0.1_559_g4440c789"
pkgrel="1"
pkgdesc="C++ database access library."
arch=("x86_64")
url="https://github.com/SOCI/${_pkgname}"
license=("BSL-1.0")
depends=("gcc-libs" "glibc" "mariadb-libs" "postgresql-libs" "sqlite3" "unixodbc")
makedepends=("cmake" "git")
provides=("${_pkgname}")
conflicts=("soci")
source=("${_pkgname}::git+https://github.com/Krzmbrzl/soci.git#branch=revamp-cmake")
sha512sums=("SKIP")

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
