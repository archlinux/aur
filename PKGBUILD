# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Contributor: Daniel Peukert <daniel@peukert.cc>

_projectname='mdx'
pkgname="ocaml-$_projectname"
pkgver='2.6.0'
pkgrel='1'
pkgdesc='Executable code blocks inside markdown files for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/realworldocaml/$_projectname"
license=('ISC')
depends=(
    'camlp-streams'
    'ocaml-astring'
    'ocaml-cmdliner>=1.1.0'
    'ocaml-csexp>=1.3.2'
    'ocaml-findlib'
    'ocaml-fmt>=0.8.7'
    'ocaml-logs>=0.7.0'
    'ocaml-ocaml-version>=2.3.0'
    'ocaml-re>=1.7.2'
    'ocaml>=4.08.0'
    'zstd'
)
makedepends=(
    'dune>=3.5.0'
    'cppo>=1.1.0'
)
checkdepends=(
    'ocaml-alcotest'
    'ocaml-lwt'
)
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('12018cf84269c1ffe8389da0528cdac6b9512f4988d6319b3c7bbf4c20635c8d10bd357b5334cc567e95adf2d60ef6aaf9095bf467058d5dbe2dac82acf91a96')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Replace version watermarks
	find . -type f -exec sed -i "s/%%VERSION%%/$pkgver/g" {} +
}

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

    DESTDIR="$pkgdir" \
	   dune install \
	   --prefix '/usr' \
	   --libdir '/usr/lib/ocaml' \
	   --docdir '/usr/share/doc' \
	   --mandir '/usr/share/man' \
	   --release \
	   --verbose

	for _folder in "$pkgdir/usr/share/doc/"*; do
		mv "$_folder" "$pkgdir/usr/share/doc/ocaml-$(basename "$_folder")"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/ISC"
}
