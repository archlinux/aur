# Maintainer: zandemax <hi@zdmx.me>
pkgname=prometheus-postfix-exporter
pkgver=0.3.0
pkgrel=1
pkgdesc='Prometheus exporter for Postfix metrics'
arch=('x86_64')
url="https://github.com/kumina/postfix_exporter"
license=('Apache')
makedepends=('go' 'systemd')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz" "prometheus-postfix-exporter.service")
sha256sums=('a0d45f3615d6f24b5532d4048fbb08a248588cac7587279aef1473b6e50b6157'
            '5a7b37fd4a67ea28ccd27f96fda2fd2063bc92214dcf21bc92746566cf301bb8')
options=('strip')

prepare(){
  cd "postfix_exporter-$pkgver"
  mkdir -p build/
}

build() {
  cd "postfix_exporter-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build .
}

check() {
  cd "postfix_exporter-$pkgver"
  go test ./...
}

package() {
  cd "postfix_exporter-$pkgver"
  install -Dm755 build/postfix_exporter "$pkgdir"/usr/bin/$pkgname
  install -Dm644 ../prometheus-postfix-exporter.service "$pkgdir"/usr/lib/systemd/system/prometheus-postfix-exporter.service
}

