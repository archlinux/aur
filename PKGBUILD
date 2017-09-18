# Maintainer: Andrei Alexeyev <akari@alienslab.net>

pkgname=cctools-git
pkgdesc="Apple cctools port for Linux"
pkgver=147
pkgrel=1
arch=(i686 x86_64)
url="https://github.com/tpoechtrager/cctools-port"
license=(custom)
depends=(llvm xar libutil-linux)
makedepends=(gcc-objc git)
provides=(x86_64-apple-darwin-binutils cctools)
conflicts=(x86_64-apple-darwin-binutils cctools)
source=("git+https://github.com/tpoechtrager/cctools-port.git"
"cctools-ld64-1.patch" "cctools-ld64-2.patch")
md5sums=('SKIP'
         '2dc516ac75bce198fc7dcb2a0fd0d4ee'
         '52b7a03acaf34cbeed19b5b16e01deed')

pkgver() {
	cd cctools-port
	echo $(git rev-list --count HEAD)
}

prepare() {
	cd cctools-port/cctools
	patch -p0 -i ${srcdir}/cctools-ld64-1.patch
	patch -p0 -i ${srcdir}/cctools-ld64-2.patch
}

build() {
	cd cctools-port/cctools
	NOCONFIGURE=1 ./autogen.sh
	./configure \
		--prefix=/usr \
		--target=x86_64-apple-darwin \
		--with-llvm-config=/usr/bin/llvm-config \
		--libexecdir=/usr/lib
	make
}

package() {
	cd cctools-port/cctools
	make DESTDIR="$pkgdir" install
	install -Dm644 APPLE_LICENSE "$pkgdir/usr/share/licenses/cctools/APPLE_LICENSE"
}
