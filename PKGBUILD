# Maintainer: ERSocalypse <ERSocalypse at gmail dot com>
pkgname=hypr-dock
pkgver=1.2.1
pkgrel=2
options=('!debug')
pkgdesc="Interactive Dock Panel for Hyprland"
arch=('x86_64')
url="https://github.com/lotos-linux/hypr-dock"
license=('GPL3')
depends=('gtk3' 'gtk-layer-shell')
makedepends=('go' 'git' 'make')
provides=('hypr-dock' 'hypr-alttab')
conflicts=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/lotos-linux/hypr-dock/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a9090b5b616e348096e528637e616e1110ebf7764f20e3d03864bbf712e4b047')
install="${pkgname}.install"

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Set Go build flags according to Arch guidelines
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  # Build both binaries
  go build -v -o "bin/hypr-dock" -ldflags="-linkmode=external" ./cmd/hypr-dock
  go build -v -o "bin/hypr-alttab" -ldflags="-linkmode=external" ./cmd/hypr-alttab
}

check() {
  cd "$srcdir/hypr-dock-$pkgver"

  # Run tests if they exist
  go test ./cmd/...
}

package() {
  cd "$srcdir/hypr-dock-$pkgver"

  # Install binaries
  install -Dm755 "bin/hypr-dock" "$pkgdir/usr/bin/hypr-dock"
  install -Dm755 "bin/hypr-alttab" "$pkgdir/usr/bin/hypr-alttab"

  # Install configuration files
  install -d "$pkgdir/etc/hypr-dock"
  cp -r configs/default/* "$pkgdir/etc/hypr-dock/"

  # Install documentation and license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  # Install example configs for reference
  install -d "$pkgdir/usr/share/$pkgname/configs"
  cp -r configs/* "$pkgdir/usr/share/$pkgname/configs/"

  # Set proper permissions for config directory
  chmod 755 "$pkgdir/etc/hypr-dock"
  find "$pkgdir/etc/hypr-dock" -type f -exec chmod 644 {} \;
}
