pkgname=sdroxide
pkgver=1.1.0
pkgrel=1
pkgdesc="Powerful SDR transceiver with a native GUI, browser web UI and built in digi modes like FT8, SSTV, THOR (native RTL-SDR/RX-888/CAT backends, no SoapySDR)"
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
# cmake drives the vendored RADE C build, clang supplies the libclang that
# bindgen loads for its headers; neither is part of base-devel. RADE's own
# CMake autotools-builds a patched Opus, which needs autoconf/automake/libtool
# from base-devel.
makedepends=('rust' 'rust-wasm' 'trunk' 'wasm-bindgen' 'binaryen' 'cmake' 'clang')
# Same /usr/bin/sdroxide as the SoapySDR-enabled build.
conflicts=('sdroxide-soapysdr')
options=('!lto')
# vendor/rade_c is a git submodule, and GitHub's release tarballs carry no
# submodule contents, so it is fetched separately and put in place in prepare().
# Keep in sync with the tag: git rev-parse "v$pkgver:vendor/rade_c"
_rade_commit=a36161bce0fb37daf3f4602344b095f6817dddb1
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "rade_c-$_rade_commit.tar.gz::https://github.com/freedv/rade_c/archive/$_rade_commit.tar.gz")
sha256sums=('3af075e2d04abd1a785f7ff9a4876891c4dd8128314fce83bd6c8d2fe3a791e0'
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
  #
  # Host RUSTFLAGS must not reach the wasm32 build. A `-Ctarget-cpu=...` -- a
  # common /etc/makepkg.conf or ~/.cargo/config.toml tweak -- means nothing to
  # wasm32-unknown-unknown, so LLVM falls back to the baseline wasm CPU and drops
  # the target features that target normally enables, `reference-types` among
  # them. wasm-bindgen's build script keys its externref intrinsics off that
  # feature, so they vanish from the crate while the linked module still asks the
  # wasm-bindgen CLI to run its externref transform, and the build dies with
  # "failed to find the __wbindgen_externref_table_dealloc function". An empty
  # RUSTFLAGS outranks both the environment and build.rustflags from a cargo
  # config; the native cargo build below still gets the packager's flags.
  #
  # Naming the binaryen already in makedepends also keeps trunk from downloading
  # its own wasm-opt into ~/.cache/trunk from inside build().
  local _wasm_opt_ver
  _wasm_opt_ver="$(wasm-opt --version | sed -n 's/.*version \([0-9]\+\).*/\1/p')"
  ( cd crates/sdroxide-web
    env -u CARGO_ENCODED_RUSTFLAGS RUSTFLAGS= \
      ${_wasm_opt_ver:+TRUNK_TOOLS_WASM_OPT="version_$_wasm_opt_ver"} \
      trunk build --release )
  # CAT/USB-audio backend only: no SoapySDR link, so it builds and runs on a
  # host without libSoapySDR.
  cargo build --release --locked -p sdroxide --no-default-features --features embed-web
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
  # The RTL-SDR and RX-888 backends are native (nusb, no libusb/SoapySDR) and
  # are compiled into this build, so both rules belong here: without them
  # opening either receiver as a normal user fails. TAG+="uaccess" gives the
  # ACL to whoever is at the active seat, so there is no group to join and no
  # re-login. The RX-888 rule covers two ids on purpose -- 04b4:00f3 is the
  # bare Cypress FX3 bootloader it enumerates as on every plug-in, and the
  # firmware upload that turns it into 04b4:00f1 goes through that first id.
  install -Dm644 packaging/linux/60-sdroxide-rtlsdr.rules \
    "$pkgdir/usr/lib/udev/rules.d/60-sdroxide-rtlsdr.rules"
  install -Dm644 packaging/linux/60-sdroxide-rx888.rules \
    "$pkgdir/usr/lib/udev/rules.d/60-sdroxide-rx888.rules"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # The binary embeds the RX-888's FX3 firmware image, which is MIT rather than
  # GPL: its notice has to be installed alongside sdroxide's own licence.
  install -Dm644 crates/sdroxide-rx888/firmware/LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-rx888-firmware.txt"
}
