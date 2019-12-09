# Maintainer: antonin <antonin dot guyot at icloud dot com>
pkgname=vultr-cli
pkgver=0.1.11
pkgrel=1
pkgdesc="The Vultr Command Line Interface"
arch=('i686' 'x86_64')
license=('Apache 2.0')
makedepends=('go' 'git')
source=( "https://github.com/vultr/$pkgname/archive/v${pkgver}.tar.gz" )
sha256sums=('698554f11ab2937b31b407819bc687c1d3cb5cf280726a4365542bc7a254b94a')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	if [ -L "$srcdir/$pkgname-$pkgver" ]; then
		rm "$srcdir/$pkgname-$pkgver" -rf
		mv "$srcdir/go/src/$pkgname-$pkgver/" "$srcdir/$pkgname-$pkgver"
	fi

	rm -rf "$srcdir/go/src"

	mkdir -p "$srcdir/go/src"

	export GOPATH="$srcdir/go"

	mv "$srcdir/$pkgname-$pkgver" "$srcdir/go/src/"

	cd "$srcdir/go/src/$pkgname-$pkgver/"
	ln -sf "$srcdir/go/src/$pkgname-$pkgver/" "$srcdir/$pkgname-$pkgver"

	# Building binary
	go get -v \
		-gcflags "-trimpath $GOPATH/src"
}

package() {
        cd "$srcdir/go/bin"
    	install -DT "$pkgname" "$pkgdir/usr/bin/vultr-cli"
}
