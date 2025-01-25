# Maintainer: dringsim <dringsim@qq.com>
pkgname="ocaml-uint"
pkgver='2.0.1'
pkgrel='2'
pkgdesc='An unsigned integer library'
arch=('x86_64')
url="https://github.com/andrenth/ocaml-uint"
license=('MIT')
depends=('ocaml>=4.07.0' 'ocaml-stdint')
makedepends=('dune>=1.11')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('6ecb73813b6636c631a1ea4aa8994f3285e8b5e22e35f33828534b05b1f6f9d54f1f38f822a3512e95bbdba92cc8ee98df472fcbeb9884aeeefc73c038d9084a')

_sourcedirectory="$pkgname-$pkgver"

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
	ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
