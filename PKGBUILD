# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgname=eigenpy
pkgver=2.6.1
pkgrel=2
pkgdesc="Bindings between numpy and eigen using boost::python"
arch=('i686' 'x86_64')
url="https://github.com/stack-of-tasks/$pkgname"
license=('BSD')
depends=('boost-libs')
optdepends=('doxygen')
makedepends=('cmake' 'eigen' 'boost' 'python-numpy')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"{,.sig} "$url/pull/223.patch")
sha256sums=('SKIP' 'SKIP' 'd4cb091e2b71dfd1afe3d204e1ddbf3d642ff9802e5a6e93b0a1965a57791de1')
validpgpkeys=('A031AD35058955293D54DECEC45D22EF408328AD')

prepare() {
    cd "$pkgbase-$pkgver"
    patch -p1 -i "$srcdir/223.patch"
}

build() {
    cd "$pkgname-$pkgver"

    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib .
    make
}

check() {
    cd "$pkgname-$pkgver"
    make test
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
    sed -i '/Boost COMPONENTS python3/d' "$pkgdir/usr/lib/cmake/eigenpy/eigenpyConfig.cmake"
    install -Dm644 COPYING.LESSER "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
