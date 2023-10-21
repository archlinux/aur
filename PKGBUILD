# Maintainer: Thomas Hansen <thomas-e-hansen at teh dot eu>
# Co-maintainer: MithicSpirit <rpc01234 at gmail dot com>

_pkgname=idris2
pkgname=$_pkgname-git
pkgver=latest
pkgrel=2
pkgdesc='A purely functional programming language with first class types'
url='https://www.idris-lang.org/'
license=('custom')
arch=('x86_64')
depends=('chez-scheme' 'sh')
makedepends=('git')
checkdepends=('nodejs' 'racket')
optdepends=('nodejs: javascript backend'
            'racket: racket backend'
            'gcc: refc backend')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/idris-lang/${_pkgname^}.git")
sha256sums=('SKIP')
options=(staticlibs)

_setvars() {
	export MAKEFLAGS+=' -j1 '
	export SCHEME='chez'
	_bootstrap="$srcdir/bootstrap"
	export PATH="$_bootstrap/bin:$PATH"
}

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	_setvars
	mkdir -p "$_bootstrap"
}

build() {
	_setvars
	cd "$srcdir/$_pkgname"

	export PREFIX="$_bootstrap"
	make bootstrap
	make install

	make clean
	PREFIX='/usr/lib' make all
}

check() {
	_setvars
	cd "$srcdir/$_pkgname"

	export PREFIX="$_bootstrap"

	INTERACTIVE='' make test
}

package() {
	_setvars
	options=(staticlibs)
	cd "$srcdir/$_pkgname"

	export PREFIX="$pkgdir/usr/lib"
	export IDRIS2_PREFIX="$PREFIX"

	PREFIX='/usr/lib' IDRIS2_PREFIX='/usr/lib' make src/IdrisPaths.idr
	sed -i 's|src/IdrisPaths.idr: FORCE|src/IdrisPaths.idr:|g' Makefile

	make install
	make install-libdocs
	make install-with-src-libs
	make install-with-src-api

	mkdir -p "$pkgdir/usr/bin"
	mv "$pkgdir/usr/lib/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	sed -i 's|$DIR|/usr/lib|g' "$pkgdir/usr/bin/$_pkgname"

	mv "$pkgdir/usr/lib/bin/${_pkgname}_app" \
		"$pkgdir/usr/lib/${_pkgname}_app"
	rmdir "$pkgdir/usr/lib/bin"

	install -Dm644 <(idris2 --bash-completion-script idris2) \
		"$pkgdir/usr/share/bash-completion/completions/$_pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
