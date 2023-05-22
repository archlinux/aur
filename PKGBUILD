# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Joel Goguen <contact+aur@jgoguen.ca>
# Contributor: Vlad M. <vlad@archlinex.net>
# Contributor: Gordin <9ordin @t gmail>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
pkgname='flow'
pkgver='0.206.0'
pkgrel='2'
pkgdesc='A static type checker for JavaScript'
# If you're running on i686, pentium4, armv7h or aarch64, you have to add it to the arch array of the cppo, ocaml-biniou, ocaml-easy-format and ocaml-yojson AUR dependencies
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://$pkgname.org"
license=('MIT')
makedepends=('ocaml>=4.14.0' 'dune>=3.0.0' 'ocaml-base>=0.14.1' 'ocaml-core_kernel>=0.14.1' 'ocaml-dtoa>=0.3.2' 'ocaml-fileutils>=0.6.3' 'ocaml-inotify>=2.4.1' 'ocaml-lwt>=5.4.0' 'ocaml-lwt_log>=1.1.1' 'ocaml-ppx_deriving' 'ocaml-ppx_gen_rec' 'ocaml-ppx_let>=0.14.0' 'ocaml-ppxlib' 'ocaml-sedlex>=2.3' 'ocaml-visitors' 'ocaml-wtf8')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/facebook/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('309a82bda3ede14f73dd814445a0d9616540087283466c232dd106931ba62c5900fe883b8e8f1593fbb4b11f2b1a421159a8b5991c35fcbcf5a63dc698675570')

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
