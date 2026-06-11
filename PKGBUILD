# Maintainer: sandwich <sandwich@archworks.co>

pkgname=netbird-proxy
pkgver=0.72.3
pkgrel=1
pkgdesc='WireGuard-based overlay network: reverse proxy service'
arch=(x86_64 aarch64 armv7h armv6h)
url='https://github.com/netbirdio/netbird'
license=('AGPL-3.0-only')
makedepends=('go')
depends=(glibc ca-certificates)
backup=(etc/netbird-proxy/proxy.env)
install=netbird-proxy.install
source=(
  "netbird-$pkgver.tar.gz::https://github.com/netbirdio/netbird/archive/refs/tags/v${pkgver}.tar.gz"
  "netbird-proxy.service"
  "proxy.env"
)
sha256sums=('e93b1af632059ac5218ee16b97672fc4dd5980510d6d853049767c7bacadcdea'
            '912d342970f04c169ca2f832a4080cd0206b8721c54d11f35ade4b7b96e38a43'
            '5292c2354ab73a0b326649a2a592115546de0468ecaf046d47d9f3aa21252ce2')

prepare() {
  cd "netbird-$pkgver"
  mkdir -p build

  # Fix for Go 1.26 gvisor compatibility
  local old new
  old=gvisor.dev/gvisor@v0.0.0-20251031020517-ecfcdd2f171c
  new=gvisor.dev/gvisor@v0.0.0-20260219192049-0f2374377e89
  go mod edit -replace $old=$new
  go mod tidy

  go mod download -x
}

build() {
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  cd "netbird-$pkgver"
  go build \
    -o build/netbird-proxy \
    -ldflags "-s -w -linkmode=external \
      -X github.com/netbirdio/netbird/version.version=$pkgver \
      -extldflags \"$LDFLAGS\"" \
    ./proxy/cmd/proxy/
}

check() {
  [[ "$("netbird-$pkgver/build/netbird-proxy" --version 2>&1)" == *"$pkgver"* ]] || true
}

package() {
  install -Dm755 "netbird-$pkgver/build/netbird-proxy" "$pkgdir/usr/bin/netbird-proxy"
  install -Dm644 netbird-proxy.service -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm640 proxy.env "$pkgdir/etc/netbird-proxy/proxy.env"
  install -Dm644 "netbird-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "netbird-$pkgver/proxy/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.proxy"
}
