# Maintainer: dequis <dx@dxzone.com.ar>
# Previous maintainer: Joel Teichroeb <joel@teichroeb.net>

pkgname=rr-git
pkgver=5.3.0.r123.gd3c235a1
pkgrel=2
pkgdesc='Record and Replay framework: lightweight recording and deterministic debugging'
arch=(i686 x86_64)
url='http://rr-project.org/'
license=('custom')
depends=('python-pexpect' 'gdb' 'capnproto')
makedepends=('git' 'cmake' 'gdb')
[ "$CARCH" = 'x86_64' ] && makedepends+=('gcc-multilib')
source=(git://github.com/mozilla/rr)
sha1sums=('SKIP')
provides=('rr')
conflicts=('rr')

pkgver() {
	cd rr
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	cd rr
	mkdir -p build
}

build() {
	cd rr/build
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -DBUILD_TESTS=OFF -DWILL_RUN_TESTS=OFF ..

	make
}

package() {
	cd rr/build
	make DESTDIR="${pkgdir}" install
	cd ..
	install -D LICENSE "${pkgdir}/usr/share/licenses/rr/LICENSE"
}
