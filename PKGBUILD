# Maintainer: eeegoloauq <eeegoloauq@users.noreply.github.com>
# Source PKGBUILD published to the AUR. CI uses packaging/PKGBUILD
# instead (binary-only). Bump pkgver together with the workspace
# Cargo.toml, update sha256sums, regenerate .SRCINFO.
pkgname=stashee
pkgver=0.1.13
pkgrel=1
pkgdesc="Glass-styled tiling terminal workspace over tmux"
arch=('x86_64' 'aarch64')
url="https://github.com/eeegoloauq/stashee-terminal"
license=('MIT')
depends=('gtk4' 'libadwaita' 'vte4' 'tmux')
makedepends=('cargo')
optdepends=('wl-clipboard: mouse-selection copy on Wayland'
            'xclip: mouse-selection copy on X11')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b0625e996eaebb00de83096319942bb81f979afc6dc6bd2a19ddeee774c15d81')

prepare() {
  cd "stashee-terminal-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "stashee-terminal-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release --workspace
}

check() {
  cd "stashee-terminal-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --workspace
}

package() {
  cd "stashee-terminal-$pkgver"
  install -Dm755 target/release/stashee "$pkgdir/usr/bin/stashee"
  install -Dm644 crates/stashee/data/dev.stashee.Terminal.desktop "$pkgdir/usr/share/applications/dev.stashee.Terminal.desktop"
  install -Dm644 crates/stashee/data/dev.stashee.Terminal.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/dev.stashee.Terminal.svg"
  for s in 64 128 256; do
    install -Dm644 "crates/stashee/data/dev.stashee.Terminal-$s.png" "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/dev.stashee.Terminal.png"
  done
  install -Dm644 crates/stashee/data/dev.stashee.Terminal.metainfo.xml "$pkgdir/usr/share/metainfo/dev.stashee.Terminal.metainfo.xml"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
