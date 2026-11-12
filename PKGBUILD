# Maintainer: Thomas L <zobi8225 at gmail dot com>
pkgname=orgamnesia
pkgver=1.5.0
pkgrel=1
pkgdesc="Lightweight Obsidian: second brain and personal wiki in Rust. Markdown and/or Emacs Org-mode notes."
arch=('x86_64' 'aarch64')
url="https://github.com/thomas-louvigne/orgamnesia"
license=('GPL-3.0-or-later')
depends=('webkit2gtk-4.1' 'gtk3' 'glib2' 'gdk-pixbuf2' 'cairo' 'libsoup3' 'dbus'
         'glibc' 'libgcc' 'hicolor-icon-theme')
makedepends=('git' 'rust' 'rust-wasm' 'trunk' 'cargo-tauri')
conflicts=('orgamnesia-git')
options=('!lto' '!debug')
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked
  cargo fetch --locked --manifest-path src-tauri/Cargo.toml
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  # The RUSTFLAGS of makepkg.conf are made for the machine's processor: given to
  # the WebAssembly build too, wasm-bindgen then fails. They go to the native
  # target only.
  local triple=${CARCH^^}_UNKNOWN_LINUX_GNU
  export CARGO_TARGET_${triple}_RUSTFLAGS="$RUSTFLAGS"
  unset RUSTFLAGS
  # The app tells about new versions with the AUR helper's command
  export ORGAMNESIA_PACKAGE=aur
  # Builds the Leptos frontend with Trunk (beforeBuildCommand), then the
  # Tauri binary with the frontend embedded. No bundle: pacman packages it.
  cargo tauri build --no-bundle
}

package() {
  cd "$pkgname"
  install -Dm755 src-tauri/target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 packaging/arch/$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"

  local size
  for size in 32 64 128; do
    install -Dm644 src-tauri/icons/${size}x${size}.png \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
  done
  install -Dm644 src-tauri/icons/128x128@2x.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm644 src-tauri/icons/icon.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
  install -Dm644 src-tauri/icons/app-icon.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
}
