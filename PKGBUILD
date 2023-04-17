# Maintainer: tarball <bootctl@gmail.com>

pkgname=netbird-ui
pkgver=0.16.0
pkgrel=1
pkgdesc='Official GUI for the Netbird client'
url='https://netbird.io'
arch=(i686 pentium4 x86_64 arm armv7h armv6h aarch64 riscv64)
license=(BSD)

provides=($pkgname)
conflicts=($pkgname)
depends=(netbird gtk3 libayatana-appindicator)
makedepends=('go>=1.19')

source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/netbirdio/netbird/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('4df0b9f0a82f439630086e67d2d638f1bf2eaa2a6a34746cc4e81b79d2feddd8')

prepare() {
  cd "$srcdir/netbird-$pkgver"
  mkdir -p build
  go mod download
}

build() {
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  cd "$srcdir/netbird-$pkgver"

  go build \
    -ldflags "-s -w -linkmode=external -extldflags \"$LDFLAGS\"" \
    -o build/"$pkgname" \
    client/ui/client_ui.go
}

package() {
  _source="$srcdir/netbird-$pkgver"
  _ui="$_source/client/ui"

  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/applications"
  install -d "$pkgdir/usr/share/icons"
  install -d "$pkgdir/usr/share/mime/packages"

  install -Dm755 "$_source/build/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$_ui/netbird.desktop" "$pkgdir/usr/share/applications/netbird.desktop"

  install -Dm644 "$_ui/netbird.ico" "$pkgdir/usr/share/icons/netbird.ico"

  install -Dm644 "$_source/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
