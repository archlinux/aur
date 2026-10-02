# Maintainer: Arkady Buryakov <arkady@buryakov.pro>
# pkgver and sha256sums are filled in by .github/workflows/release.yml on each release.
pkgname=katana-desktop
pkgver=1.0.0
pkgrel=1
pkgdesc="Unofficial desktop client for Nonograms Katana user puzzles"
arch=('x86_64' 'aarch64')
url="https://github.com/ArkadyBuryakov/katana-desktop"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'glib2' 'cairo' 'gdk-pixbuf2' 'libsoup3' 'gcc-libs' 'glibc')
makedepends=('cargo')
options=('!lto')  # makepkg's C LTO flags break ring's objects at link time
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('634a03bdaf056aed42760fab0a2d5eef7229ae7b263e7a30188f4ff2456c61e3')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  make install PREFIX=/usr DESTDIR="$pkgdir"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
