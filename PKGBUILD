# Maintainer: Guilhem Saurel <guilhem.saurel@laas.fr>

_org='Simple-Robotics'
_pkgname='proxsuite'
_pkgver=0.6.4
pkgname="$_pkgname-git"
pkgver=0.6.4.r1800.f9c2b5c
pkgrel=1

pkgdesc="The Advanced Proximal Optimization Toolbox"
arch=('any')
url="https://github.com/$_org/$_pkgname"
license=('BSD-2-Clause')
depends=('eigen' 'simde')
optdepends=()
makedepends=('cmake' 'git')
conflicts=('proxsuite')
provides=('proxsuite')
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
        -DGENERATE_PYTHON_STUBS=ON \
        -Wno-dev
    cmake --build build
}

check() {
    cmake --build build -t test
}

package() {
    DESTDIR="$pkgdir/" cmake --build build -t install
    install -Dm644 "$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
