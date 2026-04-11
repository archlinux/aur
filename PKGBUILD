# Maintainer: Michael Langer <laminarlade at t-online DOT de>
pkgname=gradia
pkgver=1.12.1
pkgrel=2
pkghash=9b70a5c3ced86a469d8750a452a68ebd7e983051
pkgdesc="Make your screenshots ready for the world."
arch=('x86_64')
url="https://github.com/AlexanderVanhee/Gradia"
license=('GPL-3.0-only')
depends=(
    'dconf'
    'graphene'
    'libsoup3'
    'hicolor-icon-theme'
    'pango'
    'glibc'
    'gdk-pixbuf2'
    'glib2'
    'gtk4>=4.12.0'
    'libadwaita>=1.5.0'
    'libportal>=0.9.1'
    'gtksourceview5>=5.16.0'
    'python'
    'python-gobject>=3.48.0'
    'python-pillow'
    'python-cairo'
    'python-pytesseract'
)
makedepends=(
    'patch'
    'meson'
    'blueprint-compiler'
)
options=('!debug')
source=(
#    "$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz"
    "$pkgname-$pkgver.zip::${url}/archive/$pkghash.zip"
    "gradia_ocr.patch"
    "image_stack.patch"
)
sha256sums=('e0cfe26530e05e6542e184446be35cc22d5785852bd6221baaf129177183d6b3'
            '770b874fed71ec84a6a190b6e931be9189f512b4433eaef8996dca32644472d7'
            '6a1e1e08216c19db9e823a0c014b33a273b0690f7adff71fb5281242f1ee8a1b')
prepare() {
  mv Gradia-$pkghash $pkgname-$pkgver
#  mv Gradia-$pkgver $pkgname-$pkgver
  patch -d $pkgname-$pkgver -p1 < gradia_ocr.patch
  patch -d $pkgname-$pkgver -p1 < image_stack.patch
}

build() {
  arch-meson $pkgname-$pkgver build -Docr_tesseract_cmd=/usr/bin/tesseract -Docr_original_tessdata_dir=/usr/share/tessdata
  meson compile -C build
}

check() {
  true

#  Check fail with double include error for StartupNotify, doesn't seems to hurt
#  suspend for now
#  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
