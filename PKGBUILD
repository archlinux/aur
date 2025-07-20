# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
pkgname=rpc-gateway-git
pkgver=0.4.0.r576.dc52f20
pkgrel=1
pkgdesc="RPC gateway with automatic failover, load balancing, and request routing capabilities"
arch=('x86_64' 'aarch64')
url="https://github.com/kewlfft/rpc-gateway"
license=('MIT')
makedepends=('go' 'git')
source=("$pkgname::git+https://github.com/kewlfft/rpc-gateway.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  # Extract version from Makefile
  local version=$(grep '^VERSION=' Makefile | cut -d'=' -f2)
  # Get git commit count and short hash
  local commit_count=$(git rev-list --count HEAD)
  local commit_hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.%s" "$version" "$commit_count" "$commit_hash"
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
  
  make build
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
