# Maintainer: sfs <sfslinux@gmail.com>

pkgname=labconf-git
pkgver=1.0.0
pkgrel=2
pkgdesc="GTK3 theme and parameter configurator labwc (obconf-like)"
arch=('x86_64')
url="https://github.com/sfs-pra/labconf"
license=('GPL-3.0-or-later')
depends=(
    'gtk3'
    'glib2'
    'pango'
)
makedepends=(
    'vala'
    'meson'
    'ninja'
    'git'
)
optdepends=(
    'labwc'
)
source=("git+https://github.com/sfs-pra/labconf.git#tag=v${pkgver}")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/labconf"
  git describe --tags | sed 's/^v//'
}

build() {
  cd "$srcdir/labconf"
  arch-meson build \
      --prefix=/usr \
      --buildtype=release \
      -Db_lto=true
  ninja -C build
}

check() {
  cd "$srcdir/labconf"
  meson test -C build --print-errorlogs || true
}

package() {
  cd "$srcdir/labconf"
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}