# Maintainer: Demir Yerli <me@mrquantumoff.dev>

pkgname=winepipe
pkgver=1.0.1
pkgrel=1
pkgdesc="PipeWire-native ASIO driver for Wine (no JACK), with a COSMIC settings app"
arch=('x86_64')
url="https://github.com/mrquantumoff/winepipe"
license=('BSD-2-Clause')
depends=('wine' 'libpipewire' 'glibc' 'gcc-libs' 'libxkbcommon' 'libxkbcommon-x11' 'wayland' 'libx11')
makedepends=('rustup' 'mingw-w64-gcc')
# The PE DLLs are cross-built and must keep their Wine builtin marker;
# the Rust release profile already strips debuginfo.
options=('!strip' '!lto' '!debug')
install=winepipe.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('57d189a32a040a7e80781e49426a70a807552d36a1d73270a7bd705f85ac6e9b')

_rust_env() {
  # Private toolchain with the Windows targets, so the user's rustup setup
  # is left alone. (CARGO_HOME stays default: rustup's proxies live there
  # when rustup was installed with rustup-init.)
  export RUSTUP_HOME="$srcdir/rustup"
  export RUSTUP_TOOLCHAIN=stable
}

prepare() {
  cd "$pkgname-$pkgver"
  _rust_env
  rustup toolchain install stable --profile minimal \
    --target x86_64-pc-windows-gnu,i686-pc-windows-gnu
  cargo fetch --locked
}

build() {
  cd "$pkgname-$pkgver"
  _rust_env
  make all CARGOFLAGS="--locked --offline"
}

check() {
  cd "$pkgname-$pkgver"
  _rust_env
  cargo test --locked --offline --release -p winepipe-unix -p winepipe-settings
}

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="$pkgdir" PREFIX=/usr WINELIBDIR=/usr/lib/wine
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 docs/DESIGN.md "$pkgdir/usr/share/doc/$pkgname/DESIGN.md"
}
