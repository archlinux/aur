# Maintainer: Guilhem Saurel <guilhem.saurel@laas.fr>

_org='stack-of-tasks'
_pkgname='pinocchio'
pkgname=("$_pkgname" "$_pkgname-docs")
pkgver=3.0.0
pkgrel=2
pkgdesc="Dynamic computations using Spatial Algebra"
arch=('i686' 'x86_64')
url="https://github.com/$_org/$_pkgname"
license=('BSD-2-Clause')
depends=('hpp-fcl' 'eigenpy' 'urdfdom' 'python' 'boost-libs' 'gcc-libs' 'glibc' 'eigen' 'python-numpy')
optdepends=('lua52' 'cppad' 'cppadcodegen')
makedepends=('cmake' 'boost' 'doxygen')
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver.tar.gz"{,.sig}
        "pinocchio-valgrind.patch::$url/pull/2264.patch"
        "pinocchio3-hpp-compat.patch::$url/pull/2284.patch")
sha256sums=('0e49f3d92e303fe109bc8b329513708a03cdb734a90cb7734821ed2978de8d10'
            'SKIP'
            '38031f5ec850a44ec1a1a19fb82cffb880ea0527a56897ea3d66f0c4c8f3af4e'
            '3059bb74fcf58f9d815e3b80ab2e798269cec106198f06a7f720fe3074ef3aab')
validpgpkeys=(
        'A031AD35058955293D54DECEC45D22EF408328AD'  # https://github.com/jcarpent.gpg
        '1462AF00C9CF3C9E7AFC905E63380359F089A579'  # https://github.com/jorisv.gpg
)

prepare() {
    patch -d "$pkgbase-$pkgver" -p1 -i "$srcdir/pinocchio-valgrind.patch"
    # ignore changelog stuff: patching fails
    head -n 150 "$srcdir/pinocchio3-hpp-compat.patch" | patch -d "$pkgbase-$pkgver" -p1
}

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
    install -Dm644 "$pkgbase-$pkgver/COPYING.LESSER" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_pinocchio-docs() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf $pkgdir/usr/{lib,include,bin,share/{"$_pkgname",ament,ament_index}}
    install -Dm644 "$pkgbase-$pkgver/COPYING.LESSER" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
