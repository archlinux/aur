# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
pkgname=rpc-gateway-git
pkgver=0.0.1.r11.7fd64ab
pkgrel=1
pkgdesc="RPC gateway with automatic failover, load balancing, and request routing capabilities"
arch=('x86_64' 'aarch64')
url="https://github.com/kewlfft/rpc-gateway"
license=('MIT')
makedepends=('go')
source=("$pkgname::git+https://github.com/kewlfft/rpc-gateway.git")
sha256sums=('SKIP')

pkgver() {
  printf "0.0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  export CGO_ENABLED=0
  export GOOS=linux
  
  # Set architecture-specific optimizations
  case "$CARCH" in
    x86_64)
      export GOARCH=amd64
      ;;
    aarch64)
      export GOARCH=arm64
      ;;
  esac
  
  go build -v -trimpath -ldflags="-s -w" -o rpcgateway main.go
}

package() {
  cd "$pkgname"
  install -Dm755 rpcgateway "$pkgdir/usr/bin/rpcgateway"
  install -Dm644 example_config.yml "$pkgdir/etc/rpc-gateway/config.yml.example"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # Install systemd service template
  install -Dm644 contrib/systemd/rpcgateway.service "$pkgdir/usr/lib/systemd/system/rpcgateway@.service"
  
  # Create default instance
  install -dm755 "$pkgdir/etc/systemd/system"
  ln -s /usr/lib/systemd/system/rpcgateway@.service "$pkgdir/etc/systemd/system/rpcgateway.service"
}
