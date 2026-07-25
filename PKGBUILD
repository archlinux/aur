pkgname=sdroxide
pkgver=0.5.0
pkgrel=1
pkgdesc="PowerSDR/Thetis-style SDR transceiver with a native GUI, browser web UI and built in digi modes like FT8, SSTV, THOR (CAT + USB-audio backend, no SoapySDR)"
arch=('x86_64')
url="https://github.com/dividebysandwich/sdroxide"
license=('GPL-3.0-or-later')
# Runtime: alsa-lib + opus are directly linked; the wgpu/winit GUI dlopens the
# Vulkan loader and the Wayland/X11 client libraries at startup.
depends=('alsa-lib' 'opus' 'libxkbcommon' 'wayland' 'libx11' 'libxcursor'
         'libxi' 'libxrandr' 'vulkan-icd-loader')
# rust/rust-wasm build the native binary and the wasm web client; trunk bundles
# the web client; wasm-bindgen + binaryen(wasm-opt) are trunk's post-processors.
# (The rustup package provides all of rust/cargo/rust-wasm.)
makedepends=('rust' 'rust-wasm' 'trunk' 'wasm-bindgen' 'binaryen')
# Same /usr/bin/sdroxide as the SoapySDR-enabled build.
conflicts=('sdroxide-soapysdr')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('45e3b2d1ebc06001efc2680b9ffaf4316da591915f691adda48c07d0670f8f82')

prepare() {
  cd "sdroxide-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  cargo fetch --locked --target wasm32-unknown-unknown
}

build() {
  cd "sdroxide-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  # Build the wasm web client first; `embed-web` bakes crates/sdroxide-web/dist
  # into the binary via rust-embed at compile time.
  ( cd crates/sdroxide-web && trunk build --release )
  # CAT/USB-audio backend only: no SoapySDR link, so it builds and runs on a
  # host without libSoapySDR.
  cargo build --release --locked -p sdroxide --no-default-features --features embed-web
}

package() {
  cd "sdroxide-$pkgver"
  install -Dm755 target/release/sdroxide "$pkgdir/usr/bin/sdroxide"
  install -Dm644 packaging/linux/sdroxide.desktop "$pkgdir/usr/share/applications/sdroxide.desktop"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
