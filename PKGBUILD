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
pkgver=2.5hh.r42.g78d0b8c
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
	cd "$srcdir/zrc"
	make DESTDIR="$pkgdir" PREFIX=/usr install

	if [ ! -f ~/.zrc ]; then
		echo "Copying default config..."
		cp .zrc ~
	fi

	mkdir -p "$pkgdir"; mkdir -p "$pkgdir/usr"; mkdir -p "$pkgdir/usr/bin"
	cp -f /bin/zrc "$pkgdir/usr/bin/zrc"	
	chmod 755 "$pkgdir/usr/bin/zrc"	
}
