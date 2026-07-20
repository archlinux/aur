# Maintainer: Akusen <akudesyn@gmail.com>
pkgname=sinestesia
pkgver=0.1.0
pkgrel=1
pkgdesc="Audio visualizer for Linux with effects and system theming (Rust + GTK4)"
arch=('x86_64')
url="https://github.com/AkusenArcade/Sinestesia"
license=('MIT')
depends=('gtk4' 'libadwaita' 'pipewire' 'libepoxy' 'hicolor-icon-theme')
makedepends=('cargo')
# Lo shim C del crate libspa, con l'LTO di makepkg, produce bytecode GCC
# che rust-lld non risolve (simboli spa_format_*_libspa_rs) -> LTO off.
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f5d78fd5ba693e88cd496139137a7d9ec98435a74c7276cf9d15205913e3fd50')

prepare() {
  cd "Sinestesia-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "Sinestesia-$pkgver"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "Sinestesia-$pkgver"
  install -Dm755 "target/release/sinestesia"     "$pkgdir/usr/bin/sinestesia"
  install -Dm644 "dev.akusen.sinestesia.desktop" "$pkgdir/usr/share/applications/dev.akusen.sinestesia.desktop"
  install -Dm644 "assets/sinestesia.svg"         "$pkgdir/usr/share/icons/hicolor/scalable/apps/dev.akusen.sinestesia.svg"
  install -Dm644 "LICENSE"                        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
