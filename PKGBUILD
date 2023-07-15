# Maintainer: éclairevoyant

_pkgname=nasm
pkgname="$_pkgname-git"
pkgver=2.16.01.r9.a916e412
pkgrel=2
epoch=1
pkgdesc="80x86 assembler designed for portability and modularity"
arch=(i686 x86_64)
url='https://www.nasm.us'
depends=(glibc)
makedepends=(
	adobe-source-sans-pro-fonts
	asciidoc
	diffutils
	fontconfig
	ghostscript
	git
	perl-font-ttf
	perl-sort-versions
	ttf-liberation
	xmlto
)
license=(BSD)
provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")
source=("git+https://github.com/netwide-assembler/$_pkgname.git")
b2sums=('SKIP')

pkgver() {
	git -C $_pkgname describe --long --tags | sed 's/^nasm-//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cd $_pkgname
	./autogen.sh
	./configure --prefix=/usr
	make everything
}

check() {
	make -j1 -C $_pkgname/test golden test diff
}

package() {
	cd $_pkgname
	make DESTDIR="$pkgdir" install install_doc
	install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
