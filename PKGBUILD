# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=nancy
pkgver=1.0.28
pkgrel=1
pkgdesc="Checks for vulnerabilities in Golang dependencies"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/sonatype-nexus-community/nancy"
license=('Apache')
depends=('glibc')
makedepends=('go')
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('34522beb36a5f9250f2a7149baeca2452a0cd4defe629a996e3b3eeacbf6d6d9')

prepare() {
	cd "$pkgname-$pkgver"
	mkdir -p build
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

# check() {
# 	cd "$pkgname-$pkgver"
# 	go test ./...
# }

package() {
	cd "$pkgname-$pkgver"
	install -D build/nancy -t "$pkgdir/usr/bin/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
