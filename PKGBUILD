# Maintainer: George Tsiamasiotis <gtsiam@windowslive.com>

pkgname=ghdl
pkgver=4.1.0
pkgrel=1
arch=('x86_64')
pkgdesc='VHDL 2008/93/87 simulator'
url='https://github.com/ghdl/ghdl'
license=('GPL-2.0-only')

depends=(
	'gcc-ada')
optdepends=(
	'python-pyghdl: python bindings and utilities')
checkdepends=(
	'python-pytest'
	'python-pytooling')

source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/ghdl/ghdl/archive/refs/tags/v$pkgver.tar.gz"
	'0001-fix-test-suite.patch::https://github.com/ghdl/ghdl/commit/a9fe853e63229603a8958fd80ff8b996dd49c950.patch'
	'0002-fix-callback-types.patch::https://github.com/ghdl/ghdl/commit/659a5d7a018d011aad23235bfd3e306072436a8b.patch'
	'0003-fix-more-callback-types.patch::https://github.com/ghdl/ghdl/commit/5c4d2509b47d416470cdac59bb81955f5aacfee3.patch'
	'0004-fix-prototypes.patch::https://github.com/ghdl/ghdl/commit/9e7a317cea2473a31e18f63b9392912b7da8e63d.patch')

sha256sums=('0aab531b45a6613b0918f3ac6ec717b8acfad051d1abb1c39eb7490590c7a324'
            '93b136658bee0c34c0ac40ea9b5074f69f82cdad6119289f5542bbca18370860'
            '9417a574aa13279a6cb05ac8f5bd9919029117fdbfcbf83a997dd1079b8e2ed3'
            '7ed8e32715f85f03ab3c310ef9aef3190a3bc1f9b84eeb2a9db48ff827c1866e'
            'c8da80ae5cc2cf3209b28d351f8d1345948285516ae97c3b85a75ab19608b30b')

prepare() {
	cd "$pkgname-$pkgver"
	
	# Test suite failures. Should be fixed after 4.1.0
	patch -Np1 -i ../0001-fix-test-suite.patch
	patch -Np1 -i ../0002-fix-callback-types.patch
	patch -Np1 -i ../0003-fix-more-callback-types.patch
	patch -Np1 -i ../0004-fix-prototypes.patch
}

build() {
	cd "$pkgname-$pkgver"

	./configure \
		--prefix=/usr/ \
		--enable-libghdl \
		--enable-synth

	make
}

check() {
	cd "$pkgname-$pkgver"
	make test
}

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir" install

	# Install man page
	install -Dm0644 -t "$pkgdir/usr/share/man/man1" doc/ghdl.1

	# libghdl.a probably shouldn't be executable
	chmod 644 "$pkgdir/usr/lib/libghdl.a"
}
