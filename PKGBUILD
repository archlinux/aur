# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=apkscope
pkgver=0.9.1
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
sha256sums=('036afc1cc0c36a64860e35c259629b6aac4d44965185f9065bf3e6ecb233055c')

# glutin's sys crates generate their bindings into target/ during the build and
# rustc records the generated file's path in panic metadata, so the binary ships
# the builder's absolute $srcdir unless the prefix is remapped. build() and
# check() must pass identical rustflags: package() installs whatever the check
# build left in target/release, and differing flags would rebuild every crate.
_cargo_env() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export CARGO_ENCODED_RUSTFLAGS="--remap-path-prefix=${srcdir}/="
}

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  _cargo_env
  # Upstream builds eframe with default-features off and never re-enables a
  # windowing backend, so winit aborts with "The platform you're compiling for
  # is not supported by winit" and the viewer only ever exists for Windows.
  # Enabling the two backends winit needs makes the viewer build here.
  cargo build --release --frozen --features eframe/x11,eframe/wayland
}

check() {
  cd "$pkgname-$pkgver"
  _cargo_env
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
