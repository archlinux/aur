# Maintainer: Vincent Wang <wzh20070720@outlook.com>

pkgname=flexconnect-git
pkgver=2.0.2.r0.g9822e6e
pkgrel=1
pkgdesc="Flexible cross-platform AnyConnect client (git)"
arch=('x86_64' 'aarch64')
url="https://github.com/nanakusa-electronics/FlexConnect"
license=('custom:Proprietary')
depends=('systemd' 'gtk3' 'libayatana-appindicator' 'libnotify')
makedepends=('go' 'git' 'pkgconf')
provides=('flexconnect')
conflicts=('flexconnect')
source=('git+https://github.com/nanakusa-electronics/FlexConnect.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/FlexConnect"
  git describe --long --tags --abbrev=7 | sed 's/^v//; s/-/.r/; s/-/./'
}

build() {
  cd "$srcdir/FlexConnect"
  export CGO_ENABLED=1
  export GOFLAGS="-buildvcs=false"
  local ver
  ver=$(git describe --tags --abbrev=0 | sed 's/^v//')
  local ldflags="-s -w -X=flexconnect/internal/buildinfo.Version=$ver"

  go build -trimpath -ldflags="$ldflags" -o flexconnect ./cmd/flexconnect
  go build -trimpath -ldflags="$ldflags" -o flexconnectd ./cmd/flexconnectd
  go build -trimpath -ldflags="$ldflags" -o flextray ./cmd/flextray

  sed -i "s|/usr/sbin/flexconnectd|/usr/bin/flexconnectd|g" scripts/systemd/flexconnectd.service
}

package() {
  cd "$srcdir/FlexConnect"

  install -Dm755 flexconnect "$pkgdir/usr/bin/flexconnect"
  install -Dm755 flexconnectd "$pkgdir/usr/bin/flexconnectd"
  install -Dm755 flextray "$pkgdir/usr/bin/flextray"
  install -Dm644 scripts/systemd/flexconnectd.service "$pkgdir/usr/lib/systemd/system/flexconnectd.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "assets/icons/app-256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/flexconnect.png"
  install -Dm644 "release/dist/unixpkgs/files/flexconnect.desktop" "$pkgdir/usr/share/applications/flexconnect.desktop"
  install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/flexconnect.conf" <<< "g flexconnect - -"
}
