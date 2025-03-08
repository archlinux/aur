# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Joel Goguen <contact+aur@jgoguen.ca>
# Contributor: Vlad M. <vlad@archlinex.net>
# Contributor: Gordin <9ordin @t gmail>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
pkgname='flow'
pkgver='0.263.0'
pkgrel='1'
pkgdesc='A static type checker for JavaScript'
# If you're running on aarch64, you have to add it to the arch array of some AUR ocaml dependencies
arch=('x86_64' 'aarch64')
url="https://$pkgname.org"
license=('MIT')
depends=('libev')
makedepends=('ocaml>=5.2.0' 'camlp-streams>=5.0.1' 'dune>=3.2.0' 'ocaml-base>=0.16.3' 'ocaml-dtoa>=0.3.2' 'ocaml-fileutils>=0.6.4' 'ocaml-inotify>=2.4.1' 'ocaml-lwt>=5.7.0' 'ocaml-lwt_log>=1.1.1' 'ocaml-ppx_deriving' 'ocaml-ppx_gen_rec' 'ocaml-ppx_expect>=0.17.0' 'ocaml-ppx_let>=0.14.0' 'ocaml-ppxlib>=0.32.1' 'ocaml-visitors' 'ocaml-wtf8')
source=("$pkgname-$pkgver.tar.gz::https://github.com/facebook/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('3638746bd41a1a865d013bc31d137a85d8ca77f42b8f85aa70f23af87f6a4e84e4720616c74f05e5cd71ad0a12ea3b3ae159d9c50e52b1d3948a59650d09a8b7')

_sourcedirectory="$pkgname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	# Use ocaml 5.2 keywords, as the 5.3 effect keyword breaks the build, use release build mode
	OCAMLPARAM='_,keywords=5.2' FLOW_RELEASE=1 make
	OCAMLPARAM='_,keywords=5.2' FLOW_RELEASE=1 make -C src/parser dist/libflowparser.zip
}

check() {
	cd "$srcdir/$_sourcedirectory/"

	# Run tests
	./runtests.sh "bin/$pkgname"

	# Verify that the basic functionality works
	_checkoutput="$("$srcdir/$_sourcedirectory/bin/$pkgname" --version)"
	printf '%s\n' "$_checkoutput"
	printf '%s\n' "$_checkoutput" | grep -q "version $pkgver$"
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
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
