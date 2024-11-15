# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=gameoftrees
pkgver=0.105
pkgrel=1
pkgdesc='A version control system which prioritizes ease of use and simplicity over flexibility'
arch=(x86_64)
url="https://gameoftrees.org"
license=(ISC)
conflicts=(gameoftrees-git got got-git got-bin)
depends=(ncurses util-linux-libs libbsd libevent zlib libretls)
makedepends=(pkgconf git)
#checkdepends=(oksh perl)
source=("$url/releases/portable/got-portable-$pkgver.tar.gz")
b2sums=('9371c99741fa8cb6d58cf3671e7efb3ab0a8b328e13a1a969855ed3d1b9660c1efb11c163c4839ed407b4c5e9e1992c2443e47c8b1512fe8d1d4deec44571ea4')

prepare () {
	rm -rf build
	mkdir build

	#
	# Test suites expect /bin/sh to be OpenBSD ksh, which is available
	# as the "oksh" package. Change the shebang in testing scripts.
	#
	return
	cd "got-portable-$pkgver"
	sed -i -e '1s/\/sh$/\/oksh/' \
		regress/cmdline/*.sh \
		regress/gotd/*.sh \
		regress/tog/*.sh
}

build () {
	cd build
	"../got-portable-$pkgver/configure" \
		--prefix=/usr --sbindir=/usr/bin --libexecdir=/usr/lib/$pkgname \
		--with-gotd-empty-path=/var/empty
	make
}

# TODO: Investigate why many tests still fail
_check () {
	#
	# We need a different build that can be installed to a local prefix
	# directory, because the test suite will pick binaries from $PATH.
	#
	cd "got-portable-$pkgver"
	local prefix="$(pwd)/_prefix"
	./configure --prefix="$prefix"
	make install
	PATH="$prefix/bin:$PATH" make tests
}

package () {
	make -Cbuild DESTDIR="$pkgdir" install
	cd "got-portable-$pkgver"
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" \
		README README.portable TODO
}
