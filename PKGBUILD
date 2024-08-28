# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=frog-ocr
pkgver=1.5.2
pkgrel=1
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
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/TenderOwl/Frog/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('cd4aabbf2f065661d664734e00d572844951bef69c756a5352860f5a9b36e5fc')

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
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"

  cd Frog-$pkgver
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}
