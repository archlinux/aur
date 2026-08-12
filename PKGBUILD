# Maintainer: JR Lanteigne <root at dnim dot dev>
# SPDX-FileCopyrightText: JR Lanteigne <root@dnim.dev>
# SPDX-License-Identifier: GPL-3.0-or-later

# pkgver and the checksums below are set from the git tag by the `aur` job
# in .github/workflows/release.yml, which is what publishes this. The values
# committed here are the last published ones, kept so the file still builds
# by hand.
pkgname=sharkfin-keyboard
_pkgname=sharkfin
pkgver=0.3.2
pkgrel=1
pkgdesc='Configurator for Attack Shark and other ROYUAN keyboards'
arch=('x86_64')
url='https://github.com/dniminenn/sharkfin'
license=('GPL-3.0-or-later')
depends=('cairo' 'dbus' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libgcc'
         'libsoup3' 'systemd-libs' 'webkit2gtk-4.1')
makedepends=('cargo' 'npm')
# The AUR package named sharkfin is an unrelated project that also installs
# /usr/bin/sharkfin.
conflicts=('sharkfin')
# The hidapi crate compiles vendored C; makepkg's LTO makes ld drop its symbols.
# The release profile emits no debug info, so a debug package would be an
# empty directory plus a dangling symlink. namcap flags both.
options=('!lto' '!debug')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('29a88c3d2dc6f4cc17824e68a9c886ea1eaf9a09af7c933320d19704b8f2f2947d74f9df3bab1ae2b0083c76028891097dcac1882158d19e1738d1b726802910')

prepare() {
  cd "$_pkgname-$pkgver/app"
  npm ci --cache "$srcdir/npm-cache"
  cd src-tauri
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd "$_pkgname-$pkgver/app"
  npm run build
  cd src-tauri
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$_pkgname-$pkgver/app/src-tauri"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --lib
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm0755 "app/src-tauri/target/release/$_pkgname" -t "$pkgdir/usr/bin/"
  install -Dm0644 "packaging/$_pkgname.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm0644 "packaging/70-$_pkgname.rules" -t "$pkgdir/usr/lib/udev/rules.d/"
  local _size
  for _size in 32 128; do
    install -Dm0644 "app/src-tauri/icons/${_size}x${_size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/$_pkgname.png"
  done
  install -Dm0644 'app/src-tauri/icons/128x128@2x.png' \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
  install -Dm0644 'app/src-tauri/icons/icon.png' \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
}
