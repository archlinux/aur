# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=log4jscanner
pkgver=0.2.0
pkgrel=1
pkgdesc="log4j vulnerability filesystem scanner for analyzing JAR files"
arch=('x86_64' 'aarch64')
url="https://github.com/google/log4jscanner"
license=('Apache')
depends=('glibc')
makedepends=('go')
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3a87567ea9a6a61dd044382588fc33e6ff1963a6e521b21fdc07638155229b2f')

prepare() {
	export GOPATH="$srcdir/gopath"
	cd "$pkgname-$pkgver"
	mkdir -p build
	go mod tidy
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

	cd "$pkgname-$pkgver"
	go build -o build -ldflags "-linkmode=external -extldflags=${LDFLAGS}"
}

check() {
	cd "$pkgname-$pkgver"
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -D "build/$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
