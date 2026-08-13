# Maintainer: Dr. Daniel Dumke <reinschrift@dumke.me>
pkgname=reinschrift
pkgver=0.25.8
pkgrel=1
pkgdesc="Manage your todos in plain Markdown — native GNOME app and CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/danst0/ReinschriftTodo"
license=('GPL-3.0-or-later')
# !lto: the ring crate's C/asm objects don't survive makepkg's default -flto=auto
options=('!lto')
depends=('gtk4' 'libadwaita' 'alsa-lib' 'openssl' 'gcc-libs' 'glibc' 'hicolor-icon-theme')
makedepends=('cargo' 'cmake' 'clang')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bc161c749cdac5189180f0d1e07b48fff7caf5a7a48887829ea0b5dd9c3e857c')

prepare() {
  cd "ReinschriftTodo-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "ReinschriftTodo-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --workspace
}

check() {
  cd "ReinschriftTodo-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release -p reinschrift-core
}

package() {
  cd "ReinschriftTodo-$pkgver"

  # Same binary naming as the Flatpak: GUI = reinschrift, CLI = reinschrift-cli
  install -Dm755 target/release/reinschrift_todo "$pkgdir/usr/bin/reinschrift"
  install -Dm755 target/release/reinschrift "$pkgdir/usr/bin/reinschrift-cli"

  install -Dm644 me.dumke.Reinschrift.desktop "$pkgdir/usr/share/applications/me.dumke.Reinschrift.desktop"
  install -Dm644 me.dumke.Reinschrift.metainfo.xml "$pkgdir/usr/share/metainfo/me.dumke.Reinschrift.metainfo.xml"

  install -Dm644 icon/todos.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/me.dumke.Reinschrift.png"
  install -Dm644 icon/todos-256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/me.dumke.Reinschrift.png"
  install -Dm644 icon/todos-128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/me.dumke.Reinschrift.png"
  install -Dm644 icon/todos-64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/me.dumke.Reinschrift.png"

  # gettext-Kataloge (msgfmt aus base-devel)
  local po lang
  for po in po/*.po; do
    lang="$(basename "$po" .po)"
    install -d "$pkgdir/usr/share/locale/$lang/LC_MESSAGES"
    msgfmt -o "$pkgdir/usr/share/locale/$lang/LC_MESSAGES/reinschrift.mo" "$po"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
