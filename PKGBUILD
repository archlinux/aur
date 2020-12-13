# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgorg='humanoid-path-planner'
pkgname=('hpp-fcl' 'hpp-fcl-docs')
pkgver=1.6.0
pkgrel=4
pkgdesc="An extension of the Flexible Collision Library"
arch=('i686' 'x86_64')
url="https://github.com/$pkgorg/$pkgname"
license=('BSD')
depends=('assimp' 'eigenpy' 'octomap')
optdepends=('doxygen')
makedepends=('cmake' 'eigen')
source=($url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz{,.sig} $url/pull/202.patch)
sha256sums=('SKIP' 'SKIP' '2fb3c86ffdec3337901e0a07a77f945e055ea9e290938bddfdae5c1a251893ff')
validpgpkeys=('9B1A79065D2F2B806C8A5A1C7D2ACDAF4653CF28' 'A031AD35058955293D54DECEC45D22EF408328AD')

prepare() {
    cd "$pkgbase-$pkgver"
    head -n33 "$srcdir/202.patch" | patch -p1
}

build() {
    cd "$pkgbase-$pkgver"

    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib .
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
    sed -i '/Boost COMPONENTS/s/python3//' "$pkgdir/usr/lib/cmake/hpp-fcl/hpp-fclConfig.cmake"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_hpp-fcl-docs() {
    cd "$pkgbase-$pkgver"
    make DESTDIR="$pkgdir/" install
    rm -rf $pkgdir/usr/{lib,include}
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
