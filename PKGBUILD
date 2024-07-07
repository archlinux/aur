# Maintainer: Guilhem Saurel <guilhem.saurel@laas.fr>

_org='stack-of-tasks'
_pkgname='pinocchio'
pkgname=("$_pkgname" "$_pkgname-docs")
pkgver=3.1.0
pkgrel=1
pkgdesc="Dynamic computations using Spatial Algebra"
arch=('i686' 'x86_64')
url="https://github.com/$_org/$_pkgname"
license=('BSD-2-Clause')
depends=('hpp-fcl' 'eigenpy' 'urdfdom' 'python' 'boost-libs' 'gcc-libs' 'glibc' 'eigen' 'python-numpy')
optdepends=('lua52' 'cppad' 'cppadcodegen')
makedepends=('cmake' 'boost' 'doxygen')
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver.tar.gz"{,.sig})
sha256sums=('e624484077eee3183e20443ab0373205bb832a2597241531705116fa9f07016a'
            'SKIP')
validpgpkeys=(
        'A031AD35058955293D54DECEC45D22EF408328AD'  # https://github.com/jcarpent.gpg
        '1462AF00C9CF3C9E7AFC905E63380359F089A579'  # https://github.com/jorisv.gpg
)

build() {
    cmake -B "build-$pkgver" -S "$pkgbase-$pkgver" \
        -DBUILD_WITH_COLLISION_SUPPORT=ON \
        -DBUILD_UTILS=ON \
        -DPYTHON_EXECUTABLE=/usr/bin/python \
        -DBUILD_WITH_AUTODIFF_SUPPORT=OFF \
        -DBUILD_WITH_CODEGEN_SUPPORT=OFF \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DGENERATE_PYTHON_STUBS=ON \
        -Wno-dev
    cmake --build "build-$pkgver" -j 1
}

check() {
    export DEBUGINFOD_URLS=https://debuginfod.archlinux.org
    cmake --build "build-$pkgver" -t test
}

package_pinocchio() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf $pkgdir/usr/share/doc
    sed -i 's=;/usr/\.\./include/include==' "$pkgdir/usr/lib/cmake/pinocchio/pinocchioTargets.cmake"
    install -Dm644 "$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_pinocchio-docs() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf $pkgdir/usr/{lib,include,bin,share/{"$_pkgname",ament,ament_index}}
    install -Dm644 "$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
