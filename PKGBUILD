#!/hint/bash
# shellcheck disable=SC2034 disable=SC2154

# Maintainer: Michael Bolden Jnr / SM9(); <me@sm9.dev>

_pkgname="glaze"
pkgname="${_pkgname}-git"
pkgver=r1128.7dc222a
pkgrel=1
pkgdesc="An Extremely fast, In-Memory JSON and Interface Library for Modern C++"
arch=('any')
url="https://github.com/stephenberry/glaze"
license=('MIT')
makedepends=('git' 'cmake' 'ninja')
optdepends=('clang: for building with clang' 'gcc: for building with gcc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=(
    "${_pkgname}::git+${url}.git"
)

sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}" || return 1
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" || return 1
}

prepare() {
    cd "${srcdir}/${_pkgname}" || return 1
    rm -rf build && mkdir -p build || return 1
}

build() {
    cd "${_pkgname}/build" || return 1

    cmake \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DBUILD_TESTING=OFF \
        -DCMAKE_BUILD_TYPE=Release \
        -G "Ninja" .. || return 1

    ninja || return 1
}

package() {
    cd "${_pkgname}/build" || return 1

    DESTDIR="${pkgdir}" ninja install || return 1
}
