# Maintainer: emile-ross <emileross@proton.me>
# Contributor: zerfithel <hazetlab@proton.me>

pkgname=wordle-solver-git
pkgver=1.4.10.c73fb9f
pkgrel=1

pkgdesc="A fast wordle solver written in C99"
arch=('x86_64')
url="https://github.com/emile-ross/wordle-solver"
license=('GPL-2.0-only')
depends=()
makedepends=('make' 'gcc' 'git' 'rust')
source=("git+https://github.com/emile-ross/wordle-solver.git")
sha256sums=('SKIP')
provides=("wordle-solver=$pkgver")
conflicts=('wordle-solver')

pkgver() {
	cd "${srcdir}/wordle-solver"
	git describe --tags --always \
	  | sed -E 's/^v//' \
	  | sed -E 's/^(.+)-([0-9]+)-g/\1.\2./' \
	  | sed -E 's/-/./g'
}

build() {
	cd "${srcdir}/wordle-solver" || exit 1
	make wordle
}

package() {
	cd "${srcdir}/wordle-solver" || exit 1
	install -Dm755 ./target/debug/wordle-solver "$pkgdir/usr/bin/wordle-solver"

	install -d "$pkgdir/usr/share/wordle-solver/word_list_files"
	install -m644 word_list_files/*.txt "$pkgdir/usr/share/wordle-solver/word_list_files/"
}
