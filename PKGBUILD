# Maintainer: Maarten de Vries <maarten@de-vri.es>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=expat1
_name=expat
pkgver=1.95.8
pkgrel=1
pkgdesc='An XML parser library'
arch=(x86_64)
url='https://libexpat.github.io/'
license=(custom)
depends=(glibc)

source=(
	"https://github.com/libexpat/libexpat/releases/download/R_1_95_8/expat-1.95.8.tar.gz"
	"expat-1.95.8-destdir.patch"
)
sha256sums=('c6aaa0b427e775a0fd5a956a75ae41e5110f22760723d9bda316100010e891ca'
            'bd61f7b436c2a3e42bc77f896b56a5cfda7f7127e93795ee312dc0056a502958')

prepare() {
	cd "$srcdir/$_name-$pkgver"
	patch -p1 < "$srcdir/expat-1.95.8-destdir.patch"
	./configure --prefix=/usr --disable-static
}

build() {
	cd $_name-$pkgver
	make
}

check() {
	make -C $_name-$pkgver check
}

package() {
	cd $_name-$pkgver
	make DESTDIR="$pkgdir" install
	install -Dm644 "-t$pkgdir/usr/share/licenses/$pkgname" COPYING
	rm "$pkgdir/usr/lib/libexpat.so"
	rm -rf "$pkgdir/usr/bin"
	rm -rf "$pkgdir/usr/include"
	rm -rf "$pkgdir/usr/man"
}
