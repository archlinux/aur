# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=gameoftrees
pkgver=0.118.1
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
b2sums=('b1230be99f68c38fb67e9c06c936724cafdf1b57168ec8cb335cd4099ed63b355bee31f5450e4e19356646cc94034245132c182ae42b5705bed4d843ae358f1b')

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
