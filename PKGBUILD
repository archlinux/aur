# Maintainer: tarball <bootctl@gmail.com>

pkgname=netbird-ui
pkgver=0.28.9
pkgrel=1
pkgdesc='Official GUI for the Netbird client'
url='https://netbird.io'
arch=(i686 pentium4 x86_64 arm armv7h armv6h aarch64 riscv64)
license=(BSD-3-Clause)

depends=(
  at-spi2-core
  ayatana-ido
  cairo
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  harfbuzz
  libayatana-appindicator
  libayatana-indicator
  libdbusmenu-glib
  libglvnd
  libx11
  libxcursor
  libxi
  libxinerama
  libxrandr
  libxxf86vm
  netbird
  pango
  zlib
)
makedepends=(go)

source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/netbirdio/netbird/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('c3cc721330cbe8341665e982f8e7c77e0a37f0fedaee07f44fc78b5e200eb1c3')

prepare() {
  cd "$srcdir/netbird-$pkgver"
  mkdir -p build
  go mod download
}

build() {
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  cd "$srcdir/netbird-$pkgver/client/ui"

  go build \
    -ldflags "-s -w -linkmode=external -extldflags \"$LDFLAGS\"" \
    -o ../../build/"$pkgname"
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
