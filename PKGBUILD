#!/hint/bash
# shellcheck disable=SC2034 disable=SC2154

# Maintainer: Michael Bolden Jnr / SM9(); <me@sm9.dev>

_pkgname="libgit2cpp"
pkgname="${_pkgname}-git"
pkgver=r192.4bf4ea5
pkgrel=1
pkgdesc="C++ wrapper for libgit2. It contains libgit2 as submodule (libs/libgit2)."
arch=('any')
url="https://github.com/AndreyG/libgit2cpp"
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
        -DBUNDLE_LIBGIT2=OFF \
        -DBUILD_LIBGIT2CPP_EXAMPLES=OFF \
        -DCMAKE_BUILD_TYPE=Release \
        -G "Ninja" .. || return 1

    ninja || return 1
}

package() {
    cd "${_pkgname}/build" || return 1

    DESTDIR="${pkgdir}" ninja install || return 1
}
