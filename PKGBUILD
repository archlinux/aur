# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=herdr-workspace-manager
_srcname=herdr-plugin-workspace-manager
pkgver=0.6.0
pkgrel=1
pkgdesc="CLI for the herdr Workspace Manager plugin - declarative worktree layouts and gone-worktree cleanup"
arch=('x86_64')
url="https://github.com/razajamil/herdr-plugin-workspace-manager"
license=('MIT')
depends=('git' 'gcc-libs')
makedepends=('cargo')
optdepends=('herdr: plugin host for the layout side (install the plugin with: herdr plugin install razajamil/herdr-plugin-workspace-manager)')
source=("$_srcname-$pkgver.tar.gz::https://github.com/razajamil/$_srcname/archive/v$pkgver.tar.gz")
sha256sums=('a2cac489c79e765d9610d1558da36aff8ab99d85f8076e01c8fa8710e20c89f5')

prepare() {
  cd "$_srcname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_srcname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$_srcname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Unit tests only: the integration test talks to a live herdr server when
  # one is running (applies a layout to a real worktree) — unacceptable from
  # a build, and it needs `herdr wait`, which not every herdr version has.
  cargo test --frozen --bins
}

package() {
  cd "$_srcname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
