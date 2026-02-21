# Maintainer: Edd12321 <sanduedi309@gmail.com>
pkgname=zrc
pkgdesc="A custom shell inspired by Tcl"
pkgrel=1
arch=('any')
url="https://github.com/Edd12321/zrc"
license=('BSD-2-Clause')
makedepends=('git' 'posix' 'gcc')
source=("git+https://github.com/Edd12321/zrc.git")
sha256sums=('SKIP')
pkgver=2.7
options=('!debug')
install="zrc.install"

pkgver() {
	cd "$srcdir/zrc" || return 1
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/zrc"
	printf 'g/@grep/d\nw\nq\n' | ed -s Makefile
	make
}

package() {
	# Binaries	
	cd "$srcdir/zrc"
	make DESTDIR="$pkgdir" PREFIX=/usr install
	rm -rf "$pkgdir/etc" # install hook does this
	# Example scripts + doc stuff
	mkdir -p "$pkgdir/usr/share/doc/zrc/examples"	
	cp -LR examples "$pkgdir/usr/share/doc/zrc"
	cp LICENSE Makefile "$pkgdir/usr/share/doc/zrc"
}
