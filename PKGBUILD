# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=yapfast
pkgver=0.4.1
pkgrel=2
_id=io.github.yapfast.Yapfast
# The prebuilt native parts nix/native.nix pins for this release: LiveKit's libwebrtc, and the Skia
# archive Cargo.toml's skia-safe pins. Both are x86_64 Linux only. prepare() refuses to build when
# they disagree with the release, because an archive from another release links a different Skia.
_webrtc=webrtc-51ef663
_skia_ver=0.157.0
_skia=skia-binaries-30669978c3f39a73e8a7-x86_64-unknown-linux-gnu-ftembed-ganesh-gl-jpegd-jpege-pdf-textlayout.tar.gz
pkgdesc='Native Discord client that stays light on memory'
arch=(x86_64)
url='https://yapfast.com'
license=(GPL-3.0-or-later OFL-1.1)
# Atkinson Hyperlegible Next, the UI typeface, is embedded in the binary from ui/fonts (OFL-1.1).
# DT_NEEDED carries only glibc, fontconfig, glib2, libgcc, libglvnd, libpulse, libstdc++ and the
# Wayland and X11 client libraries; the rest is opened with dlopen, which is why namcap calls each of
# them unneeded. libglvnd is Skia's GL entry point (its GPU renderer), alsa-lib is libwebrtc's audio,
# and the X11 libraries are loaded on an X11 session even when Wayland is present.
depends=(
  alsa-lib fontconfig glib2 glibc hicolor-icon-theme libgcc libglvnd libpulse libstdc++
  libx11 libxcb libxcursor libxi libxkbcommon libxkbcommon-x11 wayland
)
optdepends=(
  'noto-fonts-emoji: colour emoji'
  'pipewire: screen sharing through the desktop portal'
  'libdrm: screen sharing through the desktop portal'
  'mesa: screen sharing through the desktop portal (libgbm)'
  'libva: encoding streams on AMD and Intel GPUs (VA-API)'
  'intel-media-driver: encoding streams on Intel GPUs'
  'libxcomposite: screen sharing on X11'
  'libxdamage: screen sharing on X11'
  'libxext: screen sharing on X11'
  'libxfixes: screen sharing on X11'
  'libxrandr: screen sharing on X11'
)
makedepends=(rust clang cmake curl llvm21 nasm pkgconf protobuf python)
# webrtc-sys compiles C++ with clang while rustc links with its own LLVM; LTO objects are not
# interchangeable between them.
options=(!lto)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/yapfast/yapfast/archive/refs/tags/v$pkgver.tar.gz"
  "$_webrtc-linux-x64-release.zip::https://github.com/livekit/rust-sdks/releases/download/$_webrtc/webrtc-linux-x64-release.zip"
  "https://github.com/rust-skia/skia-binaries/releases/download/$_skia_ver/$_skia"
)
# skia-safe reads the archive itself, as SKIA_BINARIES_URL; extracting it only litters $srcdir.
noextract=("$_skia")
sha256sums=('8f6d98294a7669a94094ba5d23adadac10650d3f29fc9e358264ad6f33d6d5b1'
            'dce9d9414cd8e2cc9a471c054481851b257ad2a879112ce5be56369b4fefdaed'
            'd5ea4666b67f4ff74a2c9dccf9cbb069fc991552caa9ed26fd4379572ddfe3b1')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  # The native pins belong to one release: a stale Skia archive or libwebrtc builds a binary whose
  # version does not describe it. Each message names the release's own value to set.
  local _pin
  _pin=$(sed -nE 's/^skia-safe = \{ version = "=([^"]+)".*/\1/p' Cargo.toml)
  [[ $_pin == "$_skia_ver" ]] || {
    echo "Cargo.toml pins skia-safe $_pin, but _skia_ver is $_skia_ver and _skia names the archive for $_skia_ver. Set _skia_ver=$_pin and _skia to the x86_64-unknown-linux-gnu archive of skia-binaries release $_pin, as nix/native.nix names it." >&2
    return 1
  }
  _pin=$(sed -nE 's|.*/skia-binaries/releases/download/([^/]+)/.*|\1|p' nix/native.nix)
  [[ $_pin == "$_skia_ver" ]] || {
    echo "nix/native.nix pins skia-binaries $_pin, but _skia_ver is $_skia_ver. Set _skia_ver=$_pin." >&2
    return 1
  }
  _pin=$(sed -nE 's|.*skiaPackage = "([^"]+)".*|\1|p' nix/native.nix)
  [[ $_pin == "$_skia" ]] || {
    echo "nix/native.nix names the Skia archive $_pin, but _skia is $_skia. Set _skia=$_pin." >&2
    return 1
  }
  _pin=$(sed -nE 's|.*/rust-sdks/releases/download/([^/]+)/webrtc-linux-x64-release.zip.*|\1|p' nix/native.nix)
  [[ $_pin == "$_webrtc" ]] || {
    echo "nix/native.nix pins libwebrtc $_pin, but _webrtc is $_webrtc. Set _webrtc=$_pin." >&2
    return 1
  }
  # Cargo.lock's crates.io and git dependencies cannot be declared in source=(); fetch them here so
  # the build itself runs offline.
  cargo fetch --locked --target host-tuple
  # Skia's prebuilt archive defines the same libjpeg symbols as libwebrtc's, and the two land in one
  # binary: nix/prepare-skia-native.py renames the table to one Skia owns, then proves byte for byte
  # that nothing but that symbol name moved.
  YAPFAST_SKIA_SOURCE="$srcdir/$_skia" YAPFAST_SKIA_OUTPUT="$srcdir/skia" \
    YAPFAST_SKIA_OBJCOPY=/usr/lib/llvm21/bin/llvm-objcopy YAPFAST_SKIA_NM=/usr/lib/llvm21/bin/llvm-nm \
    python nix/prepare-skia-native.py
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable CC=clang CXX=clang++ PROTOC=/usr/bin/protoc
  # Without it build_info.rs reports a development build, whatever CARGO_PKG_VERSION says.
  export YAPFAST_RELEASE=1
  # The prebuilt native stacks the build links against, instead of the network ones their build
  # scripts would fetch.
  export LK_CUSTOM_WEBRTC="$srcdir/linux-x64-release"
  export SKIA_BINARIES_URL="file://$srcdir/skia/$_skia"
  # Rust's panic locations and C/C++'s __FILE__ would otherwise name the builder's directories.
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/usr/src/debug/$pkgname"
  export CFLAGS="${CFLAGS:-} -ffile-prefix-map=$srcdir=/usr/src/debug/$pkgname"
  export CXXFLAGS="${CXXFLAGS:-} -ffile-prefix-map=$srcdir=/usr/src/debug/$pkgname"
  # With makepkg's debug option, yapfast-debug gets full debug info for yapfast's own crates and line
  # tables for the dependencies, which shrinks the binary makepkg has to split and strip. makepkg's
  # -C debuginfo=2 would apply to every crate, so it is taken out of RUSTFLAGS; the release profile
  # strips at link time (Cargo.toml), so that is turned off too.
  local _debug=()
  if check_option debug y; then
    RUSTFLAGS=$(sed -E 's/(^| )-C ?debuginfo=[^ ]*//g' <<<"$RUSTFLAGS")
    export CARGO_PROFILE_RELEASE_DEBUG=line-tables-only CARGO_PROFILE_RELEASE_STRIP=false
    local _crate
    for _crate in yapfast yapfast-core yapfast-discord yapfast-ui; do
      _debug+=(--config "profile.release.package.$_crate.debug=\"full\"")
    done
  fi
  # The Discord-only feature set the releases ship.
  cargo build --frozen "${_debug[@]}" --release --no-default-features --features desktop,discord
  # Slint's generated source, which yapfast-debug ships, includes the UI's icons and fonts by absolute
  # path, and no remap flag reaches file contents. The binary holds the bytes, not the paths.
  chmod -R a+rX "${CARGO_HOME:-$HOME/.cargo}/registry/src"
}

# No check(): upstream's tests need a display and its fake Discord server (nix/package.nix).

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/yapfast "$pkgdir/usr/bin/yapfast"
  install -Dm644 packaging/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_id.svg"
  install -Dm644 "packaging/linux/$_id.desktop" "$pkgdir/usr/share/applications/$_id.desktop"
  install -Dm644 "packaging/linux/$_id.metainfo.xml" "$pkgdir/usr/share/metainfo/$_id.metainfo.xml"
  # The UI's typefaces are embedded in the binary, so their licences ship with it; they are not one
  # file, and each covers different faces.
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  local _licence
  for _licence in ui/fonts/LICENSE*; do
    install -Dm644 "$_licence" "$pkgdir/usr/share/licenses/$pkgname/${_licence#ui/fonts/}"
  done
}

latestver() {
  gh api --paginate repos/yapfast/yapfast/tags --jq '.[].name' |
    sed -nE 's/^v([0-9]+(\.[0-9]+)*)$/\1/p' | sort -V | tail -1
}
