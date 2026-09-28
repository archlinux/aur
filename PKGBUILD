# Maintainer: Simon Schubert <simon@librem.one>
#
# Food as an app: the QML tree in /usr/share/moarchy-food, started by
# /usr/bin/moarchy-food, which opens it in the running Omarchy shell when the
# plugin is installed there and as its own Quickshell process everywhere else.
#
# The camera is not QML. /usr/lib/moarchy-food/moarchy-food-scan is a small
# Python + GStreamer process -- v4l2src, and zbar from gst-plugins-bad -- that
# the app starts while its scan page is open and that prints each barcode it
# sees as a line. That is the whole of the Python in this package now.
#
# 0.1.0 was a GTK4/libadwaita app. 0.2.0 reads and writes the same
# ~/.local/share/moarchy-food/history.json and products.json, so a history
# scanned in one is the history found in the other.
pkgname=moarchy-food
pkgver=0.2.0
pkgrel=1
pkgdesc='Point the camera at a barcode: nutrition facts from Open Food Facts, for Quickshell'
arch=('any')
url='https://github.com/SimonSchubert/moarchy-apps'
license=('MIT')
# curl is the lookup and the picture. The scanner needs GStreamer's Python
# bindings, v4l2src and jpegenc (good), and the zbar element (bad, with zbar
# itself). gtk4, libadwaita and gst-plugin-gtk4 are no longer needed.
depends=('quickshell' 'curl' 'ttf-jetbrains-mono-nerd' 'hicolor-icon-theme'
         'python' 'python-gobject' 'gstreamer' 'gst-plugins-base'
         'gst-plugins-good' 'gst-plugins-bad' 'zbar')
# A release asset that packaging/release.sh builds from apps/food at the tag,
# with shared/kit in place of the kit link.
source=("$url/releases/download/food-v$pkgver/$pkgname-$pkgver.tar.gz")
# Pinned in the commit after the tag, as every app's here is.
sha256sums=('0d049c582ab142e202747f2e3002b863afdb1a79b16bbe26872bc1d83c62ccc7')

check() {
  cd "$pkgname-$pkgver"
  # Open Food Facts' JSON, the barcodes and the two files, against records
  # written by hand; then the scanner's protocol through its fake. No display,
  # no camera and no network needed.
  QT_QPA_PLATFORM=offscreen /usr/lib/qt6/bin/qmltestrunner -input tests
  python3 -m unittest discover -s tests -p 'test_*.py'
}

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/$pkgname/kit"
  install -m644 manifest.json ./*.qml ./*.js icon.svg "$pkgdir/usr/share/$pkgname/"
  install -m644 kit/*.qml kit/*.js "$pkgdir/usr/share/$pkgname/kit/"

  install -Dm755 libexec/moarchy-food-scan "$pkgdir/usr/lib/$pkgname/moarchy-food-scan"
  install -Dm755 bin/moarchy-food "$pkgdir/usr/bin/moarchy-food"
  install -Dm644 org.moarchy.Food.desktop \
    "$pkgdir/usr/share/applications/org.moarchy.Food.desktop"
  install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.moarchy.Food.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
