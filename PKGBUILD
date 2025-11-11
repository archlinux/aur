# Maintainer: Edd12321 <sanduedi309@gmail.com>
pkgname=zrc
pkgdesc="A custom shell inspired by Tcl"
pkgrel=1
arch=('any')
url="https://github.com/Edd12321/zrc"
license=('BSD-2-Clause')
makedepends=('git' 'bison' 'flex' 'make' 'gcc' 'clang' 'grep')
source=("git+https://github.com/Edd12321/zrc.git")
sha256sums=('SKIP')
pkgver=2.5hh.r6.g365cc10
options=('!debug')
install="zrc.install"

pkgver() {
	cd "$srcdir/zrc" || return 1
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/zrc"
	sed -i '\#\@grep#d' Makefile
	export CXX="${CXX:-g++}"
	make CXX="$CXX" CXXFLAGS="${CXXFLAGS:--std=gnu++11 -Wno-unused-result -O3}"
}

package() {
	cd "$srcdir/zrc"
	make DESTDIR="$pkgdir" PREFIX=/usr install

	if [ ! -f ~/.zrc ]; then
		echo "Copying default config..."
		cp .zrc ~
	fi

	install -d "$pkgdir/usr/bin"
	install -m755 bin/zrc "$pkgdir/usr/bin/zrc" || true
}
