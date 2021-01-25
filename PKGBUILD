# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ijq
pkgver=0.2.3
pkgrel=1
pkgdesc='Interactive jq tool, like jqplay for the commandline'
arch=(x86_64)
url="https://git.sr.ht/~gpanders/$pkgname"
license=(GPL3)
depends=(jq)
makedepends=(go)
source=("$pkgname-v$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1802a7b319349d86927908854e1cb27ec465e1abf502914c45658c61a9793dda')

prepare(){
	cd "$pkgname-v$pkgver"
	export GOPATH="$srcdir"
	go mod download
}

build() {
	cd "$pkgname-v$pkgver"
	export GOPATH="$srcdir"
	go build \
		-trimpath \
		-buildmode=pie \
		-modcacherw \
		-ldflags "-linkmode external -extldflags \"$LDFLAGS\"" \
		. ./...
	# -mod=readonly \
}

check() {
	cd "$pkgname-v$pkgver"
	export GOPATH="$srcdir"
	go test ./...
}

package() {
	cd "$pkgname-v$pkgver"
	install -Dm755 -t "$pkgdir/usr/bin/" $pkgname
}
