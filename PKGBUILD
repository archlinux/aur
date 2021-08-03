# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=flarectl
_pkgname=cloudflare-go
pkgver=0.20.0
pkgrel=1
pkgdesc='CLI application for interacting with a Cloudflare account'
arch=('x86_64')
url="https://github.com/cloudflare/cloudflare-go/tree/v${pkgver}/cmd/flarectl"
license=('BSD')
makedepends=('go')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/cloudflare/$_pkgname/archive/v$pkgver.tar.gz")
b2sums=(be1c6d92869d1566e2d604b153f29bc2bb320599cbc81e8f07b285a80ec4e20f6257d6c4409c27bf514a35bead0ebef287c2c16e3b80cdb33d887177de5267e0)

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
