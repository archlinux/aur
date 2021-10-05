# Maintainer: Bhanupong Petchlert <bpetlert@gmail.com>
pkgname=aur-thumbsup
pkgver=0.3.2
pkgrel=1
pkgdesc="A tool to manage voting for favorite AUR packages (including systemd service for auto vote)"
arch=('x86_64')
url="https://github.com/bpetlert/aur-thumbsup"
license=('MIT')
depends=('gawk' 'grep' 'pacman' 'systemd')
makedepends=(cargo)
provides=("${pkgname}")
conflicts=("${pkgname}")

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bpetlert/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('47626e58382d0df50d1c494a34880f0bca58f9bc415bdf4ea5bbea9e4f005708')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build  --frozen --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/aur-thumbsup" "$pkgdir/usr/bin/aur-thumbsup"

  install -Dm644 "aur-thumbsup.service" "$pkgdir/usr/lib/systemd/system/aur-thumbsup.service"
  install -Dm644 "aur-thumbsup.timer" "$pkgdir/usr/lib/systemd/system/aur-thumbsup.timer"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
