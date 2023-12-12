#!/hint/bash
# shellcheck disable=SC2034 disable=SC2154

# Maintainer: Michael Bolden Jnr / SM9(); <me@sm9.dev>

pkgname="glaze"
pkgver=1.9.5
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

sha512sums=('59c2b332c53c33c4410e3617c65ddf0aa592b985400a7ec7247af0fe561d33de3b94e8ea4ea143dcb7e55bd29f4b169ee79e99281bf493a8185172194195e574')

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
