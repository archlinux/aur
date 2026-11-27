# Maintainer: emile-ross <emileross@proton.me>
# Contributor: zerfithel <hazetlab@proton.me>

pkgname=wordle-solver-git
pkgver=1.4.15.24d718f
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

	DEBUG_FP="./target/debug/wordle-solver"
	RELEASE_FP="./target/release/wordle-solver"

	if [ -f $DEBUG_FP ] ;
	then
		echo "Installing from debug file path"
		install -Dm755 $DEBUG_FP "$pkgdir/usr/bin/wordle-solver"
	elif [ -f $RELEASE_FP ] ; 
	then
		echo "Installing $RELEASE_FP"
		install -Dm755 $RELEASE_FP "$pkgdir/usr/bin/wordle-solver"
	else
		echo "Falling back to default path"
		install -Dm755 ./wordle-solver "$pkgdir/usr/bin/wordle-solver"
	fi


	install -d "$pkgdir/usr/share/wordle-solver/word_list_files"
	install -m644 word_list_files/*.txt "$pkgdir/usr/share/wordle-solver/word_list_files/"
}
