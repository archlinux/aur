# Maintainer: sachesi <xsachesi@pm.me>

# pkgver and sha256sums are filled in by .github/workflows/aur.yml for each release.
pkgname=movo
pkgver=0.5.0
pkgrel=1
pkgdesc='GTK 4 and Libadwaita client for HDRezka'
arch=('x86_64' 'aarch64')
url='https://github.com/sachesi/movo'
license=('GPL-3.0-only')
depends=('gtk4>=1:4.22' 'libadwaita>=1:1.9' 'glib2' 'pango' 'hicolor-icon-theme' 'libgcc' 'glibc')
makedepends=('cargo' 'gettext')
optdepends=('mpv: play streams')
# ring compiles C code in; the Rust linker cannot read the objects makepkg's LTO makes of it.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('49ba603330af0028b62718e5749e7ac6d0bcc2cf49dc853948540f5c6a5e55df')

_app_id=io.github.sachesi.Movo

prepare() {
  cd "$pkgname-$pkgver"
  # Build with Arch's stable toolchain rather than the pinned one.
  rm -f rust-toolchain.toml
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p movo
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen -p movo -p movo-core
}

package() {
  cd "$pkgname-$pkgver"
  local data=crates/movo-desktop/data
  install -Dm755 target/release/movo -t "$pkgdir/usr/bin"
  install -Dm644 $data/$_app_id.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 $data/$_app_id.metainfo.xml -t "$pkgdir/usr/share/metainfo"
  install -Dm644 $data/icons/hicolor/scalable/apps/$_app_id.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -Dm644 $data/icons/hicolor/symbolic/apps/$_app_id-symbolic.svg -t "$pkgdir/usr/share/icons/hicolor/symbolic/apps"
  install -Dm644 $data/icons/hicolor/512x512/apps/$_app_id.png -t "$pkgdir/usr/share/icons/hicolor/512x512/apps"
  local po
  for po in po/*.po; do
    install -d "$pkgdir/usr/share/locale/$(basename "$po" .po)/LC_MESSAGES"
    msgfmt -o "$pkgdir/usr/share/locale/$(basename "$po" .po)/LC_MESSAGES/movo.mo" "$po"
  done
}
