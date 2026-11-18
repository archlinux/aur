# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=deadoxide
pkgver=0.1.0
pkgrel=1
pkgdesc="Runtime that reads an installed copy of Project Zomboid: maps, tiles, the game's Lua and saves"
arch=('x86_64')
url="https://deadoxide-rust.github.io/deadoxide"
license=('MIT')
depends=('glibc' 'libgcc'
         # The binaries link only glibc; every windowing and GPU library below is
         # dlopen'd at run time, so namcap reports them as unneeded.
         'libglvnd' 'libx11' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11'
         'vulkan-icd-loader' 'wayland' 'xcb-util-keysyms')
makedepends=('cargo' 'rust')
optdepends=('mesa: OpenGL fallback when no Vulkan driver is installed'
            'xdg-utils: opening links and folders from the launcher')
source=("$pkgname-$pkgver.tar.gz::https://github.com/deadoxide-rust/deadoxide/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.desktop"
        "Cargo.lock.patched"
        "0001-fix-mod-extraction-and-site-url.patch")
sha256sums=('b780edd4cafe6f40dee0c395bd1bc4582ce588a63f64c4b1fc76b998d64aceb5'
            '5c99fe88ca32fe658bdbf971a42cf48b58e12c02d043aa19200167ec6daf03b9'
            '4c4f27fc08db5cb1e2bd9603877f78bbb17dfa985df05d4a3b3ca6e3ed19e918'
            '24d54ec7004c33cd5726020c2a6d28028eddc1cf10460ba0d3a381c7f0a2554a')

latestver() {
  curl -fsSL https://api.github.com/repos/deadoxide-rust/deadoxide/releases/latest |
    grep -oP '"tag_name": *"v\K[^"]+'
}

prepare() {
  cd "$pkgname-$pkgver"
  # Upstream releases are built on Windows, and gpui-platform's Linux backends
  # are feature-gated off by default: without them open_window() succeeds
  # against a stub platform, so the launcher runs with no window and no error.
  sed -i 's|^gpui_platform = { package = "gpui-fast-platform", version = "0.1.13" }$|gpui_platform = { package = "gpui-fast-platform", version = "0.1.13", features = ["wayland", "x11"] }|' \
    launcher/Cargo.toml
  grep -q 'gpui_platform = { package = "gpui-fast-platform", version = "0.1.13", features = \["wayland", "x11"\] }' \
    launcher/Cargo.toml
  # Two defects the Windows-only release never hit. `gpui_platform`'s Linux
  # backends are feature-gated off, so open_window() succeeds against a stub and
  # the launcher runs with no window and no error; and archives built on Windows
  # name their entries `media\\lua\\...`, where a backslash is an ordinary file
  # name character on Linux, so a catalog mod installs as one flat file.
  patch -Np1 -i "$srcdir/0001-fix-mod-extraction-and-site-url.patch"
  # That patch needs 27 crates the release's own Cargo.lock predates, so the
  # lock is replaced by the same resolve with those backends enabled. It pins
  # this pkgver's graph: a newer release fails here instead of resolving anew.
  cp "$srcdir/Cargo.lock.patched" Cargo.lock
  cargo fetch --locked
}

build() {
  cd "$pkgname-$pkgver"
  # cargo hands CFLAGS to the `cc` crate, which builds the vendored Lua, the
  # bundled SQLite and ring's assembly. A tuned makepkg.conf (-march=native,
  # -O3, -flto) makes ring fail to link, so keep its own flags off the C code.
  unset CFLAGS CXXFLAGS LDFLAGS RUSTFLAGS
  cargo build --release --frozen --offline \
    -p deadoxide-launcher -p zomboid-client -p zomboid-ctl
}

check() {
  cd "$pkgname-$pkgver"
  unset CFLAGS CXXFLAGS LDFLAGS RUSTFLAGS
  # The launcher's tests are the gate upstream runs before publishing a release.
  cargo test --release --frozen --offline -p deadoxide-launcher
}

package() {
  cd "$pkgname-$pkgver"
  # The launcher starts zomboid-client from its own directory.
  install -Dm755 target/release/deadoxide-launcher "$pkgdir/usr/bin/deadoxide-launcher"
  install -Dm755 target/release/zomboid-client "$pkgdir/usr/bin/zomboid-client"
  install -Dm755 target/release/zomboid-ctl "$pkgdir/usr/bin/zomboid-ctl"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 assets/icon-256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
