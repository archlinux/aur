# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=apkscope
pkgver=0.5.3
pkgrel=1
pkgdesc="Android APK decompiler, xrefs, API recon and MCP server, with native viewer"
arch=('x86_64')
url="https://github.com/suffixing/apkscope"
license=('Apache-2.0')
depends=(
  'gcc-libs'
  'glibc'
  # Opened with dlopen by winit/glutin, so they appear in no NEEDED entry and
  # namcap cannot see them, yet the viewer cannot create a window without them.
  'libglvnd'
  'libxkbcommon'
  'libx11'
  'wayland'
)
makedepends=('cargo')
# makepkg's `lto` option (on in stock Arch and here) injects -flto into CFLAGS,
# which turns the cc-built mimalloc and libdeflate sources into GCC LTO objects
# that rust-lld cannot link, failing on undefined mi_* and libdeflate_* symbols.
# Cargo.toml's own `lto = true` still applies to the Rust code.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('88c13c773fbec5467ee02432fa18c2e83abfc4dcf8c8c73e3cc6c35f7414d8da')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Upstream builds eframe with default-features off and never re-enables a
  # windowing backend, so winit aborts with "The platform you're compiling for
  # is not supported by winit" and the viewer only ever exists for Windows.
  # Enabling the two backends winit needs makes the viewer build here.
  cargo build --release --frozen --features eframe/x11,eframe/wayland
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Same feature set as build(): a --no-default-features test run would replace
  # target/release/$pkgname with the viewer-less binary that package() installs.
  cargo test --release --frozen --features eframe/x11,eframe/wayland
  # The viewer is the only consumer of these strings; their presence is the
  # proof that the tested binary is the one with the window, not the CLI build.
  grep -qaF 'Drop an APK here' "target/release/$pkgname"
  ./target/release/apkscope --version
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  # NOTICE carries terms the license text does not: the trademark restriction on
  # the name and logo, and the AOSP provenance of src/data/android_public.txt.
  install -Dm644 NOTICE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# Upstream tags releases without bumping the crate manifest (v0.5.3 still
# declares 0.5.2), so pkgver follows the release tag while `apkscope --version`
# reports the manifest number.
latestver() {
  gh api repos/suffixing/apkscope/releases/latest --jq '.tag_name' |
      sed -nE 's/^v([0-9]+(\.[0-9]+)*)$/\1/p'
}
