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
pkgver=0.1.3
pkgrel=1
pkgdesc="An innovative Not-Desktop environment for Linux built with Flutter and Rust"
arch=('x86_64')
url="https://github.com/free-explorers/veshell"
license=('GPL-3.0-or-later')
depends=(
  'fontconfig' 'ttf-roboto' 'noto-fonts' 'noto-fonts-cjk'
  'libglvnd' 'mesa'
  'libinput' 'seatd' 'systemd-libs' 'libxkbcommon' 'libxkbcommon-x11'
  'libdisplay-info' 'wayland'
  'pipewire' 'libpulse'
  'gst-plugins-base' 'gst-plugins-base-libs' 'gst-plugins-good'
  'dbus' 'upower' 'polkit'
  'xorg-xwayland' 'xdg-desktop-portal' 'xdg-utils'
)
makedepends=(
  'rust' 'clang' 'cmake' 'ninja' 'pkgconf' 'git'
  'unzip' 'zstd' 'xz'
  'gtk3' 'libpulse'
  'libinput' 'seatd' 'mesa' 'openssl'
  'pipewire' 'gstreamer' 'gst-plugins-base-libs'
  'libxkbcommon' 'libdisplay-info' 'wayland' 'systemd-libs'
  'vulkan-icd-loader'
)
optdepends=(
  'networkmanager: network control panel'
  'bluez: Bluetooth control panel'
  'rtkit: real-time audio scheduling'
  'xdg-desktop-portal-gtk: GTK portal fallback backend'
)
provides=('wayland-compositor')
conflicts=('veshell-git')
# This silences the distribution's C LTO, and only that. makepkg's global `lto`
# option adds -flto to CFLAGS; the libspa-sys build script would then compile a C
# shim into GCC LTO objects, which rustc's final link cannot resolve because it
# does not pass -flto to the linker. The Rust code is optimized separately with
# ThinLTO through Cargo's [profile.release], so nothing is given up here.
options=('!lto')

# --- pinned inputs ----------------------------------------------------------
_veshell_commit=fdba188e4d0ef2bda6c342dd042db2afebadd0f2
_flutter_version=3.47.7
_flutter_engine_revision=deb287481e3ce9468f3434937ced4240a70539ca
_input_mirror="${VESHELL_INPUT_MIRROR:-https://github.com/free-explorers/veshell-packaging/releases/download/packaging-inputs-v0.1.3}"

source=(
  "veshell::git+https://github.com/free-explorers/veshell.git#commit=$_veshell_commit"
  "build-veshell.sh"
  "flutter_linux_${_flutter_version}-stable.tar.xz::https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.47.7-stable.tar.xz"
  "flutter_patched_sdk.zip::https://storage.googleapis.com/flutter_infra_release/flutter/deb287481e3ce9468f3434937ced4240a70539ca/flutter_patched_sdk.zip"
  "flutter_patched_sdk_product.zip::https://storage.googleapis.com/flutter_infra_release/flutter/deb287481e3ce9468f3434937ced4240a70539ca/flutter_patched_sdk_product.zip"
  "linux-x64_artifacts.zip::https://storage.googleapis.com/flutter_infra_release/flutter/deb287481e3ce9468f3434937ced4240a70539ca/linux-x64/artifacts.zip"
  "linux-x64-debug_flutter-gtk.zip::https://storage.googleapis.com/flutter_infra_release/flutter/deb287481e3ce9468f3434937ced4240a70539ca/linux-x64-debug/linux-x64-flutter-gtk.zip"
  "linux-x64-profile_flutter-gtk.zip::https://storage.googleapis.com/flutter_infra_release/flutter/deb287481e3ce9468f3434937ced4240a70539ca/linux-x64-profile/linux-x64-flutter-gtk.zip"
  "linux-x64-release_flutter-gtk.zip::https://storage.googleapis.com/flutter_infra_release/flutter/deb287481e3ce9468f3434937ced4240a70539ca/linux-x64-release/linux-x64-flutter-gtk.zip"
  "linux-engine-sdk-release-x86_64-${_flutter_engine_revision}.tar.gz::https://github.com/free-explorers/flutter-engine/releases/download/linux-engine-sdk-release-x86_64-deb287481e3ce9468f3434937ced4240a70539ca/linux-engine-sdk-release-x86_64-deb287481e3ce9468f3434937ced4240a70539ca.tar.gz"
  "veshell-cargo-vendor-0.1.3.tar.zst::$_input_mirror/veshell-cargo-vendor-0.1.3.tar.zst"
  "veshell-pubcache-0.1.3.tar.zst::$_input_mirror/veshell-pubcache-0.1.3.tar.zst"
)
sha256sums=(
  'SKIP'  # pinned git commit
  '73dd315ec63d0087aefb1faba324a30f1cd716dcd6c220af8bebe13ca55ff458'  # build-veshell.sh
  'af7455f540df951184c7953fbe3cf884766e7541dacf8571f9f582db03dd6230'  # Flutter SDK
  'e80fa5e63f51751507627456294bef28419c4facd09c33f7f49a7b4d986846f3'  # patched_sdk
  '8b2ad98bd8c2f86e647da5c3863de0ffb34dc00887a005c8074971ebd76e4454'  # patched_sdk_product
  '1a716b779bc669def11c0ebac97d5400efa201824419fe67397802ffe5cdb756'  # linux-x64 artifacts
  'e1ed3d3ccc0d42d1dc58fa141dc83c4be511e5a2a1cbe0319c2aa8ae6afeadc4'  # linux-x64 debug gtk
  '853bee7a69edf5931f02121086118bd8dbfe01d081192c6d6cae232b1abede47'  # linux-x64 profile gtk
  'a6da7b0d57c82519d7b901462344676fe089068caca336466dcf3e1c270e9aa8'  # linux-x64 release gtk
  '7f111525f32a590d1f00526758f1fecb520424b98aecc6afac82d5014a1684c7'  # embedder engine
  '1c1863bdf68ca0f3cb6640b8f512f000ad3e1af034feef3a7603b34e654ad703'  # cargo vendor
  'b4d45bf1b366e08a4d14271d61f9b74167e056aee66a649daae43a4b6062f9d3'  # pub cache
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
  "veshell-cargo-vendor-0.1.3.tar.zst"
  "veshell-pubcache-0.1.3.tar.zst"
)

prepare() {
  cd veshell
  mkdir -p "$srcdir/flutter-sdk" "$srcdir/cargo-vendor" "$srcdir/pubcache"
  tar -xJf "$srcdir/flutter_linux_${_flutter_version}-stable.tar.xz" \
    -C "$srcdir/flutter-sdk" --strip-components=1
  tar -xf "$srcdir/veshell-cargo-vendor-0.1.3.tar.zst" -C "$srcdir/cargo-vendor"
  tar -xf "$srcdir/veshell-pubcache-0.1.3.tar.zst" -C "$srcdir/pubcache"
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
