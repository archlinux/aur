# Maintainer: Benjamin Plotke <benplotke@gmail.com>
pkgname=rsds-w
_name=rsds
pkgver=0.1.0
pkgrel=1
pkgdesc="Reasonably Sane Display Settings: monitor layout manager and TUI for Wayland compositors"
arch=('x86_64' 'aarch64')
url="https://github.com/benplotke/rsds"
license=('MIT')
depends=('dbus' 'gcc-libs' 'glibc')
makedepends=('cargo')
provides=('rsds')
conflicts=('rsds-x')
options=('!lto')
install=rsds-w.install
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9809faa0b7a0a5773819c10fb6af681a90a6cf1f5fda488b7b114ab58d788264')

prepare() {
  cd "$_name-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_name-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p $pkgname
}

check() {
  cd "$_name-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen -p $pkgname -p rsds-wayland -p rsds-core -p rsds-tui -p rsds-daemon
}

package() {
  cd "$_name-$pkgver"
  install -Dm755 target/release/rsds target/release/rsds-daemon -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md KEYBINDINGS.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
