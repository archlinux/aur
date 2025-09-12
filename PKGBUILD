# Maintainer: Matthieu Monsch <mtth at apache dot org>

_pkgname=git-draft
pkgname="$_pkgname-git"
pkgver=0.0.0
pkgrel=1
pkgdesc='Git-centric code assistant'
arch=(any)
url=https://github.com/mtth/git-draft
license=(MIT)

depends=(git)
makedepends=(asciidoctor python-build python-installer python-wheel)

source=("git+https://github.com/mtth/$_pkgname.git#branch=main")
sha256sums=(SKIP)

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --tags --long | sed -e 's/-/_/g' -e 's/^v//'
}

build() {
	cd "$srcdir/$_pkgname"
	python -m build --wheel --no-isolation
	asciidoctor -b manpage \
			-a mansource="$_pkgname v$pkgver" \
			-a manmanual="$_pkgname manual" \
			-o - "docs/$_pkgname.1.adoc" |
		gzip -9 >"$_pkgname.1.gz"
}

package() {
	cd "$srcdir/$_pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
	install -Dm0644 -t "$pkgdir/usr/share/man/man1" $_pkgname.1.gz
}
