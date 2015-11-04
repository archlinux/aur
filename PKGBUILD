# Maintainer: dequis <dx@dxzone.com.ar>
# Previous maintainer: Joel Teichroeb <joel@teichroeb.net>

pkgname=rr
pkgver=4.0.0
pkgrel=2
pkgdesc='a nondeterministic debugger'
arch=(i686 x86_64)
url='http://rr-project.org/'
license=('custom')
depends=('libpfm4' 'libdisasm' 'python2-pexpect' 'gcc-multilib')
makedepends=('git' 'cmake')
source=(https://github.com/mozilla/${pkgname}/archive/${pkgver}.tar.gz)
sha1sums=('e0a172121f82224bd2b8c96327eaa72816a640b2')

prepare() {
	cd $pkgname-$pkgver
	mkdir -p build
	sed -i~ -e 's/ python / python2 /g' CMakeLists.txt
	sed -i~ -e 's/^\(#define \)_BSD_SOURCE$/\1_DEFAULT_SOURCE/' src/Command.cc

}

build() {
	cd $pkgname-$pkgver/build
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..

	make
}

package() {
	cd $pkgname-$pkgver/build
	make DESTDIR="${pkgdir}" install
	cd ..
	install -D LICENSE "${pkgdir}/usr/share/licenses/rr/LICENSE"
}
