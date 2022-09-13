# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=devbox
pkgver=0.0.4
pkgrel=1
pkgdesc='A cli tool to easily create isolated shells and containers'
arch=(x86_64)
url="https://github.com/jetpack-io/$pkgname"
license=(Apache)
depends=(docker
         nix)
makedepends=(go)
_archive="$pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('36c8df2c35cc73e314c799bd2220bfc46e3bd5afbc6a4b3879549300670b042d')

prepare(){
	cd "$_archive"
	export GOPATH="$srcdir"
	go mod download
}

build() {
	cd "$_archive"
	export GOPATH="$srcdir"
	export CGO_ENABLED=0
	local _prefix=go.jetpack.io/devbox/build
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-linkmode external -extldflags \"$LDFLAGS\" -X $_prefix.Version=$pkgver" \
		-o $pkgname cmd/devbox/main.go
}

check() {
	cd "$_archive"
	export GOPATH="$srcdir"
	go test ./boxcli
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname"
}
