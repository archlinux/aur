# Maintainer: Adrien Peslerbe <adrien@pesler.be>
# Arch/Manjaro source package for Veshell.
#
# Generated from templates/PKGBUILD.in by
# scripts/render-recipes.py. Do not edit by hand.
#
# Builds the Dart shell and the Rust compositor from source, entirely offline.
# All external Flutter inputs are pinned and checksummed: the official Flutter
# SDK bundle, the matching engine artifacts, and the portable embedder
# engine. `build-veshell.sh` is a copy of scripts/build-veshell.sh.
#
# The two generated inputs (Cargo vendor tree, Dart pub cache) are published
# alongside each release. Regenerate and refresh their checksums with
# scripts/generate-inputs.sh, then re-render this recipe.

pkgname=veshell
pkgver=0.2.8
pkgrel=1
pkgdesc="An innovative Not-Desktop environment for Linux built with Flutter and Rust"
arch=('x86_64')
url="https://github.com/free-explorers/veshell"
license=('GPL-3.0-or-later')
depends=(
  'fontconfig' 'ttf-roboto' 'noto-fonts' 'noto-fonts-cjk' 'noto-fonts-emoji'
  'libglvnd' 'mesa'
  'libinput' 'seatd' 'systemd-libs' 'libxkbcommon' 'libxkbcommon-x11'
  'libdisplay-info' 'wayland'
  'pipewire' 'libpulse'
  'gst-plugins-base' 'gst-plugins-base-libs' 'gst-plugins-good'
  'dbus' 'upower' 'polkit' 'pam'
  'xorg-xwayland' 'xdg-desktop-portal' 'xdg-utils'
)
makedepends=(
  'rust' 'clang' 'cmake' 'ninja' 'pkgconf' 'git'
  'unzip' 'zstd' 'xz'
  'gtk3' 'libpulse'
  'libinput' 'seatd' 'mesa' 'openssl' 'pam'
  'pipewire' 'gstreamer' 'gst-plugins-base-libs'
  'libxkbcommon' 'libdisplay-info' 'wayland' 'systemd-libs'
  'vulkan-icd-loader'
)
optdepends=(
  'networkmanager: network control panel'
  'bluez: Bluetooth control panel'
  'rtkit: real-time audio scheduling'
  'fprintd: fingerprint unlock on the lock screen'
  'xdg-desktop-portal-gtk: GTK portal fallback backend'
)
# Lock screen PAM services: keep local edits across upgrades.
backup=('etc/pam.d/veshell' 'etc/pam.d/veshell-fingerprint')
provides=('wayland-compositor')
conflicts=('veshell-git')
# This silences the distribution's C LTO, and only that. makepkg's global `lto`
# option adds -flto to CFLAGS; the libspa-sys build script would then compile a C
# shim into GCC LTO objects, which rustc's final link cannot resolve because it
# does not pass -flto to the linker. The Rust code is optimized separately with
# ThinLTO through Cargo's [profile.release], so nothing is given up here.
options=('!lto')

# --- pinned inputs ----------------------------------------------------------
_veshell_commit=eacf7a4b5812559fe9614ee25f57aee738d82d11
_flutter_version=3.50.1
_flutter_engine_revision=4d35714800b9266b6693a58e1225ecd7e9e45ed7
_input_mirror="${VESHELL_INPUT_MIRROR:-https://github.com/free-explorers/veshell-packaging/releases/download/packaging-inputs-v0.2.8}"

