# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Joel Goguen <contact+aur@jgoguen.ca>
# Contributor: Vlad M. <vlad@archlinex.net>
# Contributor: Gordin <9ordin @t gmail>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
pkgname='flow'
pkgver='0.203.1'
pkgrel='1'
pkgdesc='A static type checker for JavaScript'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://$pkgname.org"
license=('MIT')
makedepends=('ocaml>=4.14.0' 'dune>=3.0.0' 'ocaml-base>=0.14.1' 'ocaml-core_kernel>=0.14.1' 'ocaml-dtoa>=0.3.2' 'ocaml-fileutils>=0.6.3' 'ocaml-inotify>=2.4.1' 'ocaml-lwt>=5.4.0' 'ocaml-lwt_log>=1.1.1' 'ocaml-ppx_deriving' 'ocaml-ppx_gen_rec' 'ocaml-ppx_let>=0.14.0' 'ocaml-ppxlib' 'ocaml-sedlex>=2.3' 'ocaml-visitors' 'ocaml-wtf8')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/facebook/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('8d48ba4139098f0f6d2766fabc2b6aef9dff231fc6f8f4caf8f696bda378cfa6a7e3182c337d7e05c35d668c641df21990a2df6c16683983dbc2f905652972ea')

_sourcedirectory="$pkgname-$pkgver"

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
