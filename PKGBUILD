# Maintainer: Guilhem Saurel <guilhem.saurel@laas.fr>

_org='stack-of-tasks'
_pkgname='pinocchio'
_pkgver=3.3.0
pkgname="$_pkgname-git"
pkgver=3.3.0.r9236.2921dc6
pkgrel=1
pkgdesc="Dynamic computations using Spatial Algebra"
arch=('i686' 'x86_64')
url="https://github.com/$_org/$_pkgname"
license=('BSD-2-Clause')
depends=('coal' 'eigenpy' 'urdfdom' 'python' 'boost-libs' 'gcc-libs' 'glibc' 'eigen' 'python-numpy' 'casadi')
optdepends=('lua52' 'cppad' 'cppadcodegen')
makedepends=('cmake' 'boost' 'doxygen' 'git')
conflicts=('pinocchio')
provides=('pinocchio')
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
        -DBUILD_WITH_COLLISION_SUPPORT=ON \
        -DBUILD_WITH_CASADI_SUPPORT=ON \
        -DBUILD_UTILS=ON \
        -DPYTHON_EXECUTABLE=/usr/bin/python \
        -DBUILD_WITH_AUTODIFF_SUPPORT=OFF \
        -DBUILD_WITH_CODEGEN_SUPPORT=OFF \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DGENERATE_PYTHON_STUBS=ON \
        -Wno-dev
    cmake --build build -j 1
}

check() {
    export DEBUGINFOD_URLS=https://debuginfod.archlinux.org
    cmake --build build -t test
}

package_pinocchio-git() {
    DESTDIR="$pkgdir/" cmake --build build -t install
    rm -rf $pkgdir/usr/share/doc
    install -Dm644 "$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_pinocchio-git-docs() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf $pkgdir/usr/{lib,include,bin,share/{"$_pkgname",ament,ament_index}}
    install -Dm644 "$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
