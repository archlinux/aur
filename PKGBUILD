# Maintainer: Dan Printzell <arch@vild.io>

pkgname=('dscanner-git')
pkgver=0.4.0.r73.0b064a0
pkgrel=2
pkgdesc="Swiss-army knife for D source code"
arch=('i686' 'x86_64')
url="https://github.com/dlang-community/D-Scanner"
license=("BSL")
groups=('dlang')
makedepends=('dmd' 'git')
depends=('libphobos')
provides=('dscanner')
conflicts=('dscanner')

source=(
	"git+https://github.com/dlang-community/D-Scanner"
	"git+https://github.com/Hackerpilot/libdparse"
	"git+https://github.com/burner/inifiled"
	"git+https://github.com/economicmodeling/containers"
	"git+https://github.com/Hackerpilot/dsymbol"
	"git+https://github.com/economicmodeling/libddoc"
)
sha256sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
)

pkgver() {
	cd "$srcdir/D-Scanner"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g;s/\.rc./rc/g'
}

prepare() {
	cd "$srcdir/D-Scanner"

	git submodule init
	git config submodule.libdparse.url "$srcdir/libdparse"
	git config submodule.inifiled.url "$srcdir/inifiled"
	git config submodule.containers.url "$srcdir/containers"
	git config submodule.dsymbol.url "$srcdir/dsymbol"
	git config submodule.libddoc.url "$srcdir/libddoc"
	git submodule update
}

build() {
	cd "$srcdir/D-Scanner"
	make
}

package() {
	# binaries
	install -Dm755 "$srcdir/D-Scanner/bin/dscanner" "$pkgdir/usr/bin/dscanner"

	# license
	install -Dm644 "$srcdir/D-Scanner/LICENSE_1_0.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
