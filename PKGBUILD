# Maintainer: Bhanupong Petchlert <bpetlert@gmail.com>
pkgname=pacman-mirrorup
pkgver=0.10.0
pkgrel=1
pkgdesc="A program to retrieve the best and latest Pacman mirror list based on user's geography"
arch=('x86_64')
url="https://github.com/bpetlert/pacman-mirrorup"
license=('GPL-3.0-or-later')
depends=()
makedepends=(cargo)
options=(!lto)
provides=("${pkgname}")
conflicts=("${pkgname}")

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bpetlert/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('3a560821d21f14b232fe623e47a839fcf92e25e0f5c04f8ac6a58ef83a10ea71')

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
  install -Dm755 "target/release/pacman-mirrorup" "$pkgdir/usr/bin/pacman-mirrorup"

  install -Dm644 "pacman-mirrorup.service" "$pkgdir/usr/lib/systemd/system/pacman-mirrorup.service"
  install -Dm644 "pacman-mirrorup.timer" "$pkgdir/usr/lib/systemd/system/pacman-mirrorup.timer"

  install -Dm644 "README.adoc" "$pkgdir/usr/share/doc/${pkgname}/README.adoc"
  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/${pkgname}/COPYING"
}
