# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Joel Goguen <contact+aur@jgoguen.ca>
# Contributor: Vlad M. <vlad@archlinex.net>
# Contributor: Gordin <9ordin @t gmail>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
pkgname='flow'
pkgver='0.273.0'
pkgrel='2'
pkgdesc='A static type checker for JavaScript'
# If you're running on aarch64, you have to add it to the arch array of some AUR ocaml dependencies
arch=('x86_64' 'aarch64')
url="https://$pkgname.org"
license=('MIT')
depends=('libev')
makedepends=('ocaml>=5.2.0' 'camlp-streams>=5.0.1' 'dune>=3.2.0' 'ocaml-base>=0.17.1' 'ocaml-dtoa>=0.3.2' 'ocaml-fileutils>=0.6.4' 'ocaml-inotify>=2.4.1' 'ocaml-lwt>=5.7.0' 'ocaml-lwt_log>=1.1.1' 'ocaml-ppx_deriving' 'ocaml-ppx_gen_rec' 'ocaml-ppx_expect>=0.17.0' 'ocaml-ppx_let>=0.14.0' 'ocaml-ppxlib>=0.32.1' 'ocaml-visitors' 'ocaml-wtf8')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/facebook/$pkgname/archive/v$pkgver.tar.gz"
	'gcc15-compat.diff'
)
b2sums=('ef68ef4b44a8954478a84b783b62829c296d38434e99b6e7230a0ab21434d931defeb424f8654c16e22a9e301207372ae7729e140a23c8f2ffcf18ff3d0dc423'
        'e2eebfbb0dc12a7b234379a8fa5e92476551c949c83b30b1c303884a083b14b5fc10b64ca131794f77194d2db0318df21176e2788cf437e27ca5ea3a853fba7f')

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	patch --forward -p1 < "$srcdir/gcc15-compat.diff"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	FLOW_RELEASE=1 make
	FLOW_RELEASE=1 make -C src/parser dist/libflowparser.zip
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
