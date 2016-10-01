# Maintainer: dequis <dx@dxzone.com.ar>
# Previous maintainer: Joel Teichroeb <joel@teichroeb.net>

pkgname=rr
pkgver=4.4.0
pkgrel=1
pkgdesc='Record and Replay framework: lightweight recording and deterministic debugging'
arch=(i686 x86_64)
url='http://rr-project.org/'
license=('custom')
depends=('python2-pexpect' 'gdb')
makedepends=('git' 'cmake' 'gdb')
[ "$CARCH" = 'x86_64' ] && makedepends+=('gcc-multilib')
source=(https://github.com/mozilla/${pkgname}/archive/${pkgver}.tar.gz
        https://github.com/mozilla/rr/commit/b17311c9f7720512f3a25e820c212d09d5799bcd.patch)
sha1sums=('3807fb7df4de049ca2dd65d1718fc8034c84bee8'
          'd453f07e8bee6be2e44b19b079ec030ba5fff968')

prepare() {
	cd $pkgname-$pkgver
	mkdir -p build

	# Make ptrace test work if compiled with PIC
	patch -p1 -i ../b17311c9f7720512f3a25e820c212d09d5799bcd.patch
}

build() {
	cd $pkgname-$pkgver/build
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr ..

	make
}

package() {
	cd $pkgname-$pkgver/build
	make DESTDIR="${pkgdir}" install
	cd ..
	install -D LICENSE "${pkgdir}/usr/share/licenses/rr/LICENSE"
}
