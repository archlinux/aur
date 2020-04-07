# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgname=gepetto-viewer
pkgver=4.8.0
pkgrel=2
pkgdesc="Graphical Interface for Pinocchio and HPP."
arch=('i686' 'x86_64')
url="https://github.com/gepetto/$pkgname"
license=('BSD')
depends=('openscenegraph' 'urdfdom' 'openthreads' 'osgqt' 'boost')
makedepends=('cmake' 'boost' 'urdfdom')
source=($url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz{,.sig} patch-1 patch-2)
sha256sums=('SKIP' 'SKIP'
    'de9a7f8979b5df2afabea4a352fba933318984e76829e46f5e7e71f61731f528'
    'd34a9634568fad01ecc396028a0e4949fc8d0a6f4a0c0dfc07c70940304931c8')
validpgpkeys=('9B1A79065D2F2B806C8A5A1C7D2ACDAF4653CF28')

prepare() {
    # ref https://github.com/Gepetto/gepetto-viewer/pull/115
    cd "$pkgname-$pkgver"
    patch -p0 -i $srcdir/patch-1
    patch -p0 -i $srcdir/patch-2
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
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
