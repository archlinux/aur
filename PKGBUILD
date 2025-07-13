# Maintainer: Miawgogo <aur@miawgogo.me>

pkgname=dnsinspector-dnsproxy
pkgver=1.1.2
pkgrel=1
pkgdesc='A Proxy server for DNS over HTTP, TLS, and QUIC'
arch=('any')
url="https://github.com/dns-inspector/dnsproxy"
license=('GPL-3.0-or-later')
install=$pkgname.install
conflicts=('dnsproxy')
makedepends=('go')
source=(
  "https://github.com/dns-inspector/dnsproxy/archive/refs/tags/${pkgver}.tar.gz"
  dnsinspector-dnsproxy.service
  dnsinspector-dnsproxy.sysusers
)
sha256sums=(
  '4153d67a06b08f6760ec29fa6dd8514a8b3d80b3ad34826a70579b27b86e3301'
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
