# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=gameoftrees
pkgver=0.94
pkgrel=1
pkgdesc='A version control system which prioritizes ease of use and simplicity over flexibility'
arch=(x86_64)
url="https://gameoftrees.org"
license=(custom:ISC)
conflicts=(gameoftrees-git got got-git got-bin)
depends=(ncurses util-linux-libs libbsd libevent)
makedepends=(pkgconf git)
source=("$pkgname::git+https://repo.or.cz/got-portable.git#tag=$pkgver")
b2sums=(SKIP)

build () {
	cd "$pkgname"
	autoreconf -f -i -v
	./configure --prefix=/usr --sbindir=/usr/bin --libexecdir=/usr/lib/$pkgname
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
	make -C "$pkgname" DESTDIR="$pkgdir" install
}
