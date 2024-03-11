# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

_pkgname=idris2-toml-idr
pkgname="$_pkgname-git"
pkgver=latest
pkgrel=1
epoch=
pkgdesc='A TOML parser for Idris 2'
arch=('x86_64')
url='https://github.com/cuddlefishie/toml-idr'
license=('MPL-2.0' 'CC0-1.0')
depends=('idris2')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

_setenv() {
	unset IDRIS2_PACKAGE_PATH IDRIS2_PREFIX
	IDRIS2_PACKAGE_PATH="$(idris2 --libdir)"
	IDRIS2_PREFIX="$pkgdir/usr/lib"
	export IDRIS2_PACKAGE_PATH IDRIS2_PREFIX
}

pkgver() {
	cd "$srcdir/$_pkgname"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	_setenv
	cd "$srcdir/$_pkgname"
	idris2 --build toml.ipkg
}

package() {
	_setenv
	cd "$srcdir/$_pkgname"

	idris2 --install-with-src toml.ipkg
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE" LICENSES/*
}
