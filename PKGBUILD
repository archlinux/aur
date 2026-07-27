pkgname=sdroxide-soapysdr
pkgver=0.6.0
pkgrel=2
pkgdesc="PowerSDR/Thetis-style SDR transceiver with a native GUI, browser web UI and built in digi modes like FT8, SSTV, THOR (SoapySDR-enabled version)"
arch=('x86_64')
url="https://github.com/dividebysandwich/sdroxide"
license=('GPL-3.0-or-later')
# Runtime: alsa-lib + opus + libSoapySDR are directly linked; the wgpu/winit GUI
# dlopens the Vulkan loader and the Wayland/X11 client libraries at startup.
depends=('alsa-lib' 'opus' 'soapysdr' 'libxkbcommon' 'wayland' 'libx11'
         'libxcursor' 'libxi' 'libxrandr' 'vulkan-icd-loader')
# SoapySDR is a plugin framework; install the module(s) for your hardware.
optdepends=('soapyrtlsdr: RTL-SDR (RTL2832U) support'
            'soapyhackrf: HackRF support'
            'soapyairspy: Airspy support'
            'soapybladerf: BladeRF support'
            'soapyplutosdr: ADALM-Pluto support'
            'soapyremote: remote SoapySDR device support'
            'limesuite: LimeSDR support')
# rust/rust-wasm build the native binary and the wasm web client; trunk bundles
# the web client; wasm-bindgen + binaryen(wasm-opt) are trunk's post-processors.
# (The rustup package provides all of rust/cargo/rust-wasm.)
# cmake drives the vendored RADE C build, clang supplies the libclang that
# bindgen loads for its headers; neither is part of base-devel. RADE's own
# CMake autotools-builds a patched Opus, which needs autoconf/automake/libtool
# from base-devel.
makedepends=('rust' 'rust-wasm' 'trunk' 'wasm-bindgen' 'binaryen' 'cmake' 'clang')
# Same /usr/bin/sdroxide as the SoapySDR-free build.
provides=('sdroxide')
conflicts=('sdroxide')
options=('!lto')
# vendor/rade_c is a git submodule, and GitHub's release tarballs carry no
# submodule contents, so it is fetched separately and put in place in prepare().
# Keep in sync with the tag: git rev-parse "v$pkgver:vendor/rade_c"
_rade_commit=a36161bce0fb37daf3f4602344b095f6817dddb1
source=("sdroxide-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "rade_c-$_rade_commit.tar.gz::https://github.com/freedv/rade_c/archive/$_rade_commit.tar.gz")
sha256sums=('4dc631106ff3c568263edc6bd533d7fa2dbd8d13a1db761818af0fde642aa529'
            'eaba2ecbe61dc48748bc62f08b2eb623bccd5b21b8228bf42dedc0e232edf7cd')

prepare() {
  cd "sdroxide-$pkgver"
  # Stand in for `git submodule update --init`: crates/sdroxide-rade/build.rs
  # reads vendor/rade_c straight out of the source tree.
  rm -rf vendor/rade_c
  mkdir -p vendor
  cp -a "$srcdir/rade_c-$_rade_commit" vendor/rade_c
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
  # Default features include `soapy`, so this links libSoapySDR for wideband
  # device support in addition to the CAT/USB-audio backend.
  cargo build --release --locked -p sdroxide --features embed-web
}

package() {
  cd "sdroxide-$pkgver"
  install -Dm755 target/release/sdroxide "$pkgdir/usr/bin/sdroxide"
  # Desktop-menu entry plus the icons its `Icon=sdroxide` resolves against;
  # pacman hooks rebuild the desktop database and icon cache on install.
  install -Dm644 packaging/linux/sdroxide.desktop "$pkgdir/usr/share/applications/sdroxide.desktop"
  install -Dm644 packaging/icons/sdroxide.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/sdroxide.svg"
  for _s in 16 24 32 48 64 128 256 512; do
    install -Dm644 "packaging/icons/sdroxide-$_s.png" \
      "$pkgdir/usr/share/icons/hicolor/${_s}x${_s}/apps/sdroxide.png"
  done
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
