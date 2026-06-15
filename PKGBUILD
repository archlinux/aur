# Maintainer: Vincent Wang <wzh20070720@outlook.com>

pkgname=flexconnect
pkgver=1.0.3
pkgrel=1
pkgdesc="Flexible cross-platform AnyConnect client"
arch=('x86_64' 'aarch64')
url="https://github.com/2018wzh/FlexConnect"
license=('MIT')
depends=('systemd' 'gtk3' 'libayatana-appindicator' 'libnotify')
makedepends=('go' 'git' 'pkgconf')
conflicts=('flexconnect-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/2018wzh/FlexConnect/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e03a065be2f9f310d3ee06a46a2649fdfdca7e351e27f0f132e69c3481d7d5a5')

build() {
  cd "$srcdir/FlexConnect-$pkgver"
  export CGO_ENABLED=1
  export GOFLAGS="-buildvcs=false"

  go build -trimpath -ldflags="-s -w" -o flexconnect ./cmd/flexconnect
  go build -trimpath -ldflags="-s -w" -o flexconnectd ./cmd/flexconnectd
  go build -trimpath -ldflags="-s -w" -o flextray ./cmd/flextray

  sed -i "s|/usr/sbin/flexconnectd|/usr/bin/flexconnectd|g" scripts/systemd/flexconnectd.service
}

package() {
  cd "$srcdir/FlexConnect-$pkgver"

  install -Dm755 flexconnect "$pkgdir/usr/bin/flexconnect"
  install -Dm755 flexconnectd "$pkgdir/usr/bin/flexconnectd"
  install -Dm755 flextray "$pkgdir/usr/bin/flextray"
  install -Dm644 scripts/systemd/flexconnectd.service "$pkgdir/usr/lib/systemd/system/flexconnectd.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "assets/icons/app-256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/flexconnect.png"
  install -Dm644 "release/dist/unixpkgs/files/flexconnect.desktop" "$pkgdir/usr/share/applications/flexconnect.desktop"
}
