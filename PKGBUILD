# Maintainer: Bill Auclair <screenshaver@proton.me>

pkgname=screenshaver
pkgver=0.5.6
pkgrel=1
pkgdesc="Next-generation Linux screensaver and wallpaper manager that renders ISF, ShaderToy and GLSL shaders"
arch=('x86_64')
url="https://github.com/bauclair/screenshaver"
license=('GPL-3.0-or-later')
options=('!lto')

depends=(
  'glibc' 'sdl2' 'sdl2_ttf' 'libx11' 'libxss' 'libglvnd'
  'wayland' 'libdecor' 'hicolor-icon-theme'
  'qt6-base' 'qt6-declarative' 'libkscreen'
)
makedepends=('cargo' 'pkgconf' 'cmake' 'ninja')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ee52cefd3015060cdf102a17dcd03439cf28b3607bac7b156ab1d8593b1a3c50')

# Use the linker configuration verified with the standalone Arch Cargo build.
_set_rust_linker() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=gcc
  export RUSTFLAGS="${RUSTFLAGS:+$RUSTFLAGS }-C link-arg=-fuse-ld=bfd"
}

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  _set_rust_linker
  cargo fetch --locked
  cargo fetch --locked --manifest-path kde-renderer/Cargo.toml
  cargo fetch --locked --manifest-path kde-wallpaper-producer/Cargo.toml
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  _set_rust_linker

  cargo build --frozen --release --features libdecor-bridge
  cargo build --frozen --release --manifest-path kde-renderer/Cargo.toml
  cargo build --frozen --release --manifest-path kde-wallpaper-producer/Cargo.toml

  cmake -S kde-host -B kde-host/build-aur-release -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DSCREENSHAVER_RENDERER_LIBRARY="$srcdir/$pkgname-$pkgver/kde-renderer/target/release/libscreenshaver.so"
  cmake --build kde-host/build-aur-release --parallel
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  _set_rust_linker
  cargo test --frozen --release --features libdecor-bridge
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  local module="kde-host/build-aur-release/qml/ScreenshaverNativeGL"
  local renderer="kde-renderer/target/release/libscreenshaver.so"
  local producer="kde-wallpaper-producer/target/release/screenshaver-plasma-producer"
  local kscreen="kde-host/build-aur-release/libScreenshaverKScreen.so"
  local kscreen_helper="kde-host/build-aur-release/screenshaver-kscreen-discover"
  local plugin="$module/libScreenshaverNativeGLPlugin.so"
  local wallpaper="kde-host/screenshaver-plasma-wallpaper"
  local name mode dest

  for name in "$renderer" "$producer" "$kscreen" "$kscreen_helper" "$plugin" "$module/qmldir" \
      "$wallpaper/metadata.json" "$wallpaper/contents/ui/main.qml"; do
    if [[ ! -f "$name" ]]; then
      printf 'Missing required build artifact: %s\n' "$name" >&2
      return 1
    fi
  done

  install -Dm755 target/release/screenshaver "$pkgdir/usr/bin/screenshaver"
  install -Dm755 "$producer" "$pkgdir/usr/bin/screenshaver-plasma-producer"
  install -Dm755 "$renderer" "$pkgdir/usr/lib/screenshaver/kde/libscreenshaver.so"
  install -Dm755 "$kscreen" "$pkgdir/usr/lib/screenshaver/kde/libScreenshaverKScreen.so"
  install -Dm755 "$kscreen_helper" \
    "$pkgdir/usr/lib/screenshaver/kde/screenshaver-kscreen-discover"

  for dest in \
      "$pkgdir/usr/lib/screenshaver/kde/qml/ScreenshaverNativeGL" \
      "$pkgdir/usr/lib/qt6/qml/ScreenshaverNativeGL" \
      "$pkgdir/usr/share/plasma/wallpapers/org.screenshaver.wallpaper/contents/ui/ScreenshaverNativeGL"; do
    for name in qmldir libScreenshaverNativeGLPlugin.so libscreenshaver.so; do
      mode=644
      [[ "$name" == *.so ]] && mode=755
      if [[ "$name" == libscreenshaver.so ]]; then
        install -Dm"$mode" "$renderer" "$dest/$name"
      else
        install -Dm"$mode" "$module/$name" "$dest/$name"
      fi
    done
  done

  install -Dm644 "$wallpaper/metadata.json" \
    "$pkgdir/usr/share/plasma/wallpapers/org.screenshaver.wallpaper/metadata.json"
  install -Dm644 "$wallpaper/contents/ui/main.qml" \
    "$pkgdir/usr/share/plasma/wallpapers/org.screenshaver.wallpaper/contents/ui/main.qml"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 assets/screenshaver.desktop \
    "$pkgdir/usr/share/applications/screenshaver.desktop"
  install -Dm644 assets/screenshaver-splash.png \
    "$pkgdir/usr/share/screenshaver/screenshaver-splash.png"
  install -d "$pkgdir/usr/share/icons/hicolor"
  cp -a assets/icons/hicolor/. "$pkgdir/usr/share/icons/hicolor/"
}
