# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='domainslib'
pkgname="ocaml-$_projectname"
pkgver='0.5.0'
pkgrel='2'
pkgdesc='Nested-parallel programming library for OCaml'
arch=('x86_64' 'aarch64')
url="https://github.com/ocaml-multicore/$_projectname"
license=('ISC')
depends=('ocaml>=5.0.0' 'ocaml-saturn>=0.2.0')
makedepends=('dune>=3.0.0')
checkdepends=('ocaml-mirage-clock')
options=('!strip')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	'change-lockfree-dep-to-saturn.diff'
)
sha512sums=('6a94afe0f24c6a97d4ad33036ff5c682529d28cd8470e125523d91448d86fd33d28ad9ab3ab56398d98666442d09b4b0d1d7750365bbdfd384a50dd940e65a4a'
            '845b55f22fb83cb2a4d339de7096cff2fb5cee5e26f98dce6d747153b084c748f9ea39a70b6e0d4c4b4cdc0031c5580248fb9cf299bd1cc9fce485c6a96bf9a4')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Lockfree has been moved to the saturn package, use that
	patch --forward -p1 < '../change-lockfree-dep-to-saturn.diff'
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

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
