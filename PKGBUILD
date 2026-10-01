# Maintainer: Francisco Martín Vélez Manrique <francisco446742@gmail.com>
#
# Builds a pinned GitHub release archive for the AUR.
#
# The installed binary remains `nsticky`, so this package replaces upstream
# nsticky without changing its command, configuration, socket or systemd unit.

pkgname=better-nsticky
pkgver=0.5.0
pkgrel=1
pkgdesc="Sticky and staged window management for the niri Wayland compositor (drop-in nsticky)"
arch=('x86_64')
url="https://github.com/fram446742/better-nsticky"
license=('BSD-3-Clause')
depends=('glibc')
optdepends=('vicinae: recommended selector for `nsticky stage restore`')
makedepends=('cargo')
provides=('nsticky')
conflicts=('nsticky')
options=('!lto') # the release profile already enables LTO
source=("$pkgname-$pkgver.tar.gz::https://github.com/fram446742/better-nsticky/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0eec1defd9ba2d4c82ea6195e7fddcf9bb8b7f70a3038e878cd2c7f6959b3693')

build() {
  cd "$pkgname-$pkgver"
  # `--locked` keeps the dependency versions from Cargo.lock.
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/nsticky "$pkgdir/usr/bin/nsticky"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  # The README links to it, so the installed copy is readable too.
  install -Dm644 assets/vicinae.png "$pkgdir/usr/share/doc/$pkgname/assets/vicinae.png"
}
