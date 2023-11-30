# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=frog-ocr
pkgver=1.4.2+37+gf3490b6
pkgrel=1
pkgdesc="Intuitive text extraction tool (OCR) for GNOME."
arch=('any')
url="https://tenderowl.com/work/frog"
license=('MIT')
depends=('leptonica' 'libadwaita' 'libnotify' 'libportal' 'python-dateutil'
         'python-gobject' 'python-gtts' 'python-pillow' 'python-pydbus'
         'python-pytesseract' 'pyzbar')
makedepends=('git' 'blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
install="$pkgname.install"
_commit=f3490b63f1769968652131f59bda49caa947abb2  # branch/master
source=("git+https://github.com/TenderOwl/Frog.git#commit=${_commit}")
#source=("Frog-$pkgver.tar.gz::https://github.com/TenderOwl/Frog/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('SKIP')

pkgver() {
  cd Frog
  git describe --tags | sed 's/-/+/g'
}

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
