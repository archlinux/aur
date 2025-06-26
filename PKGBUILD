# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=frog-ocr
pkgver=1.6.0
pkgrel=2
pkgdesc="Intuitive text extraction tool (OCR) for GNOME."
arch=('any')
url="https://getfrog.app"
license=('MIT')
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
  'python-posthog'
  'python-pydbus'
  'python-pytesseract'
  'pyzbar'
)
makedepends=(
  'blueprint-compiler'
  'meson'
)
checkdepends=(
  'appstream-glib'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/TenderOwl/Frog/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b9bc8fb77b7ebcc3816fe75a5bb6d5c39207c19e1ac9805e958e2dbcdbe0c0f8')

prepare() {
  cd Frog-$pkgver

  # Fix path to appdata
  sed -i 's|/app/share/|/usr/share/|g' frog/language_manager.py
}

build() {
  arch-meson Frog-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs || :
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  cd Frog-$pkgver
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}
