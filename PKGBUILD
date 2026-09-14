# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=devbox
pkgver=0.18.1
pkgrel=1
pkgdesc='A cli tool to easily create isolated shells and containers'
arch=(x86_64)
url="https://github.com/jetpack-io/$pkgname"
license=(Apache-2.0)
depends=(nix)
makedepends=(go)
optdepends=('docker: for container support')
_archive="$pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('f77fa3a110db0a51b9db595e0877af31e27d90d8225f802a63c784c0c942ae74')

prepare(){
	cd "$_archive"
	export GOPATH="$srcdir"
	go mod download
}

build() {
	cd "$_archive"
	export GOPATH="$srcdir"
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
	# go test ./boxcli
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname"
}
