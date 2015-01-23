# Maintainer: X0rg
# Contributor: Yen Chi Hsuan <yan12125 at gmail.com>
# Contributor: Nicolas Quiénot < niQo at aur >
# Contributor: Jens Staal <staal1978@gmail.com>

_realname=libpthread_workqueue-git
pkgname=lib32-$_realname
pkgver=20140727
pkgrel=2
pkgdesc="a portable implementation of the pthread_workqueue API first introduced in Mac OS X (32-bit)"
url="https://github.com/mheily/libpwq"
arch=('x86_64')
license=('BSD')
depends=('lib32-glibc' 'libpthread_workqueue-git')
makedepends=('git' 'gcc-multilib')
provides=('libpthread_workqueue' 'libpthread_workqueue-libpthread')
source=("$pkgname"::'git://github.com/mheily/libpwq')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git log -1 --format='%cd' --date=short | tr -d -- '-'
}

build() {
	cd "$srcdir/$pkgname"
	export CC="gcc -m32"
	export CXX="g++ -m32"
	export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

	msg2 "Run 'autoreconf'..."
	autoreconf --install --symlink --verbose

	msg2 "Run 'configure'..."
	./configure --prefix=/usr --libdir=/usr/lib32

	msg2 "Run 'make'..."
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR=$pkgdir install

	msg2 "Install license..."
	install -Dvm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# Clean up lib32 package
	rm -rf "$pkgdir/usr/include" "$pkgdir/usr/share/man"
}
