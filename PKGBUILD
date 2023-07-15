# Maintainer: éclairevoyant
# Contributor: Dan Beste <dan dot ray dot beste at gmail dot com>

_pkgname='xcb-util-cursor'
pkgname="$_pkgname-git"
pkgver=0.1.4.r3.103bcca
pkgrel=1
pkgdesc='XCB cursor library'
arch=(x86_64)
url='https://xcb.freedesktop.org/'
license=(MIT)
depends=(libxcb xcb-util-image xcb-util-renderutil)
makedepends=(git gperf xorg-util-macros)
provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://anongit.freedesktop.org/git/xcb/util-cursor.git"
        'git+https://anongit.freedesktop.org/git/xcb/util-common-m4.git')
b2sums=('SKIP'
        'SKIP')

pkgver() {
	git -C $_pkgname describe --long --tags | sed 's/^xcb-util-cursor-//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	cd $_pkgname

	git submodule init
	git config submodule.m4.url "$srcdir/util-common-m4"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd $_pkgname

	./autogen.sh --prefix=/usr
	make
}

package() {
	cd $_pkgname

	DESTDIR="$pkgdir" make install
	install -vDm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
