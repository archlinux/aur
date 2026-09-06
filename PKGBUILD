pkgname=sdroxide
pkgver=1.6.5
pkgrel=1
pkgdesc="Powerful SDR transceiver with a native GUI, browser web UI and built in digi modes like FT8, SSTV, THOR (native RTL-SDR/RX-888/CAT/etc backends, no SoapySDR)"
arch=('x86_64')
url="https://github.com/dividebysandwich/sdroxide"
license=('GPL-3.0-or-later')
# Runtime: alsa-lib + opus are directly linked; the wgpu/winit GUI dlopens the
# Vulkan loader and the Wayland/X11 client libraries at startup.
depends=('alsa-lib' 'opus' 'libxkbcommon' 'wayland' 'libx11' 'libxcursor'
         'libxi' 'libxrandr' 'vulkan-icd-loader')
# rust/rust-wasm build the native binary and the wasm web client; trunk bundles
# the web client; wasm-bindgen + binaryen(wasm-opt) are trunk's post-processors.
# (The rustup package satisfies all of rust/cargo/rust-wasm by `provides`,
# but only carries the targets its user added -- see prepare().)
# cmake drives the vendored RADE and rtl_433 C builds, clang supplies the
# libclang that bindgen loads for its headers; neither is part of base-devel.
# RADE's own CMake autotools-builds a patched Opus, which needs
# autoconf/automake/libtool from base-devel.
makedepends=('rust' 'rust-wasm' 'trunk' 'wasm-bindgen' 'binaryen' 'cmake' 'clang')
# Same /usr/bin/sdroxide as the SoapySDR-enabled build.
conflicts=('sdroxide-soapysdr')
options=('!lto')
# vendor/rade_c, vendor/rtl_433 and vendor/faad2 are git submodules, and
# GitHub's release tarballs carry no submodule contents, so all three are
# fetched separately and put in place in prepare(). Keep in sync with the tag:
#   git rev-parse "v$pkgver:vendor/rade_c"
#   git rev-parse "v$pkgver:vendor/rtl_433"
#   git rev-parse "v$pkgver:vendor/faad2"
_rade_commit=a36161bce0fb37daf3f4602344b095f6817dddb1
_rtl433_commit=8fa6364c5c7e14665fe3d80d0553883ec14a4116
# faad2 2.11.2. crates/sdroxide-drm builds it with DRM_SUPPORT and links it in,
# because Dream otherwise dlopens a libfaad_drm.so.2 that no distribution
# ships. That crate is an unconditional dependency of the sdroxide binary --
# not behind any feature -- so this one is needed by every build.
_faad2_commit=673a22a3c7c33e96e2ff7aae7c4d2bc190dfbf92
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "rade_c-$_rade_commit.tar.gz::https://github.com/freedv/rade_c/archive/$_rade_commit.tar.gz"
        "rtl_433-$_rtl433_commit.tar.gz::https://github.com/merbanan/rtl_433/archive/$_rtl433_commit.tar.gz"
        "faad2-$_faad2_commit.tar.gz::https://github.com/knik0/faad2/archive/$_faad2_commit.tar.gz")
sha256sums=('cbea29674cc38352ef2c8980696711258ce427d044612b25c8f02874b2dc2dd7'
            'eaba2ecbe61dc48748bc62f08b2eb623bccd5b21b8228bf42dedc0e232edf7cd'
            '6e164f38216f46f1d08494c2adeaa7c72d7f3d5456e0b8c5ae424159d7051753'
            '98725cefc915771f00ffd0286901c865e7d3fd0e5ff6b98d004d6f48904776f9')

prepare() {
  cd "sdroxide-$pkgver"
  # Stand in for `git submodule update --init --recursive`: the build scripts of
  # crates/sdroxide-rade, crates/sdroxide-ism and crates/sdroxide-drm read
  # vendor/rade_c, vendor/rtl_433 and vendor/faad2 straight out of the source
  # tree, and panic if they are empty. vendor/dream, next to faad2, is a copied
  # tree rather than a submodule, so it does arrive in the release tarball.
  rm -rf vendor/rade_c vendor/rtl_433 vendor/faad2
  mkdir -p vendor
  cp -a "$srcdir/rade_c-$_rade_commit" vendor/rade_c
  cp -a "$srcdir/rtl_433-$_rtl433_commit" vendor/rtl_433
  cp -a "$srcdir/faad2-$_faad2_commit" vendor/faad2
  export RUSTUP_TOOLCHAIN=stable
  # The rustup package satisfies the rust-wasm makedepend by `provides`, but it
  # only ships the targets its user has actually added -- so on a rustup box the
  # wasm32 standard library can still be absent while pacman considers the
  # dependency met, and the trunk build in build() then dies deep in the
  # dependency graph with "can't find crate for core". Settle it here, where the
  # network is still expected to be up. `--print target-libdir` names the path
  # for any target rustc knows, installed or not, so the directory test is what
  # actually answers the question.
  local _wasm_libdir
  _wasm_libdir="$(rustc --print target-libdir --target wasm32-unknown-unknown 2>/dev/null)"
  if [[ ! -d $_wasm_libdir ]]; then
    if ! { command -v rustup >/dev/null && rustup target add wasm32-unknown-unknown; }; then
      echo "ERROR: the wasm32-unknown-unknown standard library is missing, and the" >&2
      echo "       web client cannot be built without it. Install the rust-wasm" >&2
      echo "       package, or, on a rustup toolchain, run:" >&2
      echo "         rustup target add wasm32-unknown-unknown" >&2
      return 1
    fi
  fi
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
  # host without libSoapySDR. `rtl433` is a default feature too, so
  # --no-default-features would drop the vendored rtl_433 ISM decoders as well:
  # name it back explicitly, as the upstream release build of this variant does.
  cargo build --release --locked -p sdroxide --no-default-features --features embed-web,rtl433
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
