# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

_pkgname=idris2-pack
pkgname="$_pkgname-git"
pkgver=latest
pkgrel=2
epoch=
pkgdesc='An Idris2 package manager with curated package collections'
arch=('x86_64')
url="https://github.com/stefan-hoeck/$_pkgname"
license=('custom:BSD')
depends=('chez-scheme' 'sh')
makedepends=('git' 'idris2' 'idris2-filepath' 'idris2-toml-idr')
optdepends=('idris2: Bootstrapping')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

prepare() {
	cd "$srcdir/$_pkgname"
	sed -i -e 's/initToml "scheme"/initToml "chez"/g' \
		-e 's|pathExec "pack"|MkF "/usr/bin" "pack"|g' \
		src/Pack/Config/Environment.idr
}

pkgver() {
	cd "$srcdir/$_pkgname"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	idris2 --build pack.ipkg
}

package() {
	cd "$srcdir/$_pkgname"

	install -dm755 "$pkgdir/usr/lib/"
	cp -r ./build/exec/pack_app "$pkgdir/usr/lib/"

	install -Dm755 ./build/exec/pack "$pkgdir/usr/bin/pack"
	sed -i 's|$DIR|/usr/lib|g' "$pkgdir/usr/bin/pack"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
