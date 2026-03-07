# Maintainer: George Tsiamasiotis <george@tsiamasiotis.gr>

pkgname=ghdl
pkgver=6.0.0
pkgrel=1
arch=('x86_64')
pkgdesc='VHDL 2008/93/87 simulator - mcode backend'
url='https://github.com/ghdl/ghdl'
license=('GPL-2.0-only')

depends=(
	'gcc-ada')
optdepends=(
	'python-pyghdl: python bindings and utilities')
checkdepends=(
	'python-pytest'
	'python-pytooling')

source=( # Upstream likes moving this tag - I'm really tempted to just pin a commit.
	"$pkgname-$pkgver.tar.gz::https://github.com/ghdl/ghdl/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2d84fbd0b238a26928e89a0256274072c6b40af1969a4f4c7be57ec3515bc622')

build() {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr/

	make
}

check() {
	cd "$pkgname-$pkgver"
	make test
}

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir" install

	# Static libraries don't need to be executable
	chmod 644 "$pkgdir/usr/lib/libghdl.a"

	# Install man page
	install -Dm0644 -t "$pkgdir/usr/share/man/man1" doc/ghdl.1
}
