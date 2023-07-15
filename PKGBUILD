# Maintainer: éclairevoyant

_pkgname=c2nim
pkgname="$_pkgname-git"
pkgver=0.9.18.r36.6d35d93
pkgrel=2
epoch=1
pkgdesc="Tool to translate ANSI C code to Nim"
arch=(i686 x86_64)
url="https://github.com/nim-lang/$_pkgname"
license=(MIT)
depends=(glibc gcc-libs)
makedepends=(choosenim git)
optdepends=('nim: compile generated code')
provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")
source=("git+$url.git?signed")
b2sums=('SKIP')
validpgpkeys=('5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23') # GitHub (web-flow commit signing) <noreply@github.com>

_setup() {
	_nimble_dir="$srcdir/nimbleDir"
	_path="$_nimble_dir/bin:$PATH"
	cd $_pkgname
}

prepare() {
	_setup

	# stable nim doesn't support --offline --noRebuild
	CHOOSENIM_NO_ANALYTICS=1 choosenim '#head' --nimbleDir="$_nimble_dir"
}

pkgver() {
	git -C $_pkgname describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	_setup

	PATH="$_path" nimble install --offline --noRebuild -l --verbose \
		--passNim:--passC:"\"$CFLAGS\"" --passNim:--passL:"\"$LDFLAGS\""
}

package() {
	cd $_pkgname
	install -vDm755 $_pkgname -t "$pkgdir/usr/bin/"
	install -vDm644 "doc/$_pkgname.rst" README.md -t "$pkgdir/usr/share/doc/$_pkgname/"
	install -vDm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
