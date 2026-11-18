# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Contributor: Daniel Peukert <daniel@peukert.cc>
# Contributor: Matej Grabovsky <matej.grabovsky at gmail>

_projectname='sedlex'
pkgname="ocaml-$_projectname"
pkgver='3.8.1'
pkgrel='1'
pkgdesc='Unicode-friendly OCaml lexer generator'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-community/$_projectname"
license=('MIT')
depends=(
    'glibc'
    'ocaml>=4.11'
    'ocaml-gen'
    'ocaml-ppxlib>=0.26.0'
    'zstd'
)
makedepends=('dune>=3.18.0')
checkdepends=(
	'ocaml-ppx_expect'
	'ocaml-menhir'
)
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('ccb832ded1fd393521501e5c931b0a5af350ab83c5de9d2e89e8763d804356f60b5c3971e5195ed22271c6135703957a4a3bd9ececfb79c0ded504fb88041886')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	dune runtest \
		 --release \
		 --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
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

	# Samples
	# install -Dm644 CHANGES.md -t $pkgdir/usr/share/doc/$pkgname/
	# install -Dm644 HACKING.md -t $pkgdir/usr/share/doc/$pkgname/
	# install -Dm644 README.md -t $pkgdir/usr/share/doc/$pkgname/

	for _folder in "$pkgdir/usr/share/doc/"*; do
		mv "$_folder" "$pkgdir/usr/share/doc/ocaml-$(basename "$_folder")"
	done

	# Documentation
#	find examples -type d -exec install -d  $pkgdir/usr/share/doc/$pkgname/{} \;
	find examples -type f -exec install -Dm644 {} $pkgdir/usr/share/doc/$pkgname/{} \;

	# License
	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
