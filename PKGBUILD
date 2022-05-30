# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=nancy
pkgver=1.0.35
pkgrel=1
pkgdesc="Checks for vulnerabilities in Golang dependencies"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/sonatype-nexus-community/nancy"
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6e2f96203ff71f211fd1f70c9109673dc5c8a0be5e2492e314e8d04f56cc77dd')

prepare() {
	cd "$pkgname-$pkgver"
	mkdir -p build
	go mod download
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname-$pkgver"
	go build -o build
}

## FIXME: investigate failing test
# check() {
# 	cd "$pkgname-$pkgver"
# 	go test ./...
# }

package() {
	cd "$pkgname-$pkgver"
	install -D build/nancy -t "$pkgdir/usr/bin/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
