# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgorg='humanoid-path-planner'
pkgname=('hpp-fcl' 'hpp-fcl-docs')
pkgver=1.3.0
pkgrel=2
pkgdesc="An extension of the Flexible Collision Library"
arch=('i686' 'x86_64')
url="https://github.com/$pkgorg/$pkgname"
license=('BSD')
depends=('assimp' 'eigenpy')
optdepends=('doxygen' 'octomap')
makedepends=('cmake' 'eigen')
source=($url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz{,.sig})
sha256sums=('SKIP' 'SKIP')
validpgpkeys=('9B1A79065D2F2B806C8A5A1C7D2ACDAF4653CF28' 'A031AD35058955293D54DECEC45D22EF408328AD')

build() {
    cd "$pkgbase-$pkgver"

    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib \
      -DBUILD_PYTHON_INTERFACE=ON .
    make
}

check() {
    cd "$pkgbase-$pkgver"
    make test
}

package_hpp-fcl() {
    cd "$pkgbase-$pkgver"
    make DESTDIR="$pkgdir/" install
    rm -rf $pkgdir/usr/share/doc
    sed -i 's=;/usr/\.\./include/include==' "$pkgdir/usr/lib/cmake/hpp-fcl/hpp-fclTargets.cmake"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_hpp-fcl-docs() {
    cd "$pkgbase-$pkgver"
    make DESTDIR="$pkgdir/" install
    rm -rf $pkgdir/usr/{lib,include}
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
