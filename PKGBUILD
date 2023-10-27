#!/hint/bash
# shellcheck disable=SC2034 disable=SC2154

# Maintainer: Michael Bolden Jnr / SM9(); <me@sm9.dev>

pkgname="glaze"
pkgver=1.5.4
pkgrel=1
pkgdesc="An Extremely fast, In-Memory JSON and Interface Library for Modern C++"
arch=('any')
url="https://github.com/stephenberry/glaze"
license=('MIT')
makedepends=('cmake' 'ninja')
optdepends=('clang: for building with clang' 'gcc: for building with gcc')
provides=("${pkgname}")
conflicts=("${pkgname}")

source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)

sha512sums=('c4f89aa0fd28a821f977a7b363985ba6a88b54a22d76beea27d2750d3d912a46092ed436b010f679237a83f6375d2fba7c4e54cbf4650f2ba1e7bdf7b1804c59')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return 1
    rm -rf build && mkdir -p build || return 1
}

build() {
    cd "${pkgname}-${pkgver}/build" || return 1

    cmake \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DBUILD_TESTING=OFF \
        -DCMAKE_BUILD_TYPE=Release \
        -G "Ninja" .. || return 1

    ninja || return 1
}

package() {
    cd "${pkgname}-${pkgver}/build" || return 1

    DESTDIR="${pkgdir}" ninja install || return 1
}
