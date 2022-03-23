# Maintainer: Angel de Vicente <angel.vicente.garrido at gmail dot com>

pkgname="parallel-git"
pkgver=20220322.r0.58d14374
pkgrel=1
pkgdesc="A shell tool for executing jobs in parallel"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/parallel/"
license=('GPL3')
depends=('perl' 'texinfo')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=("${pkgname%-git}::git+https://git.savannah.gnu.org/git/parallel.git"
        "parallel-skip-rst-pdf-generation.patch")

sha256sums=('SKIP'
            '8bdee3bd4ef7de26cc63424b1276ace7c8c9e1a936937d4d752d5a827ed85f1e') 

pkgver() {
	cd "${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "${pkgname%-git}"
        patch -p1 -i "$srcdir/parallel-skip-rst-pdf-generation.patch"	
        autoupdate
	autoreconf -f -i 
}

build() {
	cd "${pkgname%-git}"
	./configure --prefix=/usr 
	make
}

package() {
	cd "${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}


