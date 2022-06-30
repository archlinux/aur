# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ijq
pkgver=0.4.0
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
sha256sums=('4f3ab8473c2d4675e87260025ca544b26758f0f5bac06d060fbbf7ba592a0a08')

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
