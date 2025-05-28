# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Lance Roy <ldr709@gmail.com>
_projectname='core_unix'
pkgname="ocaml-$_projectname"
pkgver='0.17.1'
pkgrel='2'
epoch='1'
pkgdesc='Unix-specific extensions to some of the modules defined in ocaml-core and ocaml-core_kernel'
arch=('x86_64' 'aarch64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=('ocaml>=5.1.0' 'ocaml-core>=0.17.0' 'ocaml-core_kernel>=0.17.0' 'ocaml-expect_test_helpers_core>=0.17.0' 'ocaml-jane-street-headers>=0.17.0' 'ocaml-jst-config>=0.17.0' 'ocaml-ppx_jane>=0.17.0' 'ocaml-ppx_optcomp>=0.17.0' 'ocaml-sexplib>=0.17.0' 'ocaml-timezone>=0.17.0' 'ocaml-uopt>=0.17.0' 'ocaml-spawn>=0.15.0')
makedepends=('dune>=3.11.0')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('384bc85e12362e7ec02c9e2e1e38f6350d8c9db682e4e8a23184487a0261b45373460d3f22d7a87856d88bfc1176a1ea5d7d5fa0d88979b81c8250e546c9ea7a')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Disable broken test
	sed -i 's/command_validate_parsing//g' 'command_unix/test-bin/dune'
	rm 'command_unix/test-bin/command_validate_parsing.ml'{,i}
	rm 'command_unix/test/setup-script.sh' 'command_unix/test/test-validate-parsing.t' 'command_unix/test/test_command_validate_parsing_flag.ml'{,i}
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
	DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --docdir '/usr/share/doc' --mandir '/usr/share/man' --release --verbose

	for _folder in "$pkgdir/usr/share/doc/"*; do
		mv "$_folder" "$pkgdir/usr/share/doc/ocaml-$(basename "$_folder")"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
