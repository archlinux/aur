# Maintainer: TheWhyteWolf <lordwhyte at gmail dot com>
pkgname=minerva-fm
pkgver=0.1.0
pkgrel=1
pkgdesc="Retro video game music radio for your terminal (SPC, VGM, NSF, MOD, and more)"
arch=('x86_64' 'aarch64')
url="https://github.com/TheWhyteWolf/MiNERVA-FM-Term"
license=('MIT' 'LGPL-2.1-or-later' 'GPL-2.0-or-later')
depends=('gcc-libs' 'alsa-lib' 'libopenmpt' 'libsidplayfp')
makedepends=('cargo')
# makepkg's -flto=auto puts GCC LTO bytecode in the vendored C++ static lib,
# which the Rust linker cannot read; Rust-side LTO still applies via Cargo.
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
# Regenerate after tagging: updpkgsums && makepkg --printsrcinfo > .SRCINFO
sha256sums=('b12eaf8c16288d06e71d54313cb5bea010b4d73d3bafc84844cad4d089d15ac8')

prepare() {
  cd "MiNERVA-FM-Term-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "MiNERVA-FM-Term-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "MiNERVA-FM-Term-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  cd "MiNERVA-FM-Term-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 LICENSES/GME-license.txt \
    "$pkgdir/usr/share/licenses/$pkgname/GME-license.txt"
  install -Dm644 LICENSES/emu2413-LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/emu2413-LICENSE.txt"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