source=(
  "veshell::git+https://github.com/free-explorers/veshell.git#commit=$_veshell_commit"
  "build-veshell.sh"
  "flutter_linux_${_flutter_version}-stable.tar.xz::https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.50.1-stable.tar.xz"
  "flutter_patched_sdk.zip::https://storage.googleapis.com/flutter_infra_release/flutter/4d35714800b9266b6693a58e1225ecd7e9e45ed7/flutter_patched_sdk.zip"
  "flutter_patched_sdk_product.zip::https://storage.googleapis.com/flutter_infra_release/flutter/4d35714800b9266b6693a58e1225ecd7e9e45ed7/flutter_patched_sdk_product.zip"
  "linux-x64_artifacts.zip::https://storage.googleapis.com/flutter_infra_release/flutter/4d35714800b9266b6693a58e1225ecd7e9e45ed7/linux-x64/artifacts.zip"
  "linux-x64-debug_flutter-gtk.zip::https://storage.googleapis.com/flutter_infra_release/flutter/4d35714800b9266b6693a58e1225ecd7e9e45ed7/linux-x64-debug/linux-x64-flutter-gtk.zip"
  "linux-x64-profile_flutter-gtk.zip::https://storage.googleapis.com/flutter_infra_release/flutter/4d35714800b9266b6693a58e1225ecd7e9e45ed7/linux-x64-profile/linux-x64-flutter-gtk.zip"
  "linux-x64-release_flutter-gtk.zip::https://storage.googleapis.com/flutter_infra_release/flutter/4d35714800b9266b6693a58e1225ecd7e9e45ed7/linux-x64-release/linux-x64-flutter-gtk.zip"
  "linux-engine-sdk-release-x86_64-${_flutter_engine_revision}.tar.gz::https://github.com/free-explorers/flutter-engine/releases/download/linux-engine-sdk-release-x86_64-4d35714800b9266b6693a58e1225ecd7e9e45ed7-veshell.2/linux-engine-sdk-release-x86_64-4d35714800b9266b6693a58e1225ecd7e9e45ed7-veshell.2.tar.gz"
  "veshell-cargo-vendor-0.2.8.tar.zst::$_input_mirror/veshell-cargo-vendor-0.2.8.tar.zst"
  "veshell-pubcache-0.2.8.tar.zst::$_input_mirror/veshell-pubcache-0.2.8.tar.zst"
)
sha256sums=(
  'SKIP'  # pinned git commit
  '2f0a6a046d1f2efa20b913ae7a6f12b1aacde769c717482716e34ddbf5746d70'  # build-veshell.sh
  '4ad17fc8462fbcef2ba19ff4a78c0a16b7147fde1add8578e267ea62cdb92678'  # Flutter SDK
  '6a323c81b94ef16fa6bc0d051768aa0b4e7c2f24356b58f491752623f4a063a0'  # patched_sdk
  '8af7e44890f905b8d4b4cac894f6f937ddab3b48aa40eee59c41f2fde941e6cd'  # patched_sdk_product
  '572f5ac049fb8adb21a442329eeaa866328971792f28c20302fa8a99bea583d8'  # linux-x64 artifacts
  'b1d5701aac2944005b96872e768201d5ceb7e3f90d99acd34e827f5db8fd62de'  # linux-x64 debug gtk
  '9949f8e366c7c8cf4d9a50fade6607f3f32c8de7b03e79cca0b33968a09de3c5'  # linux-x64 profile gtk
  'aac268d6421af245e9ce03f371e846ad2e6b6aa8a91333a2f9a78a8c119ac54d'  # linux-x64 release gtk
  'd1860d06a4cdbab158dbe3fc5bb6b0aef4eb84729bb966e1ed75b3f2d3b24984'  # embedder engine
  '071b2acc0d31b1cb9ce0e1a29fd57b847fdd615ab928c6cf314ceb54442c00ec'  # cargo vendor
  '59dcb246d0b981b8821638596e256398373825d928b3311ca60489217e1d1401'  # pub cache
)

# The helper extracts every archive itself (into deterministic locations);
# let makepkg keep the raw sources untouched.
noextract=(
  "flutter_linux_${_flutter_version}-stable.tar.xz"
  "flutter_patched_sdk.zip"
  "flutter_patched_sdk_product.zip"
  "linux-x64_artifacts.zip"
  "linux-x64-debug_flutter-gtk.zip"
  "linux-x64-profile_flutter-gtk.zip"
  "linux-x64-release_flutter-gtk.zip"
  "linux-engine-sdk-release-x86_64-${_flutter_engine_revision}.tar.gz"
  "veshell-cargo-vendor-0.2.8.tar.zst"
  "veshell-pubcache-0.2.8.tar.zst"
)

prepare() {
  cd veshell
  mkdir -p "$srcdir/flutter-sdk" "$srcdir/cargo-vendor" "$srcdir/pubcache"
  tar -xJf "$srcdir/flutter_linux_${_flutter_version}-stable.tar.xz" \
    -C "$srcdir/flutter-sdk" --strip-components=1
  tar -xf "$srcdir/veshell-cargo-vendor-0.2.8.tar.zst" -C "$srcdir/cargo-vendor"
  tar -xf "$srcdir/veshell-pubcache-0.2.8.tar.zst" -C "$srcdir/pubcache"
}

build() {
  cd veshell
  VESHELL_SRC="$PWD" \
  FLUTTER_SDK_DIR="$srcdir/flutter-sdk" \
  FLUTTER_ARTIFACT_DIR="$srcdir" \
  ENGINE_TARBALL="$srcdir/linux-engine-sdk-release-x86_64-${_flutter_engine_revision}.tar.gz" \
  CARGO_VENDOR_DIR="$srcdir/cargo-vendor" \
  PUB_CACHE_DIR="$srcdir/pubcache" \
  PREFIX=/usr \
  POLKIT_HELPER_PATH=/usr/lib/polkit-1/polkit-agent-helper-1 \
  VESHELL_BUILD_COMMIT="$_veshell_commit" \
  VESHELL_BUILD_CHANNEL="beta" \
  JOBS="$(nproc)" \
  bash "$srcdir/build-veshell.sh" build
}

package() {
  cd veshell
  VESHELL_SRC="$PWD" \
  PREFIX=/usr \
  DESTDIR="$pkgdir" \
  bash "$srcdir/build-veshell.sh" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
