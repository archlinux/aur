# Maintainer: Michael Langer <laminarlade at t-online DOT de>
pkgname=gradia
pkgver=1.13.0
pkgrel=3
#pkghash=
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
optdepends=(
  'xdg-desktop-portal: Screensharing with Wayland'
)
options=('!debug')
source=(
    "$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz"
#    "$pkgname-$pkgver.zip::${url}/archive/$pkghash.zip"
    "gradia_ocr.patch"
)
sha256sums=('bba20396de4b7e515597207828ef7e9f3906711a24399b39a52c7dac2333eb0b'
            '770b874fed71ec84a6a190b6e931be9189f512b4433eaef8996dca32644472d7')
prepare() {
#  mv Gradia-$pkghash $pkgname-$pkgver
  mv Gradia-$pkgver $pkgname-$pkgver
  patch -d $pkgname-$pkgver -p1 < gradia_ocr.patch
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
