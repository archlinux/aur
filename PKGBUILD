# Maintainer: willemw <willemw12@gmail.com>

pkgname=btrfs-backup-git
pkgver=0.2.1.r13.gea71710
pkgrel=1
pkgdesc='Backup and restore Btrfs subvolumes'
arch=(x86_64)
url=https://github.com/d-e-s-o/btrfs-backup
license=(GPL-3.0-or-later)
makedepends=(cargo git)
depends=(btrfs-progs)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd $pkgname
  cargo update
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cd $pkgname
  cargo build --frozen --release --all-features
}

#check() {
#  export RUSTUP_TOOLCHAIN=stable
#  cd $pkgname
#  cargo test --frozen --all-features
#}

package() {
  install -Dm755 "$pkgname/target/release/${pkgname%-git}" -t "$pkgdir/usr/bin"
}
