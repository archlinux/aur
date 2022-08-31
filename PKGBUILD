# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=frog-ocr
pkgver=1.2.0
pkgrel=1
pkgdesc="Intuitive text extraction tool (OCR) for GNOME."
arch=('any')
url="https://tenderowl.com/work/frog"
license=('MIT')
depends=('leptonica' 'libadwaita' 'libnotify' 'libportal' 'python-gobject'
         'python-pydbus' 'python-pytesseract' 'pyzbar')
makedepends=('meson')
checkdepends=('appstream-glib')
install="$pkgname.install"
source=("Frog-$pkgver.tar.gz::https://github.com/TenderOwl/Frog/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b2445c54f7d2b064f7ccf20be4ffcf34b689ec85e64284ac9dee91ad9f128b44')

prepare() {
  cd "Frog-$pkgver"

  # Fix path to appdata
  sed -i 's|/app/share/|/usr/share/|g' frog/language_manager.py
}

build() {
  arch-meson "Frog-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"

  cd "Frog-$pkgver"
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}
