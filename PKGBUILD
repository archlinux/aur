# Maintainer: Egor Gushcha <egorts04@gmail.com> 
pkgname=pacproxy
pkgver=2.0.1
pkgrel=1
pkgdesc="A no-frills local HTTP proxy server powered by a proxy auto-config (PAC) file"
arch=('i686' 'x86_64')
license=('Apache')
depends=(
)
makedepends=(
	'go'
	'git'
)

source=(
	"pacproxy::git://github.com/williambailey/pacproxy.git#branch=${BRANCH:-master}"
)

build() {
	cd "$srcdir/$pkgname"

	if [ -L "$srcdir/$pkgname" ]; then
		rm "$srcdir/$pkgname" -rf
		mv "$srcdir/.go/src/$pkgname/" "$srcdir/$pkgname"
	fi

	rm -rf "$srcdir/.go/src"

	mkdir -p "$srcdir/.go/src"

	export GOPATH="$srcdir/.go"

	mv "$srcdir/$pkgname" "$srcdir/.go/src/"

	cd "$srcdir/.go/src/$pkgname/"
	ln -sf "$srcdir/.go/src/$pkgname/" "$srcdir/$pkgname"

	git submodule update --init

	go get -v \
		-gcflags "-trimpath $GOPATH/src" \
		-ldflags="-X main.2.0.1=$pkgver-$pkgrel"
}

package() {
	find "$srcdir/.go/bin/" -type f -executable | while read filename; do
		install -DT "$filename" "$pkgdir/usr/bin/$(basename $filename)"
	done
}
