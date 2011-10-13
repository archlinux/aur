# Maintainer: Astor Castelo <amcastelo[at]gatech[dot]edu>
# Contributor: Fabio Volpe <volpefabio@gmail.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=chipmunk
pkgver=6.0.2
pkgrel=1
pkgdesc="A high-performance 2D rigid body physics library"
arch=('i686' 'x86_64')
url="http://code.google.com/p/chipmunk-physics/"
license=('MIT')
depends=('mesa' 'freeglut' 'libxmu' 'libxext')
makedepends=('cmake')
source=(http://files.slembcke.net/chipmunk/release/Chipmunk-${pkgver%%.*}.x/Chipmunk-$pkgver.tgz chipmunk-6.0.2-ffi_duplicate_definition.patch)

build() {
	cd "$srcdir/Chipmunk-$pkgver"
	patch -p0 -i "$srcdir/chipmunk-6.0.2-ffi_duplicate_definition.patch"
	# Fix wrong lib version number
	sed -i 's|6.0.1|6.0.2|' src/CMakeLists.txt
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DBUILD_DEMOS=OFF -DCMAKE_C_FLAGS="-DCHIPMUNK_FFI" .
	make clean
	make
}

package() {
	cd "$srcdir/Chipmunk-$pkgver"
	install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	make DESTDIR="$pkgdir" install
}

md5sums=('c1b7917e7ce2160fa2d5305a451b152c'
         '5260d3d4e86cde4859a8fc3baccfde09')
