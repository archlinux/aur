# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=frog-ocr
pkgver=1.5.0
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
  'python-pillow'
  'python-posthog'
  'python-pydbus'
  'python-pytesseract'
  'pyzbar'
)
makedepends=('git' 'blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
install="$pkgname.install"
_commit=429026f0bf94e4c151f1a6262f68c3e32a1e53a3  # 1.5.0
source=("git+https://github.com/TenderOwl/Frog.git#commit=${_commit}")
sha256sums=('SKIP')

#pkgver() {
#  cd Frog
#  git describe --tags | sed 's/-/+/g'
#}

prepare() {
  cd Frog

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
