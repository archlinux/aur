# Maintainer: Capi Etheriel <barraponto at gmail dot com>
# Based on work by Mark Wagie <mark dot wagie at proton dot me>
pkgname=frog-ocr-no-telemetry
pkgver=1.5.1
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
makedepends=('git' 'blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
install="$pkgname.install"
_commit=18959b465b5bb7a060d2afd7dd848b56df8b8286  # tags/1.5.1^0
source=("git+https://github.com/TenderOwl/Frog.git#commit=${_commit}" "no-telemetry.patch::https://github.com/barraponto/Frog/commit/7d499d6a88f23f52df0b3b1d781d6d60fde07fe8.patch")
sha256sums=('SKIP' '7500e593cdd065997a1f42e552e99923f3cd9c89aebef7d5bee6f05d8c545eb8')

pkgver() {
  cd Frog
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd Frog

  # remove telemetry
  patch --forward --strip=1 --input="${srcdir}/no-telemetry.patch"

  # Fix path to appdata
  sed -i 's|/app/share/|/usr/share/|g' frog/language_manager.py
}

build() {
  arch-meson Frog build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"

  cd Frog
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}
