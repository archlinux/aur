# Maintainer: Joel Teichroeb <joel@teichroeb.net>

pkgname=rr-git
pkgver=3.0.0.r2.g1827858
pkgrel=1
pkgdesc='a nondeterministic debugger'
arch=(i686 x86_64)
url='http://rr-project.org/'
license=('custom')
depends=('libpfm4' 'libdisasm')
makedepends=('git' 'cmake')
source=(git://github.com/mozilla/rr)
sha1sums=('SKIP')

pkgver() {
    cd rr
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	cd rr
	mkdir build
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
