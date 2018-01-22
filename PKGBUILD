# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Astor Castelo <amcastelo[at]gatech[dot]edu>
# Contributor: Fabio Volpe <volpefabio@gmail.com>

pkgname=chipmunk
pkgver=7.0.2
pkgrel=1
pkgdesc="A high-performance 2D rigid body physics library"
arch=('i686' 'x86_64')
url="http://chipmunk-physics.net/"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
source=(http://files.slembcke.net/chipmunk/release/Chipmunk-${pkgver%%.*}.x/Chipmunk-$pkgver.tgz)
sha256sums=('288c8465fcaa671bab890c0b24627816efa10da2c5eabbeb36feb0d6deb1ca5a')

build() {
  cd "$srcdir/Chipmunk-$pkgver"
  sed -i '/MAKE_PROPERTIES_REF(cpShape, IsSensor);/d' include/chipmunk/chipmunk_ffi.h
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_DEMOS=OFF \
        -DCMAKE_C_FLAGS="-DCHIPMUNK_FFI" \
        -DNDEBUG=ON \
        .
  make clean
  make
}

package() {
  cd "$srcdir/Chipmunk-$pkgver"
  install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  make DESTDIR="$pkgdir" install
}
