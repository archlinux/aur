# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Joel Goguen <contact+aur@jgoguen.ca>
# Contributor: Vlad M. <vlad@archlinex.net>
# Contributor: Gordin <9ordin @t gmail>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
pkgname='flow'
pkgver='0.208.0'
pkgrel='1'
pkgdesc='A static type checker for JavaScript'
# If you're running on aarch64, you have to add it to the arch array of the cppo, ocaml-biniou, ocaml-easy-format and ocaml-yojson AUR dependencies
arch=('x86_64' 'aarch64')
url="https://$pkgname.org"
license=('MIT')
makedepends=('ocaml>=4.14.0' 'camlp-streams' 'dune>=3.0.0' 'ocaml-base>=0.14.1' 'ocaml-core_kernel>=0.14.1' 'ocaml-dtoa>=0.3.2' 'ocaml-fileutils>=0.6.3' 'ocaml-inotify>=2.4.1' 'ocaml-lwt>=5.4.0' 'ocaml-lwt_log>=1.1.1' 'ocaml-ppx_deriving' 'ocaml-ppx_gen_rec' 'ocaml-ppx_let>=0.14.0' 'ocaml-ppxlib' 'ocaml-sedlex>=2.3' 'ocaml-visitors' 'ocaml-wtf8')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/facebook/$pkgname/archive/v$pkgver.tar.gz"
	'add-streams-dep.diff'
)
sha512sums=('0de2b0bc16be6a6cbc6a79fa2fa2b542baa45c797b15327b10213b81cad9487ca64b5221c8ac52bea70522b89f89c3b9accd5849696c199f8ef1a3f06380fdec'
            '0b7359e263c113bf1e411a648d8ea754872cc7eef0c171d78a3053cf236642cb55314da5c1c283607fd08c0c3583d8e2f9d9536e9ff1b1892cd3ce6d5bb5c21a')

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	patch --forward -p1 < '../add-streams-dep.diff'
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	# Use the default ocaml behaviour to ignore warnings that upstream escalates to errors for some reason, use release build mode
	OCAMLPARAM='_,warn-error=-a+31' FLOW_RELEASE=1 make
	OCAMLPARAM='_,warn-error=-a+31' FLOW_RELEASE=1 make -C src/parser dist/libflowparser.zip
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	./runtests.sh "bin/$pkgname"
}

package() {
	cd "$srcdir/$_sourcedirectory/"

	# Binary
	install -Dm755 "bin/$pkgname" "$pkgdir/usr/bin/$pkgname"

	# Parser library files
	install -dm755 "$pkgdir/usr/lib/ocaml/${pkgname}parser/"
	install -Dm644 "src/parser/dist/lib${pkgname}parser/include/${pkgname}parser/"* "$pkgdir/usr/lib/ocaml/${pkgname}parser/"

	install -dm755 "$pkgdir/usr/lib/"
	install -Dm644 "src/parser/dist/lib${pkgname}parser/lib/"* "$pkgdir/usr/lib/"

	# Misc files
	install -Dm644 'resources/shell/bash-completion' "$pkgdir/usr/share/bash-completion/completions/$pkgname"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
