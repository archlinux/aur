# Maintainer: Mohamed Jouini <amad3v@gmail.com>

# For ShellCheck: makepkg sets $srcdir and $pkgdir, and runs each function with
# `set -e`, so a failed cd already stops the build.
# shellcheck shell=bash disable=SC2154,SC2164

pkgname=arsu
pkgver=1.0.0
pkgrel=1
pkgdesc='Offline TOTP/HOTP authenticator with an encrypted local vault'
arch=('x86_64')
url='https://github.com/amad3v/arsu'
license=('MIT')
depends=(
  'cairo'
  'dbus'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libgcc'
  'libsoup3'
  'webkit2gtk-4.1'
)
makedepends=(
  'cargo'
  'git'
  'nodejs'
  'pnpm'
)
# The release tag is signed: makepkg checks it against this key.
source=(
  "git+$url.git#tag=v$pkgver?signed"
  'Arsu.desktop'
)
sha256sums=('SKIP'
            '92992d20dde9d11e7171bd9aab1b1de4b85ecaf8fc62dfe20b3ee665e5adf04b')
validpgpkeys=('6A700E00396820D93A829FF91CAC141C34516CB6') # Mohamed Jouini <amad3v@gmail.com>

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  pnpm install --frozen-lockfile
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  # Absolute: the Tauri CLI runs cargo from src-tauri/.
  export CARGO_TARGET_DIR="$srcdir/target"
  # Through the Tauri CLI, not plain cargo: it builds the interface first
  # and compiles the app to load it from the binary instead of a dev server.
  pnpm tauri build --no-bundle -- --frozen
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo test --frozen --workspace
  pnpm test
}

package() {
  cd "$pkgname"
  install -Dm755 "$srcdir/target/release/arsu" "$pkgdir/usr/bin/arsu"
  # Named after the window's app id (arsu), so desktops match the window
  # to its icon directly.
  install -Dm644 "$srcdir/Arsu.desktop" "$pkgdir/usr/share/applications/arsu.desktop"

  local size
  for size in 32 64 128 256; do
    install -Dm644 "src-tauri/icons/${size}x${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/arsu.png"
  done
  install -Dm644 src-tauri/icons/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/arsu.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
