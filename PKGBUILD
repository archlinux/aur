# Maintainer: willemw <willemw12@gmail.com>

pkgname=btrfs-backup-git
pkgver=0.2.1.r0.g02aea34
pkgrel=2
pkgdesc='Backup and restore Btrfs subvolumes'
arch=(x86_64)
url=https://github.com/d-e-s-o/btrfs-backup
license=(GPL3)
makedepends=(cargo git)
depends=(btrfs-progs)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  #RUSTUP_TOOLCHAIN=stable cargo fetch --locked --manifest-path=$pkgname/Cargo.toml --target="$CARCH-unknown-linux-gnu"
  RUSTUP_TOOLCHAIN=stable cargo fetch --manifest-path=$pkgname/Cargo.toml --target="$CARCH-unknown-linux-gnu"
}

build() {
  RUSTUP_TOOLCHAIN=stable cargo build --release --manifest-path=$pkgname/Cargo.toml --target-dir=$pkgname/target --all-features
}

#check() {
#  RUSTUP_TOOLCHAIN=stable cargo test --release --manifest-path=$pkgname/Cargo.toml --target-dir=$pkgname/target
#}

package() {
  install -Dm755 "$pkgname/target/release/${pkgname%-git}" -t "$pkgdir/usr/bin"
}
