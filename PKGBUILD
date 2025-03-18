# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=libzim-glib
pkgver=4.0.0
pkgrel=1
_zts_ver=0.4
epoch=
pkgdesc="Partial GObject/C bindings for libzim"
arch=('x86_64')
url="https://github.com/birros/libzim-glib"
license=('GPL-3.0-or-later')
depends=(
  'glib2'
  'libzim'
)
makedepends=(
  'gobject-introspection'
  'meson'
  'vala'
)
checkdepends=('python-gobject')
provides=('libzim-glib-4.0.so=0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "https://github.com/openzim/zim-testing-suite/releases/download/v${_zts_ver}/zim-testing-suite-${_zts_ver}.tar.gz")
noextract=("zim-testing-suite-${_zts_ver}.tar.gz")
sha256sums=('f5699b35fa4fce9acedb10a518b487c6b7b0050daf25ba661c0a5d9b817de7e5'
            'c4c8f0c157b21b8e0c81ce016d2a92b528b2972acb76d5a5d9e04d934fa2e742')

prepare() {
  cd "$pkgname-$pkgver"

  # Copy zim-testing-suite tarball to tests directory
  cp -f "$srcdir/zim-testing-suite-${_zts_ver}.tar.gz" src/tests/testdata

  # Don't download zim-testing-suite tarball during build
  sed -i '/curl -L/d' src/tests/testdata/Makefile
}

build() {
  arch-meson "$pkgname-$pkgver" build -Dtests=true
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
