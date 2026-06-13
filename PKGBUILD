pkgname=birdnet-rs
pkgver=0.1.3
pkgrel=1
pkgdesc="Self-hosted realtime soundscape analyzer: identifies bird species with the BirdNET neural network and serves a live web dashboard (Rust/Leptos + ONNX)"
arch=('x86_64' 'aarch64')          # upstream supports 64-bit targets only
url="https://github.com/dividebysandwich/birdnet-rs"
license=('MIT')                     # source is MIT; the BirdNET model is CC BY-NC-SA 4.0 and is NOT shipped (fetched on first run)
depends=(
  'alsa-lib'                        # ALSA capture (libasound) — linked by the binary on Linux
  'ffmpeg'                          # BirdWeather upload: FLAC encode + EBU R128 loudness normalization
  'curl'                            # first-run model download (fetch-model.sh)
  'gcc-libs'
)
# NOTE: cargo-leptos (the build driver) is not in the official repos, so it is
# compiled into the build dir during build() rather than listed here — that
# keeps `makepkg` working without an AUR helper. If you already have it
# installed (AUR `cargo-leptos`), the build reuses it via PATH.
makedepends=(
  'rustup'                          # needed to add the wasm32-unknown-unknown target (see prepare())
  'clang'
  'pkgconf'
)
# Pin the build driver for reproducibility; bump if it lags behind leptos 0.8.
_cargo_leptos_ver=0.2.42
optdepends=(
  'python: convert the BirdNET TFLite weights to ONNX yourself (scripts/convert_model.sh)'
  'wget: alternative downloader for the first-run model fetch'
)
# Arch's makepkg injects -flto into CFLAGS/CXXFLAGS by default. The `cc` crate
# then compiles ring's bundled C/asm as LTO bitcode, and the final Rust link
# can't resolve ring's C symbols (ring_core_*_LIMBS_*). Disabling makepkg LTO
# is the standard fix for ring-dependent Rust packages. See ring issue #1444.
options=('!lto')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('344df81dbff0d8007fb8b9d95668d7e3c015d1ec99ee1da48b93498d680a8288')

prepare() {
  cd "$pkgname-$pkgver"

  # Contain cargo/rustup state in the build dir so it doesn't touch ~/.cargo
  # or ~/.rustup. Must be set inside the functions: $srcdir isn't defined yet
  # when makepkg first sources this file.
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_HOME="$srcdir/rustup-home"

  # cargo-leptos compiles the lib for wasm32-unknown-unknown (the hydrate/WASM
  # bundle); the repo `rust` package doesn't ship that std, so add it via rustup.
  rustup toolchain install --profile minimal stable
  rustup target add --toolchain stable wasm32-unknown-unknown

  # Pre-fetch dependencies for both the host and the wasm target using the
  # committed Cargo.lock, so the actual build is mostly cached/pinned.
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  cargo fetch --locked --target wasm32-unknown-unknown
}

build() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_HOME="$srcdir/rustup-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR="$srcdir/$pkgname-$pkgver/target"

  # Provide cargo-leptos without requiring it as a system/AUR package: use one
  # already on PATH if present, otherwise compile it into the build dir.
  if ! command -v cargo-leptos >/dev/null 2>&1; then
    cargo install --locked --version "$_cargo_leptos_ver" \
      --root "$srcdir/tools" cargo-leptos
    export PATH="$srcdir/tools/bin:$PATH"
  fi

  # Build the axum server (ssr) + the hydrate WASM bundle and assemble the
  # site/ directory in one step. Note: the `ort`/birdnet-onnx build step
  # downloads a prebuilt ONNX Runtime, so network access is required here.
  cargo leptos build --release --precompress
}

package() {
  cd "$pkgname-$pkgver"

  # Server binary
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # Leptos site bundle (the systemd unit points LEPTOS_SITE_ROOT here)
  install -d "$pkgdir/usr/share/$pkgname/site"
  cp -a target/site/. "$pkgdir/usr/share/$pkgname/site/"
  # Normalize permissions of the copied bundle.
  find "$pkgdir/usr/share/$pkgname/site" -type d -exec chmod 755 {} +
  find "$pkgdir/usr/share/$pkgname/site" -type f -exec chmod 644 {} +

  # Model helper scripts (the fetch-model unit calls fetch-model.sh)
  install -Dm755 scripts/fetch-model.sh    "$pkgdir/usr/share/$pkgname/scripts/fetch-model.sh"
  install -Dm755 scripts/download_model.sh "$pkgdir/usr/share/$pkgname/scripts/download_model.sh"
  install -Dm755 scripts/convert_model.sh  "$pkgdir/usr/share/$pkgname/scripts/convert_model.sh"

  # systemd units (DynamicUser + StateDirectory=birdnet-rs -> /var/lib/birdnet-rs)
  install -Dm644 packaging/linux/birdnet-rs.service \
    "$pkgdir/usr/lib/systemd/system/birdnet-rs.service"
  install -Dm644 packaging/linux/birdnet-rs-fetch-model.service \
    "$pkgdir/usr/lib/systemd/system/birdnet-rs-fetch-model.service"

  # Licenses & docs
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 packaging/MODEL_LICENSE "$pkgdir/usr/share/doc/$pkgname/MODEL_LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
