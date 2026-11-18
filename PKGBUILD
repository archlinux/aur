# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Contributor: robertfoster

_ocamlname='sedlex'
_pkgbase="ocaml-$_ocamlname"
pkgname="$_pkgbase-git"
pkgver=v3.8.1.r2.gc4753db
pkgrel=1
pkgdesc='An OCaml lexer generator for Unicode'
arch=('x86_64')
url="https://github.com/ocaml-community/$_ocamlname"
license=('MIT')
depends=(
    'glibc'
    'ocaml>=4.11'
    'ocaml-gen'
    'ocaml-ppxlib>=0.26.0'
    'zstd'
)
makedepends=(
    'dune>=3.18.0'
    'git'
)
checkdepends=(
	'ocaml-ppx_expect'
	'ocaml-menhir'
)
provides=($_pkgbase)
conflicts=($_pkgbase)
options=('!strip')
source=("git+${url}.git")
b2sums=('SKIP')

prepare() {
	cd "$srcdir/$_ocamlname/"
	git clean -dfx
}

pkgver() {
	cd "$srcdir/$_ocamlname/"
	git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_ocamlname/"
	dune build --release --verbose
}

check() {
	cd "$srcdir/$_ocamlname/"
	dune runtest \
		 --release \
		 --verbose
}

package() {
	cd "$srcdir/$_ocamlname/"
	DESTDIR="$pkgdir" \
		   dune install \
		   --prefix '/usr' \
		   --libdir '/usr/lib/ocaml' \
		   --docdir "/usr/share/doc" \
		   --mandir '/usr/share/man' \
		   --release \
		   --verbose

	# Emacs mode
	install -Dm644 emacs/sedlex-dot.el -t $pkgdir/usr/share/emacs/site-lisp

	for _folder in "$pkgdir/usr/share/doc/"*; do
		mv "$_folder" "$pkgdir/usr/share/doc/ocaml-$(basename "$_folder")"
	done

	# Documentation
	find examples -type f -exec install -Dm644 {} $pkgdir/usr/share/doc/$pkgname/{} \;

	# License
	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
