# Maintainer: Vincent Wang <wzh20070720@outlook.com>

pkgname=flexconnect
pkgver=1.3.2
pkgrel=1
pkgdesc="Flexible cross-platform AnyConnect client"
arch=('x86_64' 'aarch64')
url="https://github.com/2018wzh/FlexConnect"
license=('MIT')
depends=('systemd' 'gtk3' 'libayatana-appindicator' 'libnotify')
makedepends=('go' 'git' 'pkgconf')
conflicts=('flexconnect-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/2018wzh/FlexConnect/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1fcd93ee5fce9805cba17274250f54dff0f27592e188f94cceaf3bfe48d38b6a')

build() {
  cd "$srcdir/FlexConnect-$pkgver"
  export CGO_ENABLED=1
  export GOFLAGS="-buildvcs=false"
  local ldflags="-s -w -X=flexconnect/internal/buildinfo.Version=$pkgver"

  go build -trimpath -ldflags="$ldflags" -o flexconnect ./cmd/flexconnect
  go build -trimpath -ldflags="$ldflags" -o flexconnectd ./cmd/flexconnectd
  go build -trimpath -ldflags="$ldflags" -o flextray ./cmd/flextray

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
  install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/flexconnect.conf" <<< "g flexconnect - -"
}
