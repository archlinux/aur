# Maintainer: Tiago Correia
#
# AUR package built from the source of the release tag. scripts/aur.sh fills
# in pkgver and the checksum and writes .SRCINFO; see docs/RELEASE.md.
pkgname=ratclone
pkgver=0.1.1
pkgrel=1
pkgdesc="A keyboard-driven terminal UI for rclone"
arch=('x86_64' 'aarch64')
url="https://github.com/SyscallBrain/ratclone"
license=('MIT')
depends=('glibc' 'libgcc' 'rclone')
optdepends=('ttf-nerd-fonts-symbols: icons (or set icons = "ascii")')
makedepends=('cargo')
# The release build has no debug info: a -debug package would be empty.
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('bd3bcd69d86bcdd7ff9751e08cc1dc86927d100afb2bee357de93ccc3d8f1a39')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release --lib
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/ratclone "$pkgdir/usr/bin/ratclone"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
