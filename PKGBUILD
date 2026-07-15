# Maintainer: Fovty <38868829+Fovty@users.noreply.github.com>
pkgname=hushmic-bin
_srcname=hushmic
pkgver=0.2.1
pkgrel=1
pkgdesc="Real-time microphone noise suppression as a virtual mic (DPDFNet via PipeWire) — prebuilt binary"
arch=('x86_64')
url="https://github.com/Fovty/hushmic"
license=('MIT OR Apache-2.0')
# No 'onnxruntime': this package ships the ONNX Runtime the release was built
# and tested against under /usr/lib/hushmic/ (the source package links the
# system one instead). No rust/cargo/python either — nothing is compiled here.
# glibc/gcc-libs back the prebuilt ELFs; pipewire* and wireplumber are invoked
# as subprocesses, so namcap cannot see them from the linkage alone.
depends=('pipewire' 'pipewire-pulse' 'wireplumber'
         'glibc' 'gcc-libs' 'hicolor-icon-theme')
provides=("hushmic=$pkgver")
conflicts=('hushmic')
# Prebuilt payload: stripping it would only churn the binary and the 23 MB
# bundled ONNX Runtime, and debug extraction has no sources to point at.
options=('!strip' '!debug')
source=("$url/releases/download/v$pkgver/hushmic-$pkgver-x86_64.tar.gz")
sha256sums=('4c6e24cd15c896ba44aa9a4a9d06e818019754f319abacdb8b30bfd1230a41a5')

package() {
  cd "$srcdir/hushmic-$pkgver-x86_64"

  install -Dm755 bin/hushmic "$pkgdir/usr/bin/hushmic"

  # The tray resolves these relative to the binary's install prefix
  # (/usr/bin/hushmic -> /usr), so the layout below must stay lib/ladspa,
  # lib/hushmic and share/hushmic — see Paths::resolve() in controller.rs.
  install -Dm644 lib/ladspa/libdpdfnet_ladspa.so \
    "$pkgdir/usr/lib/ladspa/libdpdfnet_ladspa.so"

  # cp -a, not install: libonnxruntime.so -> .so.1 -> .so.1.27.0 is a soname
  # symlink chain, and only the real file may be copied as a regular file.
  install -d -m755 "$pkgdir/usr/lib/hushmic"
  cp -a lib/hushmic/libonnxruntime.so* "$pkgdir/usr/lib/hushmic/"

  install -Dm644 share/hushmic/models/dpdfnet8_48khz_hr.onnx \
    "$pkgdir/usr/share/hushmic/models/dpdfnet8_48khz_hr.onnx"
  install -Dm644 share/hushmic/models/dpdfnet2_48khz_hr.onnx \
    "$pkgdir/usr/share/hushmic/models/dpdfnet2_48khz_hr.onnx"

  install -Dm644 share/applications/hushmic.desktop \
    "$pkgdir/usr/share/applications/hushmic.desktop"

  # App icon + the tray status ladder (three SNI names x eight sizes); a plain
  # copy of the tree keeps every size/state the release ships.
  find share/icons -type f -name '*.png' -print0 | while IFS= read -r -d '' _icon; do
    install -Dm644 "$_icon" "$pkgdir/usr/$_icon"
  done

  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
