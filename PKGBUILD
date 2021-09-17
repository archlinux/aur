# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=flarectl
_pkgname=cloudflare-go
pkgver=0.23.0
pkgrel=1
pkgdesc='CLI application for interacting with a Cloudflare account'
arch=('x86_64')
url="https://github.com/cloudflare/cloudflare-go/tree/v${pkgver}/cmd/flarectl"
license=('BSD')
makedepends=('go')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/cloudflare/$_pkgname/archive/v$pkgver.tar.gz")
b2sums=(ca810d997a2a6329160e3072907c40eb3753977bf295383beabbfed76987d649ebdc6b69a9b9f0d6a10762c3cc9bf2002ab4087b7aeb977ae8ca5d018aadfc74)

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
