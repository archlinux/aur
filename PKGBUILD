# Maintainer: VisorCraft LLC <packages@visorcraft.com>
# SPDX-FileCopyrightText: 2026 VisorCraft LLC
# SPDX-License-Identifier: 0BSD

pkgname=mongreldb-viewer
pkgver=1.6.3
pkgrel=1
_ortver=1.24.2
pkgdesc='Desktop viewer for exploring MongrelDB databases'
arch=('x86_64')
url='https://github.com/visorcraft/MongrelDB-Viewer'
license=('MIT' 'Apache-2.0')
depends=(
  'cairo'
  'dbus'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup3'
  'openssl'
  'webkit2gtk-4.1'
)
makedepends=('cargo' 'npm' 'pkgconf')
options=('!lto')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  'com.visorcraft.mongreldb-viewer.desktop'
  "onnxruntime-$_ortver-x86_64.tar.lzma2::https://cdn.pyke.io/0/pyke:ort-rs/ms@$_ortver/x86_64-unknown-linux-gnu.tar.lzma2"
  "onnxruntime-$_ortver-LICENSE::https://raw.githubusercontent.com/microsoft/onnxruntime/v$_ortver/LICENSE"
  "onnxruntime-$_ortver-ThirdPartyNotices.txt::https://raw.githubusercontent.com/microsoft/onnxruntime/v$_ortver/ThirdPartyNotices.txt"
)
noextract=("onnxruntime-$_ortver-x86_64.tar.lzma2")
sha256sums=('6ad180dc72ad2cee4daaeedec9528a03e345e254b883616cc342f29c85bc2caf'
            '10e74160895b60fa9efc6ee06d4ff1cec3852d940c4c0c87e60b1bd06a8bff26'
            'acc1cba79c337594ead1d88ca72516147aa60054c84217b53399a31caa5ba671'
            '2f07c72751aed99790b8a4869cf2311df85a860b22ded05fa22803587a48922c'
            '0e07b95f3a8d6230037707c5c4a2b554d12c4cb67369669ac255635528ffcee2')

prepare() {
  cd "MongrelDB-Viewer-$pkgver"
  export CARGO_HOME="$srcdir/cargo"
  export npm_config_cache="$srcdir/npm-cache"

  npm ci
  install -d "$srcdir/onnxruntime"
  xz --format=raw --lzma2=dict=64MiB -dc \
    "$srcdir/onnxruntime-$_ortver-x86_64.tar.lzma2" |
    bsdtar -xf - -C "$srcdir/onnxruntime"
  cargo fetch --manifest-path src-tauri/Cargo.toml \
    --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "MongrelDB-Viewer-$pkgver"
  export CARGO_HOME="$srcdir/cargo"
  export CARGO_NET_OFFLINE=true
  export CARGO_PROFILE_RELEASE_LTO=false
  export npm_config_cache="$srcdir/npm-cache"
  export npm_config_offline=true
  export ORT_LIB_LOCATION="$srcdir/onnxruntime"
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/usr/src/debug/$pkgname-$pkgver"

  npx --offline tauri build --no-bundle
}

package() {
  cd "MongrelDB-Viewer-$pkgver"

  install -Dm755 src-tauri/target/release/mongreldb-viewer \
    "$pkgdir/usr/bin/mongreldb-viewer"
  install -Dm644 "$srcdir/com.visorcraft.mongreldb-viewer.desktop" \
    "$pkgdir/usr/share/applications/com.visorcraft.mongreldb-viewer.desktop"

  install -Dm644 src-tauri/icons/32x32.png \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/com.visorcraft.mongreldb-viewer.png"
  install -Dm644 src-tauri/icons/64x64.png \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/com.visorcraft.mongreldb-viewer.png"
  install -Dm644 src-tauri/icons/128x128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/com.visorcraft.mongreldb-viewer.png"
  install -Dm644 src-tauri/icons/128x128@2x.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/com.visorcraft.mongreldb-viewer.png"
  install -Dm644 src-tauri/icons/icon.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/com.visorcraft.mongreldb-viewer.png"

  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 "$srcdir/onnxruntime-$_ortver-LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/ONNX-Runtime-LICENSE"
  install -Dm644 "$srcdir/onnxruntime-$_ortver-ThirdPartyNotices.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/ONNX-Runtime-ThirdPartyNotices.txt"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
