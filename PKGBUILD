# Maintainer: RamazanBerk20 <119219364+RamazanBerk20 at users dot noreply dot github dot com>
pkgname=heaphook
pkgver=1.0.0rc1
_tag=1.0.0-rc.1
pkgrel=1
pkgdesc="Memory scanner and debugger in the spirit of Cheat Engine"
arch=('x86_64')
url="https://github.com/RamazanBerk20/HeapHook"
license=('Apache-2.0')
depends=('webkit2gtk-4.1' 'gtk3')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$_tag.tar.gz::$url/archive/refs/tags/v$_tag.tar.gz")
sha256sums=('bf5bad6b6334ec8fcc8fd625cdf7a04f96cf39594b15c3a893cde1d3e323b90f')
_src="HeapHook-$_tag"

prepare() {
  cd "$_src"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n "s/host: //p")"
  cargo fetch --locked --manifest-path crates/hh-inject/payload/Cargo.toml
}

build() {
  cd "$_src"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR="$srcdir/$_src/target"
  # First: the app's bundle config refers to the speedhack library.
  cargo build --frozen --release --manifest-path crates/hh-inject/payload/Cargo.toml \
    --target-dir crates/hh-inject/payload/target
  # The release build embeds app/ui; no tauri-cli or node is needed.
  (cd app/src-tauri && cargo build --frozen --release --features tauri/custom-protocol)
  cargo build --frozen --release -p hh-net --bin hh-server
}

package() {
  cd "$_src"
  install -Dm755 target/release/heaphook "$pkgdir/usr/bin/heaphook"
  install -Dm755 target/release/hh-server "$pkgdir/usr/bin/hh-server"
  # heaphook looks for the speedhack library in <prefix>/lib/HeapHook.
  install -Dm755 crates/hh-inject/payload/target/release/libhh_speedhack.so \
    "$pkgdir/usr/lib/HeapHook/libhh_speedhack.so"
  install -Dm644 app/src-tauri/icons/32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/heaphook.png"
  install -Dm644 app/src-tauri/icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/heaphook.png"
  install -Dm644 app/src-tauri/icons/128x128@2x.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/heaphook.png"
  install -Dm644 app/src-tauri/icons/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/heaphook.png"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/heaphook.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=HeapHook
Comment=Memory scanner and debugger
Exec=heaphook
Icon=heaphook
Categories=Development;
Terminal=false
StartupWMClass=heaphook
EOF
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
