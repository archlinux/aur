# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=flarectl
_pkgname=cloudflare-go
pkgver=0.25.0
pkgrel=1
pkgdesc='CLI application for interacting with a Cloudflare account'
arch=('x86_64')
url="https://github.com/cloudflare/cloudflare-go/tree/v${pkgver}/cmd/flarectl"
license=('BSD')
makedepends=('go')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/cloudflare/$_pkgname/archive/v$pkgver.tar.gz")
b2sums=(760144110ebfb183b632f91cca543a496d32d9a40b0c85bdb88e37e3a2d2cb10dddddfabde71799ef2403bf77598c151324eb3b6b0633d4355a259952b9efc0e)

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
