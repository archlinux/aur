# Maintainer: Christopher Price <pricechrispy at gmail dot com>
# Contributor: Moritz Lipp <mlq@pwmt.org>
_pkgname=google-drive-ocamlfuse
pkgname=google-drive-ocamlfuse-git
pkgver=r621.d1702dc
pkgrel=1
pkgdesc='FUSE-based file system backed by Google Drive, written in OCaml'
arch=('x86_64' 'i686')
url='https://astrada.github.io/google-drive-ocamlfuse/'
license=('MIT')
depends=(
'ocaml>=4.02.3'
'ocaml-findlib>=1.2.7'
'ocamlfuse>=2.7.1'
'gapi-ocaml>=0.3.16'
'ocaml-sqlite3>=1.6.1'
)
makedepends=(
'git'
'dune'
'ocaml-ounit'
)
conflicts=('google-drive-ocamlfuse')
provides=('google-drive-ocamlfuse')
options=('staticlibs')
source=('git+https://github.com/astrada/google-drive-ocamlfuse.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"

	# Old method requires ocamlbuild instead of jbuilder/dune
	#ocaml setup.ml -configure --prefix /usr --destdir "$pkgdir" --exec-prefix "/usr"
	#ocaml setup.ml -build

	#dune build --debug-backtraces --debug-dependency-path --debug-findlib --no-buffer --verbose @install
	dune build @install
}

#check() {
#	cd "$srcdir/$_pkgname"
#
#	ocaml setup.ml -test
#}

package() {
	cd "$srcdir/$_pkgname"

	#export OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)"
	#ocaml setup.ml -install

	mkdir -p "$pkgdir/usr"
	mkdir -p "$pkgdir/$(ocamlfind printconf destdir)"
    
	dune install --prefix="$pkgdir/usr" --libdir="$pkgdir/$(ocamlfind printconf destdir)"
}
