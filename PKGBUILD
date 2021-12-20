# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgorg='loco-3d'
_pkgname='crocoddyl'
pkgname=("$_pkgname" "$_pkgname-docs")
pkgver=1.8.1
pkgrel=3
pkgdesc="optimal control library for robot control under contact sequence"
arch=('i686' 'x86_64')
url="https://github.com/$pkgorg/$pkgname"
license=('BSD')
depends=('pinocchio' 'eigenpy' 'example-robot-data' 'python-scipy')
optdepends=('doxygen')
makedepends=('cmake' 'eigen')
source=($url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz{,.sig})
sha256sums=('SKIP' 'SKIP')
validpgpkeys=(
    '9B1A79065D2F2B806C8A5A1C7D2ACDAF4653CF28'  # https://github.com/nim65s.gpg
    'F182CC432A4752C7A3E4FE02001EB2069D785C81'  # https://github.com/proyan.gpg
)

build() {
    mkdir -p "$pkgbase-$pkgver/build"
    cd "$pkgbase-$pkgver/build"

    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib ..
    make
}

check() {
    cd "$pkgbase-$pkgver/build"
    make test
}

package_crocoddyl() {
    cd "$pkgbase-$pkgver/build"
    make DESTDIR="$pkgdir/" install
    rm -rf $pkgdir/usr/share/doc
    sed -i '/Boost COMPONENTS/s/python3//' "$pkgdir/usr/lib/cmake/crocoddyl/crocoddylConfig.cmake"
    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_crocoddyl-docs() {
    cd "$pkgbase-$pkgver/build"
    make DESTDIR="$pkgdir/" install
    rm -rf $pkgdir/usr/{lib,include,"share/$_pkgname"}
    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
