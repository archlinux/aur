# Maintainer: Guilhem Saurel <saurel@laas.fr>

_org='loco-3d'
_pkgname='crocoddyl'
pkgname=("$_pkgname" "$_pkgname-docs")
pkgver=3.1.0
pkgrel=1
pkgdesc="optimal control library for robot control under contact sequence"
arch=('i686' 'x86_64')
url="https://github.com/$_org/$_pkgname"
license=('BSD-2-Clause')
depends=('pinocchio' 'eigenpy' 'example-robot-data' 'python-scipy' 'coin-or-ipopt')
optdepends=('doxygen')
makedepends=('cmake' 'eigen3' 'jrl-cmakemodules')
checkdepends=('jupyter-nbformat' 'jupyter-nbconvert')
source=($url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz{,.sig})
sha256sums=('3c069ce56ad0f9b71343ffe1a1ba24404122f90ad6f37be6d92370e4f36028ab'
            'SKIP')
validpgpkeys=(
    '9B1A79065D2F2B806C8A5A1C7D2ACDAF4653CF28'  # https://github.com/nim65s.gpg
    'F182CC432A4752C7A3E4FE02001EB2069D785C81'  # https://github.com/proyan.gpg
)

build() {
    cmake -B "build-$pkgver" -S "$pkgbase-$pkgver" \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build "build-$pkgver" -j 2
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
    rm -rf $pkgdir/usr/{lib,include,share/ament_index,"share/$_pkgname"}
    install -Dm644 "$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
