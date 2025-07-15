# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Brody <archfan at brodix dot de>

pkgname=netbird-ui
pkgver=0.51.0
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
sha256sums=('c82af71b14da0d57e9bcbb5ad33f0cd6964761bb1173028a1c4920a65d5b1117')

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

  install -Dm644 build/netbird.desktop \
    "$pkgdir/usr/share/applications/netbird.desktop"

  install -Dm644 assets/netbird.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/netbird.png"
}
