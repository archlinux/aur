# Maintainer: X0rg
# Contributor: Nicolas Quiénot < niQo at aur >

_realname=libkqueue
pkgname=lib32-$_realname
pkgver=2.0.3
pkgrel=2
pkgdesc="Userspace implementation of the kqueue kernel event notification mechanism found in FreeBSD and other BSD-based (32-bit)"
url="https://github.com/mheily/libkqueue"
arch=('x86_64')
license=('BSD')
depends=('lib32-glibc' 'libkqueue')
makedepends=('gcc-multilib')
options=('!libtool')
source=("https://github.com/mheily/$_realname/releases/download/v$pkgver/$_realname-$pkgver.tar.gz")
md5sums=('42d405a26c36f734e2c7d3a936e30abe')

build() {
	cd "$srcdir/$_realname-$pkgver"
	export CC="gcc -m32"
	export CXX="g++ -m32"
	export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

	msg2 "Run 'configure'..."
	./configure --prefix=/usr --libdir=/usr/lib32 --disable-static

	msg2 "Run 'make'..."
	make

	msg2 "Extract license..."
	sed -n '/Copyright/,/ OF THIS SOFTWARE./p' "./src/common/kqueue.c" | cut -c 4- > "LICENSE"
}

package() {
	cd "$srcdir/$_realname-$pkgver"
	make DESTDIR="$pkgdir" install

	msg2 "Install license..."
	install -Dvm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# Clean up lib32 package
	rm -rf "$pkgdir/usr/include" "$pkgdir/usr/share/man"
}
