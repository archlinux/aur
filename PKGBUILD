# Maintainer: Miawgogo <aur@miawgogo.me>

pkgname=dnsinspector-dnsproxy
pkgver=1.1.0
pkgrel=1
pkgdesc='A Proxy server for DNS over HTTP, TLS, and QUIC'
arch=('any')
url="https://github.com/dns-inspector/dnsproxy"
license=('GPL')
install=$pkgname.install
conflicts=('dnsproxy')
makedepends=('go')
source=(
  "https://github.com/dns-inspector/dnsproxy/archive/refs/tags/${pkgver}.tar.gz"
  dnsinspector-dnsproxy.service
  dnsinspector-dnsproxy.sysusers
)
sha256sums=(
  '6ee2dafd17d66c48272c29749e88d750ebc1663df9f2b5c4f071c1228aabc2f9'
  'aa1881d1abaa0699a6e574e6711f28b7ba7fd2aa3e5e0322324af00a8ab079ae'
  '788d5d7d961cc16fa2d4b354b5759aed7909765712d776db109a8af1f07ec5b8'
)

prepare() {
  cd "dnsproxy-$pkgver"
  mkdir -p build/
}

build() {
  cd "dnsproxy-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./cmd/...
}

# check() {
#   cd "dnsproxy-$pkgver"
#   go test ./...
# }

package() {
  cd "dnsproxy-$pkgver"
  install -Dm644 ../$pkgname.sysusers "${pkgdir}"/usr/lib/sysusers.d/$pkgname.conf
  install -Dm755 build/dnsproxy "$pkgdir"/usr/bin/dnsproxy
  install -Dm755 ../$pkgname.service "$pkgdir"/usr/lib/systemd/system/dnsproxy.service
  install -Dm755 dnsproxy.conf "$pkgdir"/etc/dnsproxy/dnsproxy.conf.example
}
