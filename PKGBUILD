# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Joel Goguen <contact+aur@jgoguen.ca>
# Contributor: Vlad M. <vlad@archlinex.net>
# Contributor: Gordin <9ordin @t gmail>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
pkgname='flow'
pkgver='0.290.0'
pkgrel='1'
pkgdesc='A static type checker for JavaScript'
# If you're running on aarch64, you have to add it to the arch array of some AUR ocaml dependencies
arch=('x86_64' 'aarch64')
url="https://$pkgname.org"
license=('MIT')
depends=('libev')
makedepends=('ocaml>=5.2.0' 'camlp-streams>=5.0.1' 'dune>=3.2.0' 'ocaml-base>=0.17.1' 'ocaml-dtoa>=0.3.2' 'ocaml-fileutils>=0.6.4' 'ocaml-inotify>=2.4.1' 'ocaml-lwt>=5.7.0' 'ocaml-lwt_log>=1.1.1' 'ocaml-ppx_deriving' 'ocaml-ppx_gen_rec' 'ocaml-ppx_expect>=0.17.0' 'ocaml-ppx_let>=0.14.0' 'ocaml-ppxlib>=0.36.0' 'ocaml-visitors' 'ocaml-wtf8')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/facebook/$pkgname/archive/v$pkgver.tar.gz"
	'gcc15-compat.diff'
	'ppxlib-compat.diff'
)
b2sums=('5a4a7169c1798beb4b0409ecbcf1831534259909b9040b4ce6fa94ab273698a12bc5f57b9463c5b6971f69ce38085bc19cfafb8781d5c12ad37d7b98c4552c84'
        'e2eebfbb0dc12a7b234379a8fa5e92476551c949c83b30b1c303884a083b14b5fc10b64ca131794f77194d2db0318df21176e2788cf437e27ca5ea3a853fba7f'
        'd62be95aa1d9693afe7d08ae77a34a566c7201872d6b4003aab9e0d0610df685fa39c463aaabc9658d9ad283b9e000e649b8f3e251f6e586d750c103cab1d671')

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Fix compatibility with GCC 15
	patch --forward -p1 < "$srcdir/gcc15-compat.diff"

	# Fix compatibility with ocaml-ppxlib>=0.36.0 (based on https://github.com/ocaml-community/sedlex/commit/260e50e6c41660e4784eab1144e7e076743039a0, https://github.com/ocaml-community/sedlex/commit/e89d147a15fa125f2978870b6fa96abb2e6a1037, https://github.com/ocaml-community/sedlex/commit/51637d261ab1a4eb957379cf28abf97519a46345)
	patch --forward -p1 < '../ppxlib-compat.diff'
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
