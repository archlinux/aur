# Maintainer: dequis <dx@dxzone.com.ar>
# Previous maintainer: Joel Teichroeb <joel@teichroeb.net>

pkgname=rr-git
pkgver=4.0.1.r6.gc4e5fdb
pkgrel=1
pkgdesc='a nondeterministic debugger'
arch=(i686 x86_64)
url='http://rr-project.org/'
license=('custom')
depends=('libpfm4' 'libdisasm' 'python2-pexpect')
makedepends=('git' 'cmake')
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
	sed -i~ -e 's/ python / python2 /g' CMakeLists.txt
	sed -i~ -e 's/^\(#define \)_BSD_SOURCE$/\1_DEFAULT_SOURCE/' src/Command.cc
}

build() {
	cd rr/build
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..

	make
}

package() {
	cd rr/build
	make DESTDIR="${pkgdir}" install
	cd ..
	install -D LICENSE "${pkgdir}/usr/share/licenses/rr/LICENSE"
}
