# Maintainer: Daniar Mannanov <daniar@dev.tatar>
pkgname=internetometer-exporter
pkgver=0.1.0
pkgrel=1
pkgdesc="Prometheus exporter for Yandex Internetometer"
arch=('x86_64' 'aarch64')
url="https://github.com/Master290/internetometer-cli"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("internetometer-cli-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        "internetometer-exporter.service")
sha256sums=('2f7888956d8a74a7178dd5b24656c2175e417e152dc31f7264168beb1d981433'
            '6e9e898218a66cb1aca02cfa08ea5b82573514367095432ba1a4fc556f17f112')

prepare() {
  cd "internetometer-cli-$pkgver"
  mkdir -p build
}

build() {
  cd "internetometer-cli-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  
  go build -o build/internetometer-exporter ./cmd/prom/exporter.go
}

package() {
  cd "internetometer-cli-$pkgver"
  install -Dm755 build/internetometer-exporter "$pkgdir/usr/bin/internetometer-exporter"
  install -Dm644 "../internetometer-exporter.service" "$pkgdir/usr/lib/systemd/system/internetometer-exporter.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
