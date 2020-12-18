# Maintainer: Sebastian Gsänger <sebastian_gsaenger@web.de>
pkgname=vipster-git
pkgver=r1383.2272ab6
pkgrel=1
pkgdesc="Molecule editor based on Qt, specialized on periodic structures, development version"
arch=('x86_64')
url="https://sgsaenger.github.io/vipster"
license=('GPL3')
groups=()
depends=('qt5-base' 'python')
makedepends=('cmake' 'git' 'catch2' 'pybind11' 'fmt' 'cli11' 'nlohmann-json')
conflicts=('vipster')
source=("git+https://github.com/sgsaenger/vipster#branch=testing")
md5sums=('SKIP')

pkgver() {
    cd vipster
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd vipster
    git submodule update --init external/lammps

    mkdir -p build
    cd build

    cmake -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release -D VIPSTER_DESKTOP=ON -D VIPSTER_PYWIDGET=ON -D VIPSTER_PYLIB=ON -D VIPSTER_LAMMPS=ON ..
    make vipster pyvipster
}

check() {
    cd vipster/build

    make test_lib
    ./test_lib
}

package() {
    cd vipster/build

    make DESTDIR=$pkgdir install
}
