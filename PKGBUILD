# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
_projectname='bin_prot'
pkgname="ocaml-$_projectname"
pkgver='0.17.0.1'
pkgrel='1'
epoch='1'
pkgdesc='A binary protocol generator'
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT AND BSD-3-Clause')
depends=('ocaml>=5.1.0' 'ocaml-base>=0.17.0' 'ocaml-ppx_compare>=0.17.0' 'ocaml-ppx_custom_printf>=0.17.0' 'ocaml-ppx_fields_conv>=0.17.0' 'ocaml-ppx_optcomp>=0.17.0' 'ocaml-ppx_sexp_conv>=0.17.0' 'ocaml-ppx_stable_witness>=0.17.0' 'ocaml-ppx_variants_conv>=0.17.0')
makedepends=('dune>=3.11.0')
options=('!strip')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/v0.17.0.tar.gz"
	"$pkgname-$pkgver-remove-mirage-xen.patch::https://github.com/ocaml/opam-source-archives/raw/refs/heads/main/patches/bin_prot/remove-outdated-mirage-xen-cross-compilation-rules.patch"
)
b2sums=('bad3203bc42f6f95550a29392fe419d3159614743736ee3bf5855765330c2549575d7af8d42f3534be37fb346d43aa56667d71af328c7ea8ba6c4a64006f695a'
        '990499b43771f44c850711d923797364ec2dbffc80c31a8031a0c35a467b5ab093368e128233d671cffc099b05506c4ac07629dfdb965305fbcdb30ded65b920')

_sourcedirectory="$_projectname-0.17.0"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Remove mirage-xen cross-compilation rules
	patch --forward -p1 < "../$pkgname-$pkgver-remove-mirage-xen.patch"
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
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/MIT"
	ln -sf "/usr/share/doc/$pkgname/LICENSE-Tywith.txt" "$pkgdir/usr/share/licenses/$pkgname/BSD-3-Clause"
}
