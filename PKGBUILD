# Maintainer: Angelo Haller <aur.archlinux@szanni.org>

pkgname=c-capnproto-git
pkgver=c.capnproto.0.3.r0.cb30563
pkgrel=1
pkgdesc="C library/compiler for the Cap'n Proto serialization/RPC protocol"
arch=('x86_64')
url="https://github.com/opensourcerouting/c-capnproto"
license=('MIT')
depends=('capnproto')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/opensourcerouting/c-capnproto.git'
        'git+https://github.com/google/googletest.git')
md5sums=('SKIP'
         'SKIP')


pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

	git submodule init
	git config submodule.gtest.url $srcdir/googletest
	git submodule update
}

build() {
	cd "$srcdir/${pkgname%-git}"

	autoreconf -f -i -s
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}"

	install -Dm 644 COPYING "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
	make DESTDIR="$pkgdir/" install
}
