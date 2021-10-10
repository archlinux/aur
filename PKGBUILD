# Maintainer: Angel de Vicente <angel.vicente.garrido at gmail dot com>

pkgname="parallel-git"
pkgver=20210922.r0.123126f6
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
            '68f6b51d3cad78498f96f2ab53287027492d26a8df056404323c27bdd1cc301f') 

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


