# Maintainer: tarball <bootctl@gmail.com>

pkgname=netbird-ui
pkgver=0.27.4
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
sha256sums=('74dfc1df662cb188630dba4abfed1b95a733fd0d7b86cfdfda56a43862b8f256')

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
