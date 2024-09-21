# Maintainer: Capi Etheriel <barraponto at gmail dot com>
# Based on work by Mark Wagie <mark dot wagie at proton dot me>
pkgname=frog-ocr-no-telemetry
pkgver=1.5.2
pkgrel=1
pkgdesc="Intuitive text extraction tool (OCR) for GNOME. Patched to remove telemetry."
arch=('any')
url="https://getfrog.app"
license=('MIT')
provides=('frog-ocr')
conflicts=('frog-ocr')
depends=(
  'leptonica'
  'libadwaita'
  'libnotify'
  'libportal'
  'python-dateutil'
  'python-gobject'
  'python-gtts'
  'python-loguru'
  'python-nanoid'
  'python-pillow'
  'python-pydbus'
  'python-pytesseract'
  'pyzbar'
)
makedepends=('blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
install="$pkgname.install"
source=("frog-ocr-$pkgver.tar.gz::https://github.com/TenderOwl/Frog/archive/refs/tags/$pkgver.tar.gz" "no-telemetry.patch::https://github.com/barraponto/Frog/commit/7d499d6a88f23f52df0b3b1d781d6d60fde07fe8.patch")
sha256sums=('cd4aabbf2f065661d664734e00d572844951bef69c756a5352860f5a9b36e5fc' 'b47b92a69fff77c331053b8f6c94e9cea66a5549a54c66bead940b34d2815fe1')

prepare() {
  cd Frog-$pkgver

  # remove telemetry
  patch --forward --strip=1 --input="${srcdir}/no-telemetry.patch"

  # Fix path to appdata
  sed -i 's|/app/share/|/usr/share/|g' frog/language_manager.py
}

build() {
  arch-meson Frog-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"

  cd Frog-$pkgver
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}
