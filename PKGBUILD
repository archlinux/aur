# Maintainer: Guilhem Saurel <guilhem.saurel@laas.fr>

_org='stack-of-tasks'
_pkgname='pinocchio'
pkgname=("$_pkgname" "$_pkgname-docs")
pkgver=4.0.0
pkgrel=1
pkgdesc="Dynamic computations using Spatial Algebra"
arch=('i686' 'x86_64')
url="https://github.com/$_org/$_pkgname"
license=('BSD-2-Clause')
depends=('coal' 'eigenpy' 'urdfdom' 'python' 'boost-libs' 'gcc-libs' 'glibc' 'eigen' 'python-numpy' 'casadi')
optdepends=('lua52' 'cppad' 'cppadcodegen')
makedepends=('cmake' 'boost' 'doxygen' 'jrl-cmakemodules')
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver.tar.gz"{,.sig} "0001-casadi-Fix-build-with-eigen5.patch")
sha256sums=('0cfa23e2874eb9978dd7d952f3d8df855adb14e166b1a31860ac5c28c6348fb4'
            'SKIP'
            '8ec08ada155ef374b5c9ebaced166c46dc85ec0778261f2d26ccdbd5d849a8b7')
validpgpkeys=(
        'A031AD35058955293D54DECEC45D22EF408328AD'  # https://github.com/jcarpent.gpg
        'F534E75540B2E7D24F99746987CFFF3D0D73CC93'  # https://github.com/jcarpent.gpg
        '1462AF00C9CF3C9E7AFC905E63380359F089A579'  # https://github.com/jorisv.gpg
)

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 -i "$srcdir/0001-casadi-Fix-build-with-eigen5.patch"
}

build() {
    cmake -B "build-$pkgver" -S "$pkgbase-$pkgver" \
        -DBUILD_WITH_COLLISION_SUPPORT=ON \
        -DBUILD_WITH_CASADI_SUPPORT=ON \
        -DBUILD_UTILS=ON \
        -DBUILD_EXAMPLES=OFF \
        -DBUILD_TESTING=OFF \
        -DPYTHON_EXECUTABLE=/usr/bin/python \
        -DBUILD_WITH_AUTODIFF_SUPPORT=OFF \
        -DBUILD_WITH_CODEGEN_SUPPORT=OFF \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build "build-$pkgver" -j 1
}
# TODO:
# The following tests FAILED:
# 35 - pinocchio-test-cpp-spatial (Failed)
# 45 - pinocchio-test-cpp-constraint-variants (Timeout)
# 61 - pinocchio-test-cpp-delassus (Failed)
# check() {
#     export DEBUGINFOD_URLS=https://debuginfod.archlinux.org
#     cmake --build "build-$pkgver" -t test
# }
#
package_pinocchio() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf $pkgdir/usr/share/doc
    install -Dm644 "$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_pinocchio-docs() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf $pkgdir/usr/{lib,include,bin,share/{"$_pkgname",ament,ament_index}}
    install -Dm644 "$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
