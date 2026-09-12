# Maintainer: Z. D. Smith <zd at zdsmith dot com>
pkgname=pantagruel
pkgver=0.24.1
pkgrel=1
pkgdesc='A language for writing and checking precise descriptions of things.'
arch=('x86_64')
url='https://github.com/subsetpark/pantagruel'
makedepends=('opam' 'ocaml>=4.14')
license=('BSD-3-Clause')

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('e43654f5782223f840895f17fcf280fb1989349c089f0f9d77c2a79cfe34d122')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	# Release archives do not contain the Git metadata used to stamp the version.
	sed -i "s/git describe --tags --always/printf v${pkgver}/" bin/dune
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	export OPAMROOT="$srcdir/opam"
	opam init --bare --no-setup --disable-sandboxing
	opam switch create . --no-install -y
	opam install ./pantagruel.opam --deps-only -y
	eval "$(opam env)"
	dune build -p pantagruel bin/main.exe
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "_build/default/bin/main.exe" "${pkgdir}/usr/bin/pant"
}
