# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgorg='humanoid-path-planner'
_pkgname='hpp-fcl'
#pkgname=("$_pkgname" "$_pkgname-docs")
pkgname=("$_pkgname")
pkgver=2.4.0
pkgrel=1
pkgdesc="An extension of the Flexible Collision Library"
arch=('i686' 'x86_64')
url="https://github.com/$pkgorg/$pkgname"
license=('BSD')
depends=('assimp' 'eigenpy' 'octomap' 'qhull' 'python-numpy')
optdepends=('doxygen')
makedepends=('cmake' 'eigen' 'boost')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"{,.sig})
sha256sums=('15b5f1d6fe98fd3bf175913821296c14b31ce1822ef303d9c6dff8ad2fefc733'
            'SKIP')
validpgpkeys=(
        '9B1A79065D2F2B806C8A5A1C7D2ACDAF4653CF28'  # https://github.com/nim65s.gpg
        'A031AD35058955293D54DECEC45D22EF408328AD'  # https://github.com/jcarpent.gpg
        '1462AF00C9CF3C9E7AFC905E63380359F089A579'  # https://github.com/jorisv.gpg
        )

build() {
    cmake -B "build-$pkgver" -S "$pkgbase-$pkgver" \
        -DHPP_FCL_HAS_QHULL=ON \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DGENERATE_PYTHON_STUBS=ON \
        -DINSTALL_DOCUMENTATION=OFF \
        -DBUILD_DOCUMENTATION=OFF \
        -Wno-dev
        cmake --build "build-$pkgver"
}

check() {
    cmake --build "build-$pkgver" -t test
}

package_hpp-fcl() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
        rm -rf "$pkgdir/usr/share/doc"
        sed -i 's=;/usr/\.\./include/include==' "$pkgdir/usr/lib/cmake/hpp-fcl/hpp-fclTargets.cmake"
        sed -i '/Boost COMPONENTS/s/python3//' "$pkgdir/usr/lib/cmake/hpp-fcl/hpp-fclConfig.cmake"
        install -Dm644 "$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

#package_hpp-fcl-docs() {
#DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
#rm -rf "$pkgdir"/usr/{lib,include,share/{"$_pkgname",ament_index}}
#install -Dm644 "$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
#}
