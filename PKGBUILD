# Maintainer: Michael Langer <laminarlade at t-online DOT de>
pkgname=gradia
pkgver=1.5.0
pkgrel=2
pkgdesc="Make your screenshots ready for the world."
arch=('x86_64')
url="https://github.com/AlexanderVanhee/Gradia"
license=('GPL-3.0-only')
depends=(
    'gtk4'
    'python'
    'python-gobject'
    'python-pillow'
    'python-pillow-avif-plugin'
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
sha256sums=('c152acf17c0fc03a5c6f8530b5b0e927c4f4a365fed58ac840b1b22417868917'
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
