# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgname=eigenpy
pkgver=1.6.1
pkgrel=1
pkgdesc="Bindings between numpy and eigen using boost::python"
arch=('i686' 'x86_64')
url="https://github.com/stack-of-tasks/$pkgname"
license=('BSD')
depends=('boost-libs')
optdepends=('doxygen')
makedepends=('cmake' 'eigen' 'boost' 'python-numpy')
source=($url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz{,.sig} patch-aa)
sha256sums=('SKIP' 'SKIP' 'fa6fc68a0a1e6cf4b2f75991edeea3d05a1eb5ba904699a57e70a5fc25d5be0f')
validpgpkeys=('A031AD35058955293D54DECEC45D22EF408328AD')

build() {
    cd "$pkgname-$pkgver"

    patch -i "${srcdir}/patch-aa"

    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib \
        -DBUILD_UNIT_TESTS=ON .
    make
}

check() {
    cd "$pkgname-$pkgver"
    make test
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
    install -Dm644 COPYING.LESSER "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
