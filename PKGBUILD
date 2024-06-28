# Maintainer: Guilhem Saurel <guilhem.saurel@laas.fr>

_org='humanoid-path-planner'
_pkgname=hpp-pinocchio
_pkgver=5.0.0
pkgname="$_pkgname-git"
pkgver=5.0.0.r685.0549d72
pkgrel=1
pkgdesc="Refactoring of hpp-model using the kinematic tree of pinocchio"
arch=('i686' 'x86_64')
url="https://github.com/$_org/$_pkgname"
license=('BSD-2-Clause')
depends=('assimp' 'boost-libs' 'gcc-libs' 'glibc' 'hpp-environments' 'hpp-util')
makedepends=('cmake' 'git' 'doxygen' 'boost')
conflicts=($_pkgname)
provides=($_pkgname)
source=("$_pkgname"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
    echo "$_pkgver.r$(git -C "$_pkgname" rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
    git -C "$_pkgname" checkout devel
    git -C "$_pkgname" submodule update --init --recursive
}

build() {
    cmake -B build -S $_pkgname \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_DOCUMENTATION=ON \
        -Wno-dev
    cmake --build build
}

check() {
    cmake --build build -t test
}

package() {
    DESTDIR="$pkgdir/" cmake --build build -t install
    install -Dm644 "$_pkgname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
