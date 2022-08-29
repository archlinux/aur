# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contrbutor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ergo
pkgver=0.7.1
pkgrel=2
pkgdesc="List of utilities for the daily developer workflow"
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/beatlabs/ergo'
license=('BSD')
depends=('glibc')
makedepends=('go')
install=ergo.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2c1a880a715695bbfd1adf28949b83ec7b7533a5e3acb0a72be8072eea307712')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p build/
	go mod tidy
	go generate ./...
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o build/ergo -ldflags "-linkmode=external -X main.version=$pkgver" ./cmd/cli
}

package() {
  cd "$pkgname-$pkgver"
  install -D "build/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 .ergo.yml.dist "$pkgdir/usr/share/$pkgname/config-template.yml"
}
