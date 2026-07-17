# Maintainer: Fovty <38868829+Fovty@users.noreply.github.com>
pkgname=hushmic
pkgver=0.3.0
pkgrel=1
pkgdesc="Real-time microphone noise suppression as a virtual mic (DPDFNet via PipeWire)"
arch=('x86_64')
url="https://github.com/Fovty/hushmic"
license=('MIT OR Apache-2.0')
depends=('pipewire' 'pipewire-pulse' 'wireplumber' 'onnxruntime')
makedepends=('rust' 'cargo' 'python' 'curl')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('84417cb490560afc08ad7548b3119a76d300ac5a7214ae5340dbebc0db4f2da3')
# GitHub archive dirs use the CANONICAL repo name (Fovty/HushMic), so the
# tarball extracts to HushMic-<ver>/ regardless of the URL's casing.
_srcname="HushMic-$pkgver"

prepare() {
  cd "$srcdir/$_srcname"
  # All network happens here (makepkg contract): crate deps for the offline
  # build below, plus the sha256-pinned models + ONNX Runtime that the source
  # tarball does not carry (they are gitignored; setup-assets.sh verifies them).
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  ./scripts/setup-assets.sh
}

build() {
  cd "$srcdir/$_srcname"
  # Bake the install-layout paths into the plugin. On Arch we depend on the
  # system onnxruntime package; confirm its dylib path with
  #   pacman -Ql onnxruntime | grep libonnxruntime.so
  # (typically /usr/lib/libonnxruntime.so). If that package is < 1.24, bundle
  # our own .so under /usr/lib/hushmic/ instead (as the .deb does) and point
  # HUSHMIC_BUILD_DYLIB there.
  export HUSHMIC_BUILD_MODEL=/usr/share/hushmic/models/dpdfnet8_48khz_hr.onnx
  export HUSHMIC_BUILD_DYLIB=/usr/lib/libonnxruntime.so
  # Remap the build dir out of the binary: glutin's generated GL bindings
  # otherwise bake $srcdir into panic strings (a namcap "$srcdir reference"
  # warning and non-reproducible output).
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/build"
  cargo build --release --frozen
}

package() {
  cd "$srcdir/$_srcname"
  install -Dm755 target/release/hushmic "$pkgdir/usr/bin/hushmic"
  # The tray resolves the ONNX Runtime at /usr/lib/hushmic/libonnxruntime.so
  # (falling back to the system lib); make the packaged layout self-consistent
  # by pointing the expected path at the system onnxruntime dependency.
  install -d -m 755 "$pkgdir/usr/lib/hushmic"
  ln -s ../libonnxruntime.so "$pkgdir/usr/lib/hushmic/libonnxruntime.so"
  install -Dm644 target/release/libdpdfnet_ladspa.so "$pkgdir/usr/lib/ladspa/libdpdfnet_ladspa.so"
  install -Dm644 assets/models/dpdfnet8_48khz_hr.onnx "$pkgdir/usr/share/hushmic/models/dpdfnet8_48khz_hr.onnx"
  install -Dm644 assets/models/dpdfnet2_48khz_hr.onnx "$pkgdir/usr/share/hushmic/models/dpdfnet2_48khz_hr.onnx"
  install -Dm644 packaging/hushmic.desktop "$pkgdir/usr/share/applications/hushmic.desktop"
  install -Dm644 packaging/hushmic-256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/hushmic.png"
  # Tray status-icon ladder (three SNI names x eight sizes); explicit installs
  # so a missing size or state fails packaging instead of shipping incomplete.
  for _size in 16x16 22x22 24x24 32x32 48x48 64x64 128x128 256x256; do
    for _icon in hushmic-tray hushmic-tray-off hushmic-tray-error; do
      install -Dm644 "packaging/tray/hicolor/$_size/status/$_icon.png" \
        "$pkgdir/usr/share/icons/hicolor/$_size/status/$_icon.png"
    done
  done
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/hushmic/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/hushmic/LICENSE-APACHE"
}
