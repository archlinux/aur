# Maintainer: giosuel <me@giosuel.ch>
pkgname=realer-xpad
pkgver=0.1.8
pkgrel=1
pkgdesc='Sticky notes with Markdown and drawing, native on Wayland and Hyprland'
arch=('x86_64' 'aarch64')
url='https://github.com/giosuel/realer-xpad'
license=('AGPL-3.0-only')
depends=('cairo' 'glib2' 'glibc' 'gtk4' 'hicolor-icon-theme' 'libadwaita' 'libgcc' 'pango')
makedepends=('cargo')
options=('!debug') # the release profile strips the binary
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('76dcfec8abd0f670b07d82b806c28ea2d2e447538a1f3cd3cc8742cf4b614dc0')

prepare() {
  cd "$pkgname-$pkgver"
  # The repository is at version 0.0.0; releases take theirs from the tag.
  tools/stamp-version.sh "$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # The UI tests need a Wayland compositor; the unit tests don't.
  cargo test --frozen --release --lib
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/realer-xpad -t "$pkgdir/usr/bin"
  install -Dm644 extras/ch.giosuel.RealerXpad.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 extras/ch.giosuel.RealerXpad.metainfo.xml -t "$pkgdir/usr/share/metainfo"
  install -Dm644 data/icons/hicolor/scalable/apps/ch.giosuel.RealerXpad.svg \
    -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -Dm644 README.md extras/hyprland.conf extras/hyprland.lua -t "$pkgdir/usr/share/doc/$pkgname"
}
