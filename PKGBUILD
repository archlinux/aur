# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ijq
pkgver=1.0.0
pkgrel=1
pkgdesc='Interactive jq tool, like jqplay for the commandline'
arch=(x86_64)
url="https://git.sr.ht/~gpanders/$pkgname"
license=(GPL3)
depends=(jq)
makedepends=(go
             scdoc)
_archive="$pkgname-v$pkgver"
source=("$_archive.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('77a50e3de7d640b8d4ce8f6fe98275251b9d34f9dda06a0d36be63060171bd27')

prepare(){
	cd "$_archive"
	export GOPATH="$srcdir"
	go mod download
}

build() {
	cd "$_archive"
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
	cd "$_archive"
	export GOPATH="$srcdir"
	go test ./...
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/man/man1/" "$pkgname.1"
}
