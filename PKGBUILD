# Maintainer: Aurel Canciu <aurelcanciu@gmail.com>

pkgname=flux-cli
pkgver=0.4.2
pkgrel=1
pkgdesc="Open and extensible continuous delivery solution for Kubernetes."
url="https://fluxcd.io/"
arch=("x86_64" "armv6h" "armv7h" "aarch64")
license=("APACHE")
depends=("glibc")
makedepends=("go")
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/fluxcd/flux2/archive/v$pkgver.tar.gz"
)
sha512sums=(
  "d206df2e18f107fb9c28067e01e07020d801758ec74181607c765ff6d078f8539293eedd248b137711b5e4486b63a3e2fa34be22123fd2b8258dee982af4f7ab"
)

build() {
  cd "flux2-$pkgver"
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -ldflags "-X main.VERSION=$pkgver" -o flux-bin ./cmd/flux
}

check() {
  cd "flux2-$pkgver"
  make test
}

package() {
  cd "flux2-$pkgver"
  install -Dm755 flux-bin "$pkgdir/usr/bin/flux"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
