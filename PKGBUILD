# Maintainer: dequis <dx@dxzone.com.ar>
# Previous maintainer: Joel Teichroeb <joel@teichroeb.net>

pkgname=rr
pkgver=5.2.0
pkgrel=2
pkgdesc='Record and Replay framework: lightweight recording and deterministic debugging'
arch=(i686 x86_64)
url='http://rr-project.org/'
license=('custom')
depends=('python2-pexpect' 'gdb' 'capnproto')
makedepends=('git' 'cmake' 'gdb')
[ "$CARCH" = 'x86_64' ] && makedepends+=('gcc-multilib')
source=(
	https://github.com/mozilla/${pkgname}/archive/${pkgver}.tar.gz
	https://github.com/mozilla/rr/commit/53c5bd72bae089616a3ca626b8af240481d70e6f.patch
)
sha1sums=('55040be15a87dd93012d7cdbeb8a3fc428ea4b6b'
          '9fcafcc3f4474b4352402b39002869a51e77f6df')

prepare() {
	cd $pkgname-$pkgver
	mkdir -p build
	patch -Np1 -i "$srcdir/53c5bd72bae089616a3ca626b8af240481d70e6f.patch"
}

build() {
	cd $pkgname-$pkgver/build
	cmake \
		-DCMAKE_BUILD_TYPE=RelWithDepInfo \
		-DCMAKE_INSTALL_PREFIX:PATH=/usr \
		-DBUILD_TESTS=OFF \
		-DWILL_RUN_TESTS=OFF \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DCMAKE_CXX_STANDARD=14 \
		..

	make
}

package() {
	cd $pkgname-$pkgver/build
	make DESTDIR="${pkgdir}" install
	cd ..
	install -D LICENSE "${pkgdir}/usr/share/licenses/rr/LICENSE"
}
