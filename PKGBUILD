# Maintainer: rotko <hq@rotko.net>
pkgname=codjd
pkgver=0.2.0
pkgrel=1
pkgdesc="codj daemon - music player and keyboard DJ engine (decks, cue, beatgrids, Soulseek) over D-Bus"
arch=('x86_64' 'aarch64')
url="https://github.com/hitchho/codjd"
license=('GPL-3.0-or-later')
depends=('pipewire' 'alsa-lib' 'gcc-libs' 'glibc')
makedepends=('cargo' 'pkgconf' 'clang')
optdepends=('codj: the terminal UI')
# libspa-sys compiles a C shim; makepkg's -flto in CFLAGS turns it into bitcode rust-lld cannot link
# (undefined symbol: spa_format_parse_libspa_rs). The crate's release profile does its own LTO.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hitchho/codjd/archive/v$pkgver.tar.gz")
sha256sums=('056f07868a7da7e25b5c16fd5cd1c3dc02739807130e3f4b916ecb9c6a349b90')

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

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/codjd -t "$pkgdir/usr/bin/"
  install -Dm644 LICENCE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md DOCS.md config.example.toml -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 docs/*.md -t "$pkgdir/usr/share/doc/$pkgname/docs/"
}
