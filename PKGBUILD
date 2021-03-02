# Maintainer: Brad Erhart <brae dot 04 plus aur at gmail dot com>

pkgname=flarectl
_pkgname=cloudflare-go
pkgver=0.13.8
pkgrel=3
pkgdesc='CLI application for interacting with a Cloudflare account'
arch=('x86_64')
url="https://github.com/cloudflare/cloudflare-go/tree/v${pkgver}/cmd/flarectl"
license=('BSD')
makedepends=('go')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/cloudflare/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=(a9b599b1bcb190e75c294cc96fe8b476c88dae06f3aad046a388e0c15ab8e149)

prepare() {
	cd "$_pkgname-$pkgver"
	mkdir --parents 'build'
}

build() {
	cd "$_pkgname-$pkgver"
	export \
		CGO_CPPFLAGS="${CPPFLAGS}" \
		CGO_CFLAGS="${CFLAGS}" \
		CGO_CXXFLAGS="${CXXFLAGS}" \
		CGO_LDFLAGS="${LDFLAGS}" \
		GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go get -d github.com/cloudflare/cloudflare-go \
	&& go build -o build "./cmd/$pkgname"
}

package() {
	install -Dm 755 "$_pkgname-$pkgver/build/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
