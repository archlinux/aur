# Maintainer: Michael Langer <laminarlade at t-online DOT de>
pkgname=gradia
pkgver=1.8.0
pkghash=a37ecdcf257708a5ba32e4162d02315bbfa7b377
pkgrel=1
pkgdesc="Make your screenshots ready for the world."
arch=('x86_64')
url="https://github.com/AlexanderVanhee/Gradia"
license=('GPL-3.0-only')
depends=(
    'glib2'
    'gtk4>=4.12.0'
    'libadwaita>=1.5.0'
    'libportal>=0.9.1'
    'gtksourceview5>=5.16.0'
    'python'
    'python-gobject>=3.48.0'
    'python-pillow'
    'python-pillow-avif-plugin'
    'python-cairo'
)
makedepends=(
    'patch'
    'meson'
    'blueprint-compiler'
)
source=(
    "$pkgname-$pkgver.zip::${url}/archive/$pkghash.zip"
    'pillow_avif.patch'
)
sha256sums=('d4f990f2472dbc31bb4424ef768bc0ac0df105894a747a237a202ea41212473d'
            '5080f87f3b2f2b7360c6afebe333e7b8b09ef2017cc0f20b95d364df83bf3528')

prepare() {
  mv Gradia-$pkghash $pkgname-$pkgver

# pillow for arch has no avif support (yet)
  patch -p1 -d "$srcdir/$pkgname-$pkgver" -i "$srcdir/pillow_avif.patch"
}

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
