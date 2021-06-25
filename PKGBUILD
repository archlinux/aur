# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgorg='humanoid-path-planner'
_pkgname='hpp-fcl'
pkgname=("$_pkgname" "$_pkgname-docs")
pkgver=1.7.4
pkgrel=3
pkgdesc="An extension of the Flexible Collision Library"
arch=('i686' 'x86_64')
url="https://github.com/$pkgorg/$pkgname"
license=('BSD')
depends=('assimp' 'eigenpy' 'octomap' 'qhull')
optdepends=('doxygen')
makedepends=('cmake' 'eigen')
source=($url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz{,.sig}
    "$url/pull/232.patch" "$url/pull/233.patch")
sha256sums=('SKIP' 'SKIP' 'eca4ba8f4f7b5ac0aa3c435bc96c8c0fdf849b957e4e655ec7c3dd4bb48d56d9'
    '9befb15966d3d08eb32d507a6a6f8f34062c89c913b91e5ea0e9fa50d7944c8d')
validpgpkeys=('9B1A79065D2F2B806C8A5A1C7D2ACDAF4653CF28' 'A031AD35058955293D54DECEC45D22EF408328AD')

prepare() {
    cd "$pkgbase-$pkgver"
    patch -p1 -i "$srcdir/232.patch"
    patch -p1 -i "$srcdir/233.patch"
}

build() {
    cd "$pkgbase-$pkgver"

    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_CXX_STANDARD=14 \
        -DHPP_FCL_HAS_QHULL=ON \
        .
    make
}

check() {
    cd "$pkgbase-$pkgver"
    make test
}

package_hpp-fcl() {
    cd "$pkgbase-$pkgver"
    make DESTDIR="$pkgdir/" install
    rm -rf "$pkgdir/usr/share/doc"
    sed -i 's=;/usr/\.\./include/include==' "$pkgdir/usr/lib/cmake/hpp-fcl/hpp-fclTargets.cmake"
    sed -i '/Boost COMPONENTS/s/python3//' "$pkgdir/usr/lib/cmake/hpp-fcl/hpp-fclConfig.cmake"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_hpp-fcl-docs() {
    cd "$pkgbase-$pkgver"
    make DESTDIR="$pkgdir/" install
    rm -rf "$pkgdir"/usr/{lib,include,"share/$_pkgname"}
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
