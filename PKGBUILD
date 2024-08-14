# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ijq
pkgver=1.1.2
pkgrel=1
pkgdesc='Interactive jq tool, like jqplay for the commandline'
arch=(x86_64)
url="https://git.sr.ht/~gpanders/$pkgname"
license=(GPL-3.0-only)
depends=(jq)
makedepends=(go
             scdoc)
_archive="$pkgname-v$pkgver"
source=("$_archive.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('dd5055e7a740c54a32043b744f061b1a00a4d2f97f6c6214c2109fd22491b9f3')

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
