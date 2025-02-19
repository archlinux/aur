# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='kcas'
pkgname="ocaml-$_projectname"
pkgver='0.7.0'
pkgrel='1'
pkgdesc='Software Transactional Memory for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-multicore/$_projectname"
license=('ISC')
depends=('ocaml>=5.0.0' 'ocaml-backoff>=0.1.0' 'ocaml-domain-local-await>=1.0.1' 'ocaml-domain-local-timeout>=1.0.1' 'ocaml-multicore-magic>=2.1.0')
makedepends=('dune>=3.14.0')
checkdepends=('ocaml-alcotest>=1.7.0' 'ocaml-mdx>=2.3.0' 'ocaml-multicore-bench>=0.1.1' 'ocaml-multicoretests>=0.3' 'ocaml-qcheck>=0.21.2')
options=('!strip')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	'remove-domain-shims-dep.diff'
)
b2sums=('573c7b2b9f37eacb3c0253d63df4654afe05d2c3e4665fc633546191052c6c80dc0529f1094676cfc962fe0ea160a2713d902e84c21062b81ac442e396c8a1c0'
        '64cd0ec04ab90686226c7d448a53889b0154c537673b9f15189cebf03a45c46b102f74474af0a4f02dd43a992ce3a156180eb2ceb3976b7b302265b6a3cb9a0f')
_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Remove domain_shims dependency, as we're always running on OCaml >= 5.0.0
	patch --forward -p1 < '../remove-domain-shims-dep.diff'
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
	ln -sf "/usr/share/doc/ocaml/$_projectname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/ISC"
}
