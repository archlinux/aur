# Maintainer: Guilhem "Nim65s" Saurel <guilhem.saurel@laas.fr>

pkgorg='stack-of-tasks'
_pkgname='pinocchio'
_pkgver=2.6.19
pkgname="$_pkgname-git"
pkgver=2.6.19.r6307.bd6b006
pkgrel=1
pkgdesc="Dynamic computations using Spatial Algebra"
arch=('i686' 'x86_64')
url="https://github.com/$pkgorg/$_pkgname"
license=('BSD')
depends=('hpp-fcl' 'eigenpy' 'urdfdom')
optdepends=('doxygen' 'lua52' 'cppad' 'cppadcodegen')
makedepends=('cmake' 'eigen' 'git')
conflicts=('pinocchio')
provides=('pinocchio')
source=("$_pkgname"::"git+https://github.com/$pkgorg/$_pkgname.git")
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
        -DBUILD_UTILS=ON \
        -DPYTHON_EXECUTABLE=/usr/bin/python \
        -DBUILD_WITH_AUTODIFF_SUPPORT="$(pacman -Qs cppad > /dev/null && echo -n ON || echo -n OFF)" \
        -DBUILD_WITH_CODEGEN_SUPPORT="$(pacman -Qs cppadcodegen > /dev/null && echo -n ON || echo -n OFF)" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DGENERATE_PYTHON_STUBS=ON
    # TODO: stubs require -j1, ref https://github.com/jrl-umi3218/jrl-cmakemodules/issues/600
    cmake --build build -j 1
}

check() {
    cmake --build build -t test
}

package() {
    DESTDIR="$pkgdir/" cmake --build build -t install
    sed -i 's=;/usr/\.\./include/include==' "$pkgdir/usr/lib/cmake/pinocchio/pinocchioTargets.cmake"
    install -Dm644 "$_pkgname/COPYING.LESSER" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
