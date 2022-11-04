# Maintainer: 404DeadLink <msg on AUR>
pkgname=ocaml-cil-git
pkgver=r4768.673aa00b
pkgrel=1
pkgdesc="C Intermediate Language
CIL is a front-end for the C programming language that facilitates program analysis and transformation. CIL will parse and typecheck a program, and compile it into a simplified subset of C.
"
arch=('x86_64')
url="https://goblint.github.io/cil/"
license=('GPL')
groups=()
depends=('ocaml' 'ocaml-zarith' 'ocaml-stdlib-shims' 'ocaml-ppx_deriving_yojson-git')
makedepends=('git' 'lib32-glibc' 'dune' 'perl' 'cppo')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=(!strip)
install=
source=("${pkgname%-git}::git+https://github.com/goblint/cil")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
	cd "$srcdir/${pkgname%-git}"
	dune build @install
}

check() {
	cd "$srcdir/${pkgname%-git}"
	dune runtest
}

package() {
	cd "$srcdir/${pkgname%-git}"
	
	DESTDIR="${pkgdir}" dune install --prefix=/usr --libdir="/usr/lib/ocaml"

	# Dune installs documentation in /usr/doc, fix that.
	install -dm755 "${pkgdir}/usr/share/"
	mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
