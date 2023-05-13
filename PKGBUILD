# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgorg='loco-3d'
_pkgname='crocoddyl'
pkgname=("$_pkgname" "$_pkgname-docs")
pkgver=2.0.0
pkgrel=1
pkgdesc="optimal control library for robot control under contact sequence"
arch=('i686' 'x86_64')
url="https://github.com/$pkgorg/$pkgname"
license=('BSD')
depends=('pinocchio' 'eigenpy' 'example-robot-data' 'python-scipy')
optdepends=('doxygen')
makedepends=('cmake' 'eigen')
source=($url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz{,.sig})
sha256sums=('296672bc92f37fa50f515263a93da663bd522e2de8426d2d7ae46c95151dc232'
            'SKIP')
validpgpkeys=(
    '9B1A79065D2F2B806C8A5A1C7D2ACDAF4653CF28'  # https://github.com/nim65s.gpg
    'F182CC432A4752C7A3E4FE02001EB2069D785C81'  # https://github.com/proyan.gpg
)

build() {
    cmake -B "build-$pkgver" -S "$pkgbase-$pkgver" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
    cmake --build "build-$pkgver"
}

check() {
    cmake --build "build-$pkgver" -t test
}

package_crocoddyl() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf $pkgdir/usr/share/doc
    sed -i '/Boost COMPONENTS/s/python3//' "$pkgdir/usr/lib/cmake/crocoddyl/crocoddylConfig.cmake"
    install -Dm644 "$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_crocoddyl-docs() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf $pkgdir/usr/{lib,include,"share/$_pkgname"}
    install -Dm644 "$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
