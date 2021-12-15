# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ijq
pkgver=0.3.6
pkgrel=1
pkgdesc='Interactive jq tool, like jqplay for the commandline'
arch=(x86_64)
url="https://git.sr.ht/~gpanders/$pkgname"
license=(GPL3)
depends=(jq)
makedepends=(go scdoc)
source=("$pkgname-v$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('296ec0ca6434b7c086fe3c97286d764964428807f43f61972255f7013b87d42b')

prepare(){
	cd "$pkgname-v$pkgver"
	export GOPATH="$srcdir"
	go mod download
	# release has broken go.sum file
	go mod tidy
}

build() {
	cd "$pkgname-v$pkgver"
	export GOPATH="$srcdir"
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-linkmode external -extldflags \"$LDFLAGS\" -X main.Version=$pkgver" \
		. ./...
	make docs
}

check() {
	cd "$pkgname-v$pkgver"
	export GOPATH="$srcdir"
	go test ./...
}

package() {
	cd "$pkgname-v$pkgver"
	install -Dm755 -t "$pkgdir/usr/bin/" "$pkgname"
	install -Dm644 -t "$pkgdir/usr/share/man/man1/" "$pkgname.1"
}
