# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=flarectl
_pkgname=cloudflare-go
pkgver=0.19.0
pkgrel=1
pkgdesc='CLI application for interacting with a Cloudflare account'
arch=('x86_64')
url="https://github.com/cloudflare/cloudflare-go/tree/v${pkgver}/cmd/flarectl"
license=('BSD')
makedepends=('go')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/cloudflare/$_pkgname/archive/v$pkgver.tar.gz")
b2sums=(c2abbd4dec6fbf70bfd05240271add730e6889930bc0b746089df8f693df3c40bca507827f34bb5347c88b20a361ab6d33738a767291f3a2c68b6025bb9ae7f6)

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
