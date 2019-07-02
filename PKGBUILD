# Maintainer: antonin <antonin dot guyot75 at gmail dot com>
pkgname=vultr-cli
pkgver=0.1.0
pkgrel=1
pkgdesc="The Vultr Command Line Interface"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('go' 'git')
source=( "https://github.com/vultr/$pkgname/archive/v${pkgver}.tar.gz" )
sha256sums=('c7f8d5da60ab1fbb39a27d777d903ffad5456f858a9d8603721872dd948a2c3d')

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
