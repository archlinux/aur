# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=flarectl
_pkgname=cloudflare-go
pkgver=0.21.0
pkgrel=1
pkgdesc='CLI application for interacting with a Cloudflare account'
arch=('x86_64')
url="https://github.com/cloudflare/cloudflare-go/tree/v${pkgver}/cmd/flarectl"
license=('BSD')
makedepends=('go')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/cloudflare/$_pkgname/archive/v$pkgver.tar.gz")
b2sums=(cf1df4a1485d93f0e740dba502f59f3cfcb93ac72fc4735aadeb68942b45fa3fdfaf4e93692a3cfd5aad699cd79dd7514540c53633292ba446df32c9397d2d7f)

prepare() {
	# https://wiki.archlinux.org/title/Go_package_guidelines

	# https://wiki.archlinux.org/title/Go_package_guidelines#Output_directory
	cd "$_pkgname-$pkgver"
	mkdir --parents 'build'
}

build() {
	# https://wiki.archlinux.org/title/Go_package_guidelines#Sample_PKGBUILD
	cd "$_pkgname-$pkgver"
	export \
		CGO_CPPFLAGS="${CPPFLAGS}" \
		CGO_CFLAGS="${CFLAGS}" \
		CGO_CXXFLAGS="${CXXFLAGS}" \
		CGO_LDFLAGS="${LDFLAGS}" \
		GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o build "./cmd/$pkgname"
}

package() {
	install -Dm 755 "$_pkgname-$pkgver/build/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
