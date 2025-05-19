# Maintainer: Ani Betts <anais@anaisbetts.org>

pkgname=tsidp-git
pkgver=r9080.d89aa2908
pkgrel=1
pkgdesc="Tailscale OIDC Identity Provider (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/tailscale/tailscale"
license=('BSD')
depends=('tailscale')
makepends=('go' 'git')
conflicts=('tsidp')
provides=('tsidp')
source=("git+https://github.com/tailscale/tailscale.git"
        "tsidp.service")
sha256sums=('SKIP'
            'SKIP')
options=('!lto')

pkgver() {
  cd "$srcdir/tailscale"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/tailscale"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  
  # Only build tsidp
  cd cmd/tsidp
  go build -v -o tsidp .
}

package() {
  cd "$srcdir/tailscale/cmd/tsidp"
  
  # Install binary
  install -Dm755 tsidp "$pkgdir/usr/bin/tsidp"
  
  # Install systemd service
  install -Dm644 "$srcdir/tsidp.service" "$pkgdir/usr/lib/systemd/system/tsidp.service"
  
  # Create data directory
  install -dm755 "$pkgdir/var/lib/tailscale/tsidp"
}