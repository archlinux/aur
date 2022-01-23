# Maintainer: Gyro7 <gyro@sach1.tk>
# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=mangodl
pkgver=1.6
pkgrel=1
pkgdesc="CLI tool for downloading manga"
arch=('x86_64')
url="https://github.com/Gyro7/mangodl"
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/mangodl-v$pkgver-linux.tar.gz")
sha256sums=('23bac458e5858d69ecff7032d8e0b73e81ed4adcace52968cebadbfdf28604e3')

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
	go build -o build/mangodl
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
