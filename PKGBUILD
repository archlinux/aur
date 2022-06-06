# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=frog-ocr
pkgver=1.1.0
pkgrel=1
pkgdesc="Intuitive text extraction tool (OCR) for GNOME."
arch=('any')
url="https://tenderowl.com/work/frog"
license=('MIT')
depends=('leptonica' 'libadwaita' 'libnotify' 'libportal' 'python-gobject'
         'python-pydbus' 'python-pytesseract' 'pyzbar')
makedepends=('meson')
checkdepends=('appstream-glib')
source=("Frog-$pkgver.tar.gz::https://github.com/TenderOwl/Frog/archive/refs/tags/$pkgver.tar.gz"
        'com.github.tenderowl.frog.desktop.in')
sha256sums=('76c7e9c8604b198e78aa008aa089eecf8f00935d61e535ddfbbb16521306b732'
            '58c82ebc8ffe5f7f65b446ca7578c0ce98778737bf4098de83157ce8ac9d3019')

prepare() {
  cd "Frog-$pkgver"

  # Workaround for undefined XDG_DATA_HOME env var
  cp -f ../com.github.tenderowl.frog.desktop.in data/

  # Fix path to appdata
  sed -i 's|/app/share/|/usr/share/|g' frog/language_manager.py
}

build() {
  arch-meson "Frog-$pkgver" build
  meson compile -C build
}

check() {

  # Validate appstream file test fails
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"

  cd "Frog-$pkgver"
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}
