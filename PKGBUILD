# Maintainer: Michael Langer <laminarlade at t-online DOT de>
pkgname=gradia
pkgver=1.7.1
pkgrel=2
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
    "$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz"
    'pillow_avif.patch'
)
sha256sums=('8d3c2fc1bb1d4ae94ec05e5089c68771de3f68b43f4eb96083c7c74906667da3'
            '5080f87f3b2f2b7360c6afebe333e7b8b09ef2017cc0f20b95d364df83bf3528')

prepare() {
  mv Gradia-$pkgver $pkgname-$pkgver

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
