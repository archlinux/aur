# Maintainer: Guilhem Saurel <saurel@laas.fr>

_org='humanoid-path-planner'
_pkgname=hpp-environments
_pkgver=5.0.0
pkgname="$_pkgname-git"
pkgver=5.0.0.r175.
pkgrel=1
pkgdesc="Environments and robot descriptions for HPP"
arch=('i686' 'x86_64')
url="https://github.com/$_org/$_pkgname"
license=('BSD-2-Clause')
depends=('boost-libs' 'example-robot-data' 'gcc-libs' 'glibc')
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
    install -Dm644 "$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
