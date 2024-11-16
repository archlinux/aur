# Maintainer: Sebastian Gsänger <sebastian_gsaenger@web.de>
pkgname=vipster-git
pkgver=r1524.9a9c737
pkgrel=1
pkgdesc="Molecule editor based on Qt, specialized on periodic structures, development version"
arch=('x86_64')
url="https://sgsaenger.github.io/vipster"
license=('GPL3')
groups=()
depends=('qt6-base' 'python')
makedepends=('cmake' 'git' 'catch2-v2' 'pybind11' 'fmt' 'cli11' 'nlohmann-json')
conflicts=('vipster')
source=("git+https://github.com/sgsaenger/vipster"
        "git+https://github.com/codeplea/tinyexpr")
md5sums=('SKIP' 'SKIP')

pkgver() {
    cd vipster
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd vipster

    mkdir -p build
    cd build

    cmake -D CMAKE_INSTALL_PREFIX=/usr \
          -D CMAKE_BUILD_TYPE=Release \
          -D VIPSTER_DESKTOP=ON \
          -D VIPSTER_PYWIDGET=ON \
          -D VIPSTER_PYLIB=ON \
          -D VIPSTER_DOWNLOAD_DEPENDENCIES=OFF \
          -D tinyexpr_SOURCE_DIR=${srcdir}/tinyexpr \
          ..
    make vipster pyvipster
}

check() {
    cd vipster/build

    make test_lib
    ctest
}

package() {
    cd vipster/build

    make DESTDIR=$pkgdir install
}
