#!/hint/bash
# shellcheck disable=SC2034 disable=SC2154

# Maintainer: Michael Bolden Jnr / SM9(); <me@sm9.dev>

pkgname="glaze"
pkgver=1.5.2
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

sha512sums=('f267d40ac658b03fd67a83f7bcc8a89d1d602ca36381cee12e1b6267107749ed2bd9b8f7f30ec4e875a129a5304d53752e95079a5ae608c25d6d5fca53eb56d1')

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
