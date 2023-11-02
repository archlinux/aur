#!/hint/bash
# shellcheck disable=SC2034 disable=SC2154

# Maintainer: Michael Bolden Jnr / SM9(); <me@sm9.dev>

pkgname="glaze"
pkgver=1.5.6
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

sha512sums=('88bf8f152d0dbce38e97160a9fa0a5b1f708213d8b80e2c771ce981e6abfeecf4daa09d79b582b3b7c3ba6f932ff5fada9965a4db5d30db956f7d6152686f002')

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
