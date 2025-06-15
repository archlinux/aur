# Maintainer: Michael Langer <laminarlade at t-online DOT de>
pkgname=gradia
pkgver=1.4.3
pkgrel=1
pkgdesc="Make your screenshots ready for the world."
arch=('x86_64')
url="https://github.com/AlexanderVanhee/Gradia"
license=('GPL3')
depends=(
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
sha256sums=(
    '3633f62a38c05d40e9bfacf795b0f844e810f64569665fd1f6021fb24d3a8256'
    '5080f87f3b2f2b7360c6afebe333e7b8b09ef2017cc0f20b95d364df83bf3528'
)

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
