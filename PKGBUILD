# Maintainer: CupricReki

pkgname=lan-mouse-git
_pkgname=lan-mouse
pkgver=0.5.1.r0.g6c99f9bea3
pkgrel=1
pkgdesc="Software KVM Switch / mouse & keyboard sharing software for Local Area Networks"
url="https://github.com/feschber/lan-mouse"
license=("GPL-3.0-or-later")
arch=(any)
provides=("$_pkgname=${pkgver/\.r*/}")
conflicts=("$_pkgname")
source=("$_pkgname"::"git+https://github.com/ferdinandschober/$_pkgname.git")
sha256sums=("SKIP")
depends=(libadwaita gtk4 libx11 libxtst)
makedepends=(cargo rust)

pkgver() {
  cd "$_pkgname"
  git describe --abbrev=10 --long --tags --match 'v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$_pkgname"

  # desktop-file-install -m 644 --dir "$pkgdir/usr/share/applications/" "$_pkgname.desktop"

  install -Dm0644 -t "$pkgdir/usr/share/pixmaps" "resources/mouse-icon.svg"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
}
