# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

_pkgname=idris2-lsp
pkgname="$_pkgname-git"
pkgver=latest
pkgrel=3
epoch=
pkgdesc='Language Server for Idris2'
arch=('x86_64')
url="https://github.com/idris-community/$_pkgname"
license=('custom:BSD')
depends=('idris2' 'sh')
makedepends=('git' 'idris2-lsp-lib-git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git"
        'idris2::git+https://github.com/idris-lang/Idris2.git')
sha256sums=('SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"
	git submodule init
	git config submodule.Idris2.url "$srcdir/idris2"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir/$_pkgname"
	make build
}

check() {
	cd "$srcdir/$_pkgname"
	make testbin
	INTERACTIVE='' make test-only
}

package() {
	cd "$srcdir/$_pkgname"
	PREFIX="$pkgdir/usr/lib" make install-only

	mkdir -p "$pkgdir/usr/bin"
	mv "$pkgdir/usr/lib/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	sed -i 's|$DIR|/usr/lib|g' "$pkgdir/usr/bin/$_pkgname"

	mv "$pkgdir/usr/lib/bin/${_pkgname}_app" \
		"$pkgdir/usr/lib/${_pkgname}_app"
	rmdir "$pkgdir/usr/lib/bin"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
