# Maintainer: Sebastian Zwolinski <szwolinski@startmail.com>
#
# UNTESTED DRAFT — build and validate on an Arch system before publishing to the AUR:
#   makepkg -si          # builds + installs; must succeed cleanly
#   namcap PKGBUILD      # lint the recipe
#   namcap peekcam-*.pkg.tar.zst   # lint the built package
# Then regenerate .SRCINFO with:  makepkg --printsrcinfo > .SRCINFO
pkgname=peekcam
pkgver=0.1.1
pkgrel=1
pkgdesc="Movable, always-on-top webcam overlay (shapes, v4l2 controls, snapshot, record, optional background blur)"
arch=('any')
url="https://github.com/sebszwolin777/peekcam"
license=('GPL-3.0-or-later')
depends=(
  'python'
  'python-pyqt6'
  'python-gobject'
  'gstreamer'
  'gst-plugins-base'
  'gst-plugins-good'
  'gst-plugins-bad'
  'v4l-utils'
)
optdepends=(
  'gst-plugins-ugly: H.264 recording via x264enc'
  'python-mediapipe-bin: background blur (prebuilt wheel; the source "python-mediapipe" AUR pkg fails to build)'
  'python-opencv: background blur'
  'python-numpy: background blur'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "selfie_segmenter.tflite::https://storage.googleapis.com/mediapipe-models/image_segmenter/selfie_segmenter/float16/latest/selfie_segmenter.tflite"
)
sha256sums=(
  'ec7757a35ce908b48d517d5cb3ead1091992514792cb28a483234ad658d9ae7d'
  '191ac9529ae506ee0beefa6b2c945a172dab9d07d1e802a290a4e4038226658b'
)

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"

  # Python package + (unused) entry-point script; we replace the launcher below.
  python -m installer --destdir="$pkgdir" dist/*.whl

  # App data: assets + segmentation model -> /usr/share/peekcam
  install -Dm644 assets/peekcam.png "$pkgdir/usr/share/peekcam/assets/peekcam.png"
  install -Dm644 "$srcdir/selfie_segmenter.tflite" \
    "$pkgdir/usr/share/peekcam/models/selfie_segmenter.tflite"

  # Icons
  for sz in 48 64 128 256; do
    install -Dm644 "assets/peekcam-$sz.png" \
      "$pkgdir/usr/share/icons/hicolor/${sz}x${sz}/apps/peekcam.png"
  done

  # Desktop entry + license
  install -Dm644 peekcam.desktop "$pkgdir/usr/share/applications/peekcam.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Launcher: force the xcb platform (always-on-top needs X11/XWayland) and point the
  # app's data_dir() at the packaged /usr/share/peekcam. Overwrites the wheel's script.
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/peekcam" <<'LAUNCH'
#!/bin/sh
export QT_QPA_PLATFORM="${QT_QPA_PLATFORM:-xcb}"
export PEEKCAM_DATA_DIR="${PEEKCAM_DATA_DIR:-/usr/share/peekcam}"
exec python -m peekcam "$@"
LAUNCH
}
