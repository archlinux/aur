# Maintainer: Guilhem "Nim65s" Saurel <guilhem.saurel@laas.fr>

_org='Simple-Robotics'
_pkgname='proxsuite-nlp'
pkgname=("$_pkgname" "$_pkgname-docs")
pkgver=0.10.0
pkgrel=1
pkgdesc="A primal-dual augmented Lagrangian solver for nonlinear programming on manifolds."
arch=('i686' 'x86_64')
url="https://github.com/$_org/$pkgname"
license=('BSD-2-Clause')
depends=('proxsuite' 'boost-libs' 'eigenpy' 'pinocchio' 'casadi' 'example-robot-data')
optdepends=('doxygen')
makedepends=('cmake' 'eigen' 'boost' 'fmt')
source=($url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz{,.sig})
sha256sums=('e5b3b049b12b9093a9ab642e411796209190e54dcda4c8e9933ff4f6e426732a'
            'SKIP')
validpgpkeys=(
        'A031AD35058955293D54DECEC45D22EF408328AD'  # https://github.com/jcarpent.gpg
        '1462AF00C9CF3C9E7AFC905E63380359F089A579'  # https://github.com/jorisv.gpg
        'F6B9DDE42ED91D7939BC25B2A4D60E0153ADD041'  # https://github.com/manifoldfr.gpg
)

build() {
    cmake -B "build-$pkgver" -S "$pkgbase-$pkgver" \
        -DCMAKE_BUILD_TYPE=None \
        -DBUILD_WITH_PROXSUITE_SUPPORT=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DGENERATE_PYTHON_STUBS=ON \
        -Wno-dev
    cmake --build "build-$pkgver"
}

check() {
    cmake --build "build-$pkgver" -t test
}

package_proxsuite-nlp() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf $pkgdir/usr/share/doc
    install -Dm644 "$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_proxsuite-nlp-docs() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf $pkgdir/usr/{lib,include,bin,share/{"$_pkgname",ament,ament_index}}
    install -Dm644 "$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
