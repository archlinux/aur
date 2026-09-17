# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=devbox
pkgver=0.18.3
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
sha256sums=('4f4e1d62a6ae52a04f1bf967f4731457ee9bc7fa29a6959b85c9b36bb495959c')

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
