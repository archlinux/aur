# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgorg='stack-of-tasks'
_pkgname='pinocchio'
pkgname=("$_pkgname" "$_pkgname-docs")
pkgver=2.6.17
pkgrel=1
pkgdesc="Dynamic computations using Spatial Algebra"
arch=('i686' 'x86_64')
url="https://github.com/$pkgorg/$pkgname"
license=('BSD')
depends=('hpp-fcl' 'eigenpy' 'urdfdom')
optdepends=('doxygen' 'lua52' 'cppad' 'cppadcodegen')
makedepends=('cmake' 'eigen')
source=($url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz{,.sig})
sha256sums=('42ae1e89e69519aebd3eb391fbc6d24103fc5094ba03914a8f47cfcbed556975'
            'SKIP')
validpgpkeys=('A031AD35058955293D54DECEC45D22EF408328AD')

build() {
    cmake -B "build-$pkgver" -S "$pkgbase-$pkgver" \
        -DBUILD_WITH_COLLISION_SUPPORT=ON \
        -DBUILD_UTILS=ON \
        -DPYTHON_EXECUTABLE=/usr/bin/python \
        -DBUILD_WITH_AUTODIFF_SUPPORT="$(pacman -Qs cppad > /dev/null && echo -n ON || echo -n OFF)" \
        -DBUILD_WITH_CODEGEN_SUPPORT="$(pacman -Qs cppadcodegen > /dev/null && echo -n ON || echo -n OFF)" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
    cmake --build "build-$pkgver"
}

check() {
    cmake --build "build-$pkgver" -t test
}

package_pinocchio() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf $pkgdir/usr/share/doc
    sed -i 's=;/usr/\.\./include/include==' "$pkgdir/usr/lib/cmake/pinocchio/pinocchioTargets.cmake"
    install -Dm644 "$pkgbase-$pkgver/COPYING.LESSER" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_pinocchio-docs() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf $pkgdir/usr/{lib,include,bin,share/{"$_pkgname",ament,ament_index}}
    install -Dm644 "$pkgbase-$pkgver/COPYING.LESSER" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
