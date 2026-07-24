# Maintainer: VisorCraft LLC <packages@visorcraft.com>

pkgname=onq
pkgver=1.10.4
pkgrel=1
_ortver=1.24.2
pkgdesc='Search-oriented encrypted prompt vault'
arch=('x86_64')
url='https://github.com/visorcraft/onQ'
license=('GPL-3.0-only' 'MIT')
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
  'webkit2gtk-4.1'
)
makedepends=('cargo' 'npm' 'pkgconf')
conflicts=('onq-bin' 'onq-git')
options=('!lto')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  'com.visorcraft.onq.desktop'
  "onnxruntime-$_ortver-x86_64.tar.lzma2::https://cdn.pyke.io/0/pyke:ort-rs/ms@$_ortver/x86_64-unknown-linux-gnu.tar.lzma2"
  "onnxruntime-$_ortver-LICENSE::https://raw.githubusercontent.com/microsoft/onnxruntime/v$_ortver/LICENSE"
  "onnxruntime-$_ortver-ThirdPartyNotices.txt::https://raw.githubusercontent.com/microsoft/onnxruntime/v$_ortver/ThirdPartyNotices.txt"
)
noextract=("onnxruntime-$_ortver-x86_64.tar.lzma2")
sha256sums=('40189c4f646d8eb9a71611170ee254bd7e69a545321e1b063e143ef572427187'
            '5ac2f4c83de25d9c254e7ff8cba2e016935f174a0a2110e9be229168813978d3'
            'acc1cba79c337594ead1d88ca72516147aa60054c84217b53399a31caa5ba671'
            '2f07c72751aed99790b8a4869cf2311df85a860b22ded05fa22803587a48922c'
            '0e07b95f3a8d6230037707c5c4a2b554d12c4cb67369669ac255635528ffcee2')

prepare() {
  cd "onQ-$pkgver"
  export CARGO_HOME="$srcdir/cargo"
  export npm_config_cache="$srcdir/npm-cache"

  npm ci
  install -d "$srcdir/onnxruntime"
  xz --format=raw --lzma2=dict=64MiB -dc \
    "$srcdir/onnxruntime-$_ortver-x86_64.tar.lzma2" |
    bsdtar -xf - -C "$srcdir/onnxruntime"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "onQ-$pkgver"
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
  cd "onQ-$pkgver"

  install -Dm755 target/release/onQ "$pkgdir/usr/bin/onq"
  install -Dm644 "$srcdir/com.visorcraft.onq.desktop" \
    "$pkgdir/usr/share/applications/com.visorcraft.onq.desktop"

  install -Dm644 crates/onq-app/icons/32x32.png \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/com.visorcraft.onq.png"
  install -Dm644 crates/onq-app/icons/64x64.png \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/com.visorcraft.onq.png"
  install -Dm644 crates/onq-app/icons/128x128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/com.visorcraft.onq.png"
  install -Dm644 crates/onq-app/icons/128x128@2x.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/com.visorcraft.onq.png"
  install -Dm644 crates/onq-app/icons/icon.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/com.visorcraft.onq.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/onnxruntime-$_ortver-LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/ONNX-Runtime-LICENSE"
  install -Dm644 "$srcdir/onnxruntime-$_ortver-ThirdPartyNotices.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/ONNX-Runtime-ThirdPartyNotices.txt"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
