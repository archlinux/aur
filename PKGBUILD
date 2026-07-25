pkgname=sdroxide
pkgver=0.5.0
pkgrel=2
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
# The desktop entry and icon are carried here rather than taken from the
# tarball: v0.5.0 ships a .desktop without an Icon= key and no icon at all.
# From the next upstream release both live in packaging/ and these two local
# files can be dropped in favour of packaging/linux/sdroxide.desktop and
# packaging/icons/sdroxide.svg.
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'sdroxide.desktop'
        'sdroxide.svg')
sha256sums=('45e3b2d1ebc06001efc2680b9ffaf4316da591915f691adda48c07d0670f8f82'
            '946899328386dde005553bd382e31b46ecaa2886dd08686ec5ad30d681255db3'
            '0767ee1185128a4062bcfe86ebc28f78a85605e41d97b6629836c88be2223d24')

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
  # Desktop-menu entry plus the icon its `Icon=sdroxide` resolves against;
  # pacman hooks rebuild the desktop database and icon cache on install.
  install -Dm644 "$srcdir/sdroxide.desktop" "$pkgdir/usr/share/applications/sdroxide.desktop"
  install -Dm644 "$srcdir/sdroxide.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/sdroxide.svg"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
