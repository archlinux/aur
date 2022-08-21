# Maintainer: Martin Rys <rys.pw/contact>
pkgname=packr
_pkgname=packr
pkgver=2.8.3
pkgrel=1
pkgdesc="packr - Go static assets bundler"
url="https://github.com/gobuffalo/packr"
arch=('i686' 'x86_64')
license=('MIT')
depends=()
makedepends=(
	'go'
	'git'
)

source=("$_pkgname::git+https://github.com/gobuffalo/packr.git#tag=v${pkgver}")
sha256sums=('SKIP')

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
	cd "${_pkgname}2"
	go install -v -gcflags "-trimpath $GOPATH/src"
}

package() {
	ls -lah $srcdir/go/bin/
	find "$srcdir/go/bin/" -type f -executable | while read filename; do
		install -DT "$filename" "$pkgdir/usr/bin/$(basename $filename)"
	done
}
