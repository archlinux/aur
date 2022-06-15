# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=frog-ocr
pkgver=1.1.3
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
sha256sums=('8d9a2cb7e24961790b7e3e5e54b62f9598de4c01aa97d668911b03fb7029ebe4')

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
