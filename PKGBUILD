# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgorg='stack-of-tasks'
pkgname=('pinocchio' 'pinocchio-docs')
pkgver=2.4.3
pkgrel=1
pkgdesc="Dynamic computations using Spatial Algebra"
arch=('i686' 'x86_64')
url="https://github.com/$pkgorg/$pkgname"
license=('BSD')
depends=('hpp-fcl' 'eigenpy' 'urdfdom')
optdepends=('doxygen' 'lua52' 'cppad' 'cppadcodegen')
makedepends=('cmake' 'eigen')
source=($url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz{,.sig}
    "https://patch-diff.githubusercontent.com/raw/stack-of-tasks/pinocchio/pull/1184.patch")
sha256sums=('SKIP' 'SKIP'
    '01906320900fb52c386454e233aca524c65f21f51ecb46d5a43ac4d0a124de78')
validpgpkeys=('A031AD35058955293D54DECEC45D22EF408328AD')

prepare() {
    cd "$pkgbase-$pkgver"
    patch -p1 -i "$srcdir/1184.patch"
}

build() {
    mkdir -p "$pkgbase-$pkgver/build"
    cd "$pkgbase-$pkgver/build"

    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib \
        -DBUILD_WITH_COLLISION_SUPPORT=ON -DBUILD_UTILS=ON -DPYTHON_EXECUTABLE=/usr/bin/python \
        -DBUILD_WITH_AUTODIFF_SUPPORT="$(pacman -Qs cppad > /dev/null && echo -n ON || echo -n OFF)" \
        -DBUILD_WITH_CODEGEN_SUPPORT="$(pacman -Qs cppadcodegen > /dev/null && echo -n ON || echo -n OFF)" \
        ..
    make
}

check() {
    cd "$pkgbase-$pkgver/build"
    make test
}

package_pinocchio() {
    cd "$pkgbase-$pkgver/build"
    make DESTDIR="$pkgdir/" install
    rm -rf $pkgdir/usr/share/doc
    sed -i 's=;/usr/\.\./include/include==' "$pkgdir/usr/lib/cmake/pinocchio/pinocchioTargets.cmake"
    install -Dm644 ../COPYING.LESSER "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_pinocchio-docs() {
    cd "$pkgbase-$pkgver/build"
    make DESTDIR="$pkgdir/" install
    rm -rf $pkgdir/usr/{lib,include}
    install -Dm644 ../COPYING.LESSER "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
