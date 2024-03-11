#!/hint/bash
# shellcheck disable=SC2034 disable=SC2154

# Maintainer: Michael Bolden Jnr / SM9(); <me@sm9.dev>

pkgname="glaze"
pkgver=2.2.2
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

sha512sums=('c67961104d8b7fd1807df138349af86459bd21a9c3889e7ca044380368c2eccc51cf3da6726130b973001754eff510129f62adae9cafcc977d9c6bdaa1e2f2f2')

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
