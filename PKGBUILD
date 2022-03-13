# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=httpit
pkgver=0.5.0
pkgrel=1
pkgdesc="Rapid HTTP(S) benchmark tool"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/gonetx/httpit"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1dcc896d9fa1088d182b14f20cee8393ecc5a271a75fa2abb866a5fd7da36126')

prepare() {
	cd "$pkgname-$pkgver"
	mkdir -p build
	go mod download
}

build() {
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "$pkgname-$pkgver"
  go build -o build
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -D build/httpit -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
