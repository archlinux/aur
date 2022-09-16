# Maintainer: atriix <aur a snilius d com>
#
# Due to https://twitter.com/francesc/status/961249107020001280
# This package follows https://github.com/kevinburke/go-bindata the same that Google's Bazel build system now does
# https://github.com/bazelbuild/rules_go/pull/1308
pkgname=go-bindata-new-git
pkgver=3.24.0.r0.g1b67e2d
pkgrel=2
pkgdesc="A small utility which generates Go code from any file. Useful for embedding binary data in a Go program."
arch=(x86_64)
url="https://github.com/kevinburke/go-bindata"
license=(CC0-1.0)

source=("git+https://github.com/kevinburke/go-bindata.git")
sha256sums=('SKIP')

makedepends=(git go)
provides=(go-bindata)
conflicts=(go-bindata go-bindata-git)
options=('!strip')

pkgver() {
	cd "go-bindata"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	export GOPATH=$srcdir/gopath
	rm -rf $srcdir/gopath
	mkdir -p "$srcdir/gopath/src/github.com/kevinburke"
	export GO111MODULE=auto
	ln -s $srcdir/go-bindata $GOPATH/src/github.com/kevinburke/go-bindata
	cd $GOPATH/src/github.com/kevinburke/go-bindata

	go build -v -o .bin ./go-bindata
}

package() {
	install -Dm755 "$srcdir/gopath/src/github.com/kevinburke/go-bindata/.bin" $pkgdir/usr/bin/go-bindata
}
