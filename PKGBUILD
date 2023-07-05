# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Joel Goguen <contact+aur@jgoguen.ca>
# Contributor: Vlad M. <vlad@archlinex.net>
# Contributor: Gordin <9ordin @t gmail>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
_pkgname='flow'
pkgname="$_pkgname-git"
pkgver='0.211.0.r16252.gd4c507bbe'
pkgrel='1'
pkgdesc='A static type checker for JavaScript - git version'
# If you're running on aarch64, you have to add it to the arch array of the cppo, ocaml-biniou, ocaml-easy-format and ocaml-yojson AUR dependencies
arch=('x86_64' 'aarch64')
url="https://$_pkgname.org"
license=('MIT')
makedepends=('git' 'ocaml>=4.14.0' 'camlp-streams' 'dune>=3.0.0' 'ocaml-base>=0.14.1' 'ocaml-core_kernel>=0.14.1' 'ocaml-dtoa>=0.3.2' 'ocaml-fileutils>=0.6.3' 'ocaml-inotify>=2.4.1' 'ocaml-lwt>=5.4.0' 'ocaml-lwt_log>=1.1.1' 'ocaml-ppx_deriving' 'ocaml-ppx_gen_rec' 'ocaml-ppx_let>=0.14.0' 'ocaml-ppxlib>=0.28.0' 'ocaml-visitors' 'ocaml-wtf8')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"$pkgname::git+https://github.com/facebook/$_pkgname"
	'add-streams-dep.diff'
)
sha512sums=('SKIP'
            'd31ccf6d3f7dcd31b421659eb46d8cbb428dd9e5ce8521b6f0d66e5d37f40498a5a9ac6e3db0428bd845f3efcebf73c63ceef07d5bcf02b96dbe10370735638c')

_sourcedirectory="$pkgname"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	patch --forward -p1 < '../add-streams-dep.diff'
}

pkgver() {
	cd "$srcdir/$_sourcedirectory/"
	printf '%s.r%s.g%s' "$(sed -nE 's/^version: "([0-9.]*)"$/\1/p' 'flowtype.opam')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	# Use the default ocaml behaviour to ignore warnings that upstream escalates to errors for some reason, use release build mode
	OCAMLPARAM='_,warn-error=-a+31' FLOW_RELEASE=1 make
	OCAMLPARAM='_,warn-error=-a+31' FLOW_RELEASE=1 make -C src/parser dist/libflowparser.zip
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	./runtests.sh "bin/$_pkgname"
}

package() {
	cd "$srcdir/$_sourcedirectory/"

	# Binary
	install -Dm755 "bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

	# Parser library files
	install -dm755 "$pkgdir/usr/lib/ocaml/${_pkgname}parser/"
	install -Dm644 "src/parser/dist/lib${_pkgname}parser/include/${_pkgname}parser/"* "$pkgdir/usr/lib/ocaml/${_pkgname}parser/"

	install -dm755 "$pkgdir/usr/lib/"
	install -Dm644 "src/parser/dist/lib${_pkgname}parser/lib/"* "$pkgdir/usr/lib/"

	# Misc files
	install -Dm644 'resources/shell/bash-completion' "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
