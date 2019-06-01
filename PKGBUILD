# Maintainer: Jakub Kądziołka <kuba@kadziolka.net>

pkgname=bsp-patch-git
pkgdesc="C implementation of the Binary Scripted Patch specification"
pkgver=115.b15e82e
pkgrel=1
arch=(x86_64)
url="https://github.com/fstirlitz/c-bsp"
license=('custom:publicdomain')
depends=(glibc)
makedepends=(make git)
source=(git+ssh://git@github.com/fstirlitz/c-bsp)
sha1sums=(SKIP)

pkgver() {
	cd c-bsp
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
	# Patch the Makefile to allow setting LDFLAGS from the environment
	sed '/LDFLAGS :=/s/$/ ${LDFLAGS}/' -i c-bsp/Makefile
}

build() {
	cd c-bsp
	make
}

package() {
	cd c-bsp
	make install DESTDIR="$pkgdir" prefix="/usr"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
