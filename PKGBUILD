# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gawk-gd
_project=gawkextlib
pkgver=1.0.3
pkgrel=6
pkgdesc="GAWK extension - interface to the GD graphics library"
arch=('x86_64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL-3.0-or-later')
depends=('gawkextlib' 'gd' 'glibc')
source=("https://downloads.sourceforge.net/$_project/$pkgname-$pkgver.tar.gz")
md5sums=('08088809eb3a3f647aa5e92d1ac28ce0')
sha256sums=('059406fc0b72c38ca14f422136e3bd29e41ae8acd73440ddd8e743b83340b1ea')

prepare() {
  cd "$pkgname-$pkgver"
  # Temporary workaround to allow the extension to build (with warnings). These
  # warnings are issued because the code has yet to be ported to the Gawk 5
  # API.
  sed -i 's/\(.*do_gd.*(.*, awk_value_t \*result\))$/\1, struct awk_ext_func *unused)/' gd.c
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --enable-silent-rules
  make
}

check() {
  cd "$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
