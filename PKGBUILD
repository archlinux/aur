# Maintainer: KingofToasters <themanhimself at sgregoratto dot me>
pkgname=cointop
pkgver=1.0.6
pkgrel=3
pkgdesc="An interactive, real-time cryptocurrency monitor"
url="https://github.com/miguelmota/cointop"
license=('APACHE')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=('go-pie' 'dep' 'git')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('6188f21e7fcdfe686324a30a5ccc89a684e2a9acd81f2b042309ec0b28c26272')

prepare(){
	mkdir -p gopath/src/github.com/miguelmota
	ln -rTsf "${pkgname}-${pkgver}" gopath/src/github.com/miguelmota/cointop

	export GOPATH="$srcdir/gopath"
	cd "$GOPATH/src/github.com/miguelmota/cointop"
	dep ensure
}

build() {
	export GOPATH="$srcdir/gopath"
	cd "$GOPATH/src/github.com/miguelmota/cointop"
	go install \
	-gcflags "all=-trimpath=${GOPATH}" \
	-asmflags "all=-trimpath=${GOPATH}" \
	-ldflags "-extldflags ${LDFLAGS}" \
	-v ./...
}

check() {
	export GOPATH="$srcdir/gopath"
	cd "$GOPATH/src/github.com/miguelmota/cointop"
	go test ./...
}

package() {
        install -Dm755 "gopath/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
        install -Dm644 "${pkgname}-${pkgver}/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
