# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=gameoftrees
pkgver=0.98.2
pkgrel=1
pkgdesc='A version control system which prioritizes ease of use and simplicity over flexibility'
arch=(x86_64)
url="https://gameoftrees.org"
license=(ISC)
conflicts=(gameoftrees-git got got-git got-bin)
depends=(ncurses util-linux-libs libbsd libevent zlib libretls)
makedepends=(pkgconf git)
source=("$pkgname::git+ssh://anonymous@got.gameoftrees.org/got-portable.git#tag=$pkgver")
b2sums=('964eeff66bf9d4a82fa01cedb66e0bfc1bc85a082eae2af6f4fc0a808df574534a9b3c9e0aa75a8f1e57f8d9a35e0c4d428bef9f98bd72a3b3fe73f6fe8aa524')

build () {
	cd "$pkgname"
	autoreconf -f -i -v
	./configure --prefix=/usr --sbindir=/usr/bin --libexecdir=/usr/lib/$pkgname \
		--enable-gotd --with-gotd-empty-path=/var/empty
	make
}

check () {
	#
	# We need a different build that can be installed to a local prefix
	# directory, because the test suite will pick binaries from $PATH.
	#
	# Also, /bin/sh is expected to be OpenBSD ksh, which is available
	# as the "oksh" package, but we need to either make it be /bin/sh or
	# change the shebangs in testing scripts.
	#
	msg2 'TODO: Investigate whether test can be made to run'
	return 0

	cd "$pkgname"
	make tests
}

package () {
	cd "$pkgname"
	make DESTDIR="$pkgdir" install
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" \
		README README.portable TODO
}
