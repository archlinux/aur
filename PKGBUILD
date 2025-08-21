# Maintainer: Matthieu Monsch <mtth at apache dot org>

_pkgname=git-jot
pkgname="$_pkgname-git"
pkgver=0.0.0
pkgrel=2
pkgdesc='Emulate branch notes'
arch=(any)
url=https://github.com/mtth/git-jot
license=(MIT)

depends=(git)
makedepends=(asciidoctor)

source=("git+https://github.com/mtth/$_pkgname.git#branch=main")
sha256sums=(SKIP)

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --tags --long | sed -e 's/-/_/g' -e 's/^v//'
}

build() {
	cd "$srcdir/$_pkgname"
	asciidoctor -b manpage \
			-a mansource="$_pkgname v$pkgver" \
			-a manmanual="$_pkgname manual" \
			-o - "$_pkgname.1.adoc" |
		gzip -9 >"$_pkgname.1.gz"
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm0755 "$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
	install -Dm0644 -t "$pkgdir/usr/share/man/man1" $_pkgname.1.gz
}
