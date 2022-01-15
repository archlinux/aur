# Maintainer: Gyro7 <gyro@sach1.tk>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=mangodl
pkgver=1.5
pkgrel=1
pkgdesc="CLI tool for downloading manga"
arch=('x86_64')
url="https://github.com/Gyro7/mangodl"
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/mangodl-v$pkgver-linux.tar.gz")
sha256sums=('69d674c1ec171afd414022a242f52f19a82c0f78476c78f43d220311c47ede05')

prepare() {
	cd "$pkgname-mangodl-v$pkgver-linux"
	mkdir -p build
	go mod tidy
}

build() {
	export CGO_LDFLAGS="${LDFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname-mangodl-v$pkgver-linux"
	go build -o build
}

check() {
	cd "$pkgname-mangodl-v$pkgver-linux"
	go test ./...
}

package() {
	cd "$pkgname-mangodl-v$pkgver-linux"
	install -D build/mangodl -t "$pkgdir/usr/bin/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
