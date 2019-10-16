# Maintainer: Your Name <youremail@domain.com>
# Contributor: Mark Wagie <yochanan dot marqos at gmail dot com>
# Contributor: Juan Simón <play4pro at protonmail dot com>
pkgname=gosearch-git
pkgver=0.1.r21.518ad3c
pkgrel=1
pkgdesc="A fast, real-time file searching program"
arch=('x86_64')
url="https://github.com/ozeidan/gosearch"
license=('GPL3')
makedepends=('git' 'go-pie' 'dep')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="${pkgname%-git}.install"
source=('git+https://github.com/ozeidan/gosearch.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	mkdir -p gopath/src/github.com/ozeidan
	ln -rTsf "${pkgname%-git}" gopath/src/github.com/ozeidan/"${pkgname%-git}"
	
	export GOPATH="$srcdir"/gopath
	export GO111MODULE=on
	
	cd gopath/src/github.com/ozeidan/"${pkgname%-git}"
	dep init
	dep ensure
}

build() {
	export GOPATH="$srcdir"/gopath
	export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"

	cd "$srcdir/${pkgname%-git}"
	make build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 ${pkgname%-git} $pkgdir/usr/bin/${pkgname%-git}
	install -Dm755 gosearchServer $pkgdir/usr/bin/gosearchServer
	install -Dm644 init/${pkgname%-git}.service $pkgdir/etc/systemd/system/${pkgname%-git}.service
}
