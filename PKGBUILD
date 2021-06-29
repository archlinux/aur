# Maintainer: tarball <bootctl@gmail.com>

pkgname=wiretrustee
pkgver=0.0.8
pkgrel=1
pkgdesc='Connect your devices into a single secure private WireGuard®-based mesh network'
url='https://wiretrustee.com'
arch=(x86_64 aarch64 armv7h armv7l armv6h)
license=(BSD)

provides=("$pkgname")
conflicts=("$pkgname")
depends=(glibc)
makedepends=(go)
optdepends=()

source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
  'config_readme'
  'environment'
  'wiretrustee@.service'
  'wiretrustee-signal.service'
)
sha256sums=(
  '4ab1b09337149a09cfbfeccee4a8172d43dfe61262419ec37678c6b33e558aa6'
  'e6e2bb1687510b9381202d95beb27b1bfbe30033f4f038e4bdde61e7a3f65f22'
  'c72c3f27ee2f2fbb232108781e38f41d7f04272d11a42f59938541ac591bd393'
  '672235231a73743878d77e94827c5aba326464dae63457f94cd51708ac84ba58'
  '79cae90dff3bb3177762b9d3a9c69e69ef79ced3dc3a85529ff5050bf17bcd85'
)

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build

  go mod download
}

build() {
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  cd "$srcdir/$pkgname-$pkgver"

  go build \
    -ldflags "-s -w -linkmode=external -extldflags \"$LDFLAGS\"" \
    -o build/ \
    .
}

package() {
  _source="$srcdir/$pkgname-$pkgver"

  # binary
  install -Dm755 "$_source/build/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # config directory
  install -Ddm755 -o root -g root "$pkgdir/etc/$pkgname"
  install -Dm644 "config_readme" "$pkgdir/etc/$pkgname/README"

  # environment file
  install -Dm644 environment "$pkgdir/etc/default/$pkgname"

  # systemd units
  for kind in @ -signal; do
    install -Dm644 "$pkgname$kind.service" \
      "$pkgdir/usr/lib/systemd/system/$pkgname$kind.service"
  done

  # license
  install -Dm644 "$_source/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
