# Maintainer: Guilhem Saurel <saurel@laas.fr>

_org='humanoid-path-planner'
_pkgname='hpp-fcl'
pkgname=("$_pkgname" "$_pkgname-docs")
pkgver=2.4.2
pkgrel=1
pkgdesc="An extension of the Flexible Collision Library"
arch=('i686' 'x86_64')
url="https://github.com/$_org/$_pkgname"
license=('BSD-2-Clause')
depends=('assimp' 'eigen' 'eigenpy' 'octomap' 'qhull' 'python-numpy' 'boost-libs' 'python' 'glibc' 'gcc-libs')
optdepends=('doxygen')
makedepends=('cmake' 'boost')
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver.tar.gz"{,.sig})
sha256sums=('c6abadd59e5e93367a3defaf38c0ee70989990474ccce1a8220711800e3ab9db'
            'SKIP')
validpgpkeys=(
        '9B1A79065D2F2B806C8A5A1C7D2ACDAF4653CF28'  # https://github.com/nim65s.gpg
        'A031AD35058955293D54DECEC45D22EF408328AD'  # https://github.com/jcarpent.gpg
        'F534E75540B2E7D24F99746987CFFF3D0D73CC93'  # https://github.com/jcarpent.gpg
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

package_hpp-fcl-docs() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf "$pkgdir"/usr/{lib,include,share/{"$_pkgname",ament_index}}
    install -Dm644 "$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
