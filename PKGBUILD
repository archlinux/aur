# Maintainer: Yasen Pavlov <yasen.pavlov+aur@bitnet.me>
#
# AUR source package: builds the tagged release. Generated from
# https://github.com/yasen-pavlov/ultra_9000/tree/main/packaging/aur, which fills in pkgver,
# pkgrel and sha256sums for every release; change the template there, not on the AUR.

pkgname=ultra-9000
pkgver=0.1.0
pkgrel=1
pkgdesc='Agent harness with native Alacritty terminals in a Tauri/Svelte interface'
arch=('x86_64')
url='https://github.com/yasen-pavlov/ultra_9000'
license=('MIT OR Apache-2.0')
# Every library the binary links directly, plus librsvg, libxkbcommon, mesa (EGL) and
# wayland, which it loads at runtime (namcap reports those four as possibly unneeded).
depends=(
  'cairo'
  'dbus'
  'fontconfig'
  'freetype2'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libgcc'
  'librsvg'
  'libsoup3'
  'libxkbcommon'
  'mesa'
  'pango'
  'wayland'
  'webkit2gtk-4.1'
)
makedepends=('bun' 'cargo')
# !lto: makepkg's C LTO flags do not mix with rustc-linked objects of the -sys crates.
# !debug: the release profile keeps line tables (debug = 1); they stay in the binary
# instead of a separate -debug package.
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8e3a74acf818f49f83b7e1c103d4fa31e974203af9a27af4a1b267e1e78caaa1')

prepare() {
  cd "ultra_9000-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  # The repository keeps the 0.0.0 placeholder; releases stamp the tag's version.
  bun scripts/set-version.ts "$pkgver"
  bun install --frozen-lockfile
  cargo fetch --locked --manifest-path src-tauri/Cargo.toml \
    --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd "ultra_9000-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  # Panic locations of the vendored path crates and build-script outputs would otherwise
  # embed the build directory.
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/usr/src/$pkgname"
  bun run tauri build --no-bundle -- --frozen
}

package() {
  cd "ultra_9000-$pkgver"
  install -Dm755 src-tauri/target/release/ultra9000 "$pkgdir/usr/bin/ultra9000"
  install -Dm644 packaging/linux/ultra9000.desktop "$pkgdir/usr/share/applications/ultra9000.desktop"

  local icon
  for icon in src-tauri/icons/hicolor/*/apps/ultra-9000.*; do
    install -Dm644 "$icon" "$pkgdir/usr/share/icons/${icon#src-tauri/icons/}"
  done

  local licenses="$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 -t "$licenses" LICENSE-MIT LICENSE-APACHE THIRD_PARTY_NOTICES.md
  install -Dm644 -t "$licenses/vendor" vendor/LICENSE-MIT vendor/LICENSE-APACHE vendor/PROVENANCE.md
}
