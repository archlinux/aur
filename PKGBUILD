# Maintainer: antonin <antonin dot guyot at icloud dot com>
pkgname=vultr-cli
pkgver=0.1.10
pkgrel=1
pkgdesc="The Vultr Command Line Interface"
arch=('i686' 'x86_64')
license=('Apache 2.0')
makedepends=('go' 'git')
source=( "https://github.com/vultr/$pkgname/archive/v${pkgver}.tar.gz" )
sha256sums=('119868d5e670e16d9f366af6a6a02f5106d326852977e2e1772485dc980ff445')

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
    	install -DT "$pkgname-$pkgver" "$pkgdir/usr/bin/vultr-cli"
}
