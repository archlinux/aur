# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='containers'
pkgname="ocaml-$_projectname"
pkgver='3.16'
_commit='99dba20fa6ba0f2db4b9b9ae2acbf4185fa502f4'
pkgrel='2'
pkgdesc='A lightweight, modular standard library extension, string library, and interfaces to various libraries for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/c-cube/$pkgname"
license=('BSD-2-Clause')
depends=('ocaml>=4.12.0' 'dune>=3.0.0')
makedepends=('git')
checkdepends=('ocaml-csexp' 'ocaml-gen' 'ocaml-iter' 'ocaml-mdx' 'ocaml-qcheck>=0.26' 'ocaml-uutf' 'ocaml-yojson')
options=('!strip')
source=(
	"$pkgname-$pkgver::git+$url#commit=$_commit?signed"
	"$pkgname-$pkgver-fix-tests.diff::$url/commit/3b49ad2a4e8cfe366d0588e1940d626f0e1b8a2d.diff"
	'remove-either-dep.diff'
)
b2sums=('b47d4b9ba9b5c9ca8cfed783c46a5e60125e96f0fa3dbcd694057c3af90626d19442614bd2b031b252678e4a1cbd6deafcfbc6857c0ae47715a81ad99c726dd4'
        'aa70a055b83d985a3ced92a35447a5cd0028febce58fad3db51c6c41e11affa40d49df96b841bcd996261263d43db2d641b519410cd07143ce308f45902bbb13'
        '079e0e5257bb8251f45168096bc4f42b259fbdaf44e61d72b3e75cb74a5a48f541c49f1eac4c4eb100302ffa4405d0dedd278b3cc8274d9126789dcbf8255ad4')
validpgpkeys=('1370978BC81E9735DFE727E1EBFFF6F283F3A2B4') # Simon Cruanes <simon.cruanes.2007@m4x.org> (https://github.com/c-cube.gpg)

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Remove either dependency, as we're always running on OCaml >= 4.12.0
	patch --forward -p1 < '../remove-either-dep.diff'

	# Fix tests not working with ocaml-qcheck>=0.26
	patch --forward -p1 < "../$pkgname-$pkgver-fix-tests.diff"
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
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc/ocaml' --mandir '/usr/share/man' --release --verbose

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/ocaml/$_projectname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/BSD-2-Clause"
}
