# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Joel Goguen <contact+aur@jgoguen.ca>
# Contributor: Vlad M. <vlad@archlinex.net>
# Contributor: Gordin <9ordin @t gmail>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
pkgname='flow'
pkgver='0.237.2'
pkgrel='1'
pkgdesc='A static type checker for JavaScript'
# If you're running on aarch64, you have to add it to the arch array of some AUR ocaml dependencies
arch=('x86_64' 'aarch64')
url="https://$pkgname.org"
license=('MIT')
depends=('libev')
makedepends=('ocaml>=4.14.0' 'camlp-streams' 'dune>=3.2.0' 'ocaml-base>=0.14.1' 'ocaml-core_kernel>=0.14.1' 'ocaml-dtoa>=0.3.2' 'ocaml-fileutils>=0.6.3' 'ocaml-inotify>=2.4.1' 'ocaml-lwt>=5.4.0' 'ocaml-lwt_log>=1.1.1' 'ocaml-ppx_deriving' 'ocaml-ppx_gen_rec' 'ocaml-ppx_let>=0.14.0' 'ocaml-ppxlib>=0.28.0' 'ocaml-visitors' 'ocaml-wtf8')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/facebook/$pkgname/archive/v$pkgver.tar.gz"
	'add-streams-dep.diff'
)
b2sums=('cd3bb1464eebb934b1cf9d6e7ee258ebd4cb64be594115cb9d6b401e34e39d4cbb8f131d3d94012b5a7e9788d5659f00f800252b295fee658cd61d5c8e39788f'
        'c0be4071b9483f26c1f0c2ed6a5b6bbcd90fb6e907e57aa44d9a8b9e6c4d49a3d0356a32d54b44d7622045abb1f61c73fad6e743253dd19cd51f1bc61b6965dc')

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

	# Run tests
	./runtests.sh "bin/$pkgname"

	# Verify that the basic functionality works
	"$srcdir/$_sourcedirectory/bin/$pkgname" --version | tee '/dev/stderr' | grep -q "version $pkgver$"
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
