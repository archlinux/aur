# Maintainer: Daniar Mannanov <daniar@dev.tatar>
pkgname=internetometer-cli
pkgver=0.1.0
pkgrel=1
pkgdesc="Unofficial CLI for Yandex Internetometer (speed test)"
arch=('x86_64' 'aarch64')
url="https://github.com/Master290/internetometer-cli"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2f7888956d8a74a7178dd5b24656c2175e417e152dc31f7264168beb1d981433')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p build
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  
  go build -o build/internetometer ./cmd/cli/main.go
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/internetometer "$pkgdir/usr/bin/internetometer"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
