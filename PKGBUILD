# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
pkgname=lpc55
pkgver=0.2.1
pkgrel=1
pkgdesc='NXP LPC55 host-side utilities'
arch=('x86_64')
url="https://github.com/lpc55/lpc55-host"
license=(Apache MIT)
# we only need `libudev.so`, during build we also need `pkgconfig/udev/.pc`
depends=(systemd-libs)
# note we do not need Arch `hidapi` package here, it's a git submodule of Rust hidapi
makedepends=(cargo git systemd)
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/lpc55/lpc55-host/archive/refs/tags/${pkgver}.tar.gz"
	"70-raw-lpc55-mcuboot.rules"
)
sha256sums=(
    "4342ddfa569af9d14a6066d3481c0d1c76f2c64329f2d7f925127b0b75507c57"
    "4175fee2145e3e085d2cbf2b67ec3c8ec7fb641a08b97fb65da1bd5cf52d4f88"
)

build() {
  cd "${pkgname}-host-${pkgver}"
  cargo build --release
}

check() {
  cd "${pkgname}-host-${pkgver}"
  # make sure shared libs work
  target/release/lpc55 --version
  # Currently, tests assume a device is accessible
  # cargo test --release
}

package() {
  pkgnamefull="${pkgname}-host-${pkgver}"
  install -Dm755 "$pkgnamefull/target/release/lpc55" "$pkgdir/usr/bin/lpc55"
  install -Dm644 "$pkgnamefull/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgnamefull/LICENSE-MIT"

  # completions
  install -Dm644 $pkgnamefull/target/release/_lpc55 -t $pkgdir/usr/share/zsh/site-functions
  install -Dm644 $pkgnamefull/target/release/lpc55.bash $pkgdir/usr/share/bash-completion/completions/lpc55

  # udev rule
  install -Dm644 70-raw-lpc55-mcuboot.rules -t $pkgdir/usr/lib/udev/rules.d
}
