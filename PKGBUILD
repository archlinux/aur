# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Matej Grabovsky <matej.grabovsky at gmail>
_projectname='sedlex'
pkgname="ocaml-$_projectname"
pkgver='3.3'
pkgrel='1'
pkgdesc='Unicode-friendly OCaml lexer generator'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-community/$_projectname"
license=('MIT')
depends=('ocaml>=4.08.0' 'ocaml-gen' 'ocaml-ppxlib>=0.26.0' 'zstd')
makedepends=('dune>=3.0.0')
checkdepends=('ocaml-ppx_expect')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('aab0e15246dbdd5eb442be930483bf3b8950a13189b0175d9c1af90f1a42cff1b39337284dd69e10b06fd94b7889e749faad0d97279675482dc776621d12e686')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	dune build --release --verbose
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	dune runtest --release --verbose
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	for _folder in "$pkgdir/usr/share/doc/"*; do
		mv "$_folder" "$pkgdir/usr/share/doc/ocaml-$(basename "$_folder")"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
