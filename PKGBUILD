# Maintainer: Erik Bročko <erik.brocko@letemsvetemapplem.eu>

pkgname=csdr-jketterl-git
pkgver=0.17.0.r9.g64ed1aa
pkgrel=1
pkgdesc="A simple DSP library and command-line tool for Software Defined Radio."
arch=('i686' 'x86_64')
url="https://github.com/jketterl/csdr"
license=('GPL3')
makedepends=('git')
provides=('csdr')
source=("$pkgname"::'git://github.com/jketterl/csdr.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	# use git tag or fall back to number of revisions
	( set -o pipefail
		git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$srcdir/$pkgname"
	autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
	install -Dm 0755 csdr "${pkgdir}"/usr/bin/csdr
	install -Dm 0755 nmux "${pkgdir}"/usr/bin/nmux
}
