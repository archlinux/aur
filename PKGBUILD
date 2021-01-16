# Maintainer: Simon Wörner <arch-pkg@simon-woerner.de>
pkgname=packr
_pkgname=packr
pkgver=2.8.1
pkgrel=1
pkgdesc="packr - Go static assets bundler"
url="https://github.com/gobuffalo/packr"
arch=('i686' 'x86_64')
license=('GPL')
depends=()
makedepends=(
	'go'
	'git'
)

source=(
	"$_pkgname::git://github.com/gobuffalo/packr.git#tag=v${pkgver}"
)

sha256sums=('SKIP')

backup=()

build() {
	cd "$srcdir/$_pkgname"

	if [ -L "$srcdir/$_pkgname" ]; then
		rm "$srcdir/$_pkgname" -rf
		mv "$srcdir/go/src/$_pkgname/" "$srcdir/$_pkgname"
	fi

	rm -rf "$srcdir/go/src"

	mkdir -p "$srcdir/go/src"

	export GOPATH="$srcdir/go"

	mv "$srcdir/$_pkgname" "$srcdir/go/src/"

	cd "$srcdir/go/src/$_pkgname/"
	ln -sf "$srcdir/go/src/$_pkgname/" "$srcdir/$_pkgname"

	echo ":: Updating git submodules"
	git submodule update --init

	echo ":: Building binary"
	cd "$_pkgname"
	go get -v \
		-gcflags "-trimpath $GOPATH/src"
}

package() {
	find "$srcdir/go/bin/" -type f -executable | while read filename; do
		install -DT "$filename" "$pkgdir/usr/bin/$(basename $filename)"
	done
}
