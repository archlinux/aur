# Maintainer: tarball <bootctl@gmail.com>

pkgname=netbird-ui
pkgver=0.26.1
pkgrel=1
pkgdesc='Official GUI for the Netbird client'
url='https://netbird.io'
arch=(i686 pentium4 x86_64 arm armv7h armv6h aarch64 riscv64)
license=(BSD)

depends=(netbird gtk3 libayatana-appindicator)
makedepends=('go>=1.20')

source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/netbirdio/netbird/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('acd637d4f26af55ebd3a1b37e3d2853b5ebd38d763f37630a3988ad7f4505c7c')

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
  cd "$srcdir/netbird-$pkgver"

  install -Dm755 build/$pkgname \
    "$pkgdir/usr/bin/$pkgname"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd client/ui

  install -Dm644 netbird.desktop \
    "$pkgdir/usr/share/applications/netbird.desktop"

  install -Dm644 netbird.ico \
    "$pkgdir/usr/share/icons/netbird.ico"
}
