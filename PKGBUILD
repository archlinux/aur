# Maintainer: Juan Simón <play4pro@protonmail.com>

pkgname=gosearch-git
pkgver=r51.10a3ea1
pkgrel=2
pkgdesc="A fast, real-time file searching program for Linux 5.1+"
url="https://github.com/ozeidan/gosearch"
arch=('x86_64')
license=('GPL3')
makedepends=(go-pie git)
provides=("${pkgname%-git}")
conflicts=("${provides[@]}")
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

install="gosearch.install"

pkgver() {
	cd "$srcdir"/$pkgname

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
	mkdir -p gopath/src/github.com/ozeidan
	ln -rTsf $pkgname gopath/src/github.com/ozeidan/$pkgname
	
	export GOPATH="$srcdir"/gopath
	export GO111MODULE=on
	
	cd gopath/src/github.com/ozeidan/$pkgname
	make deps
	
	cd "$srcdir"/$pkgname	
	sed -i -e 's/clean$/clean -modcache/1' -e '/rm -f \$./d' Makefile	
}

build() {
	export GOPATH="$srcdir"/gopath
	export GOFLAGS="-gcflags=all=-trimpath=${srcdir} -asmflags=all=-trimpath=${srcdir} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"
	
	cd "$srcdir"/$pkgname
	make all
	make clean
}

package() {
	cd "$srcdir"/$pkgname
	
	install -Dm755 gosearchServer "${pkgdir}"/usr/bin/gosearchServer
	install -Dm755 gosearch "${pkgdir}"/usr/bin/gosearch
	install -Dm644 init/gosearch.service "${pkgdir}"/usr/lib/systemd/system/gosearch.service   
}
