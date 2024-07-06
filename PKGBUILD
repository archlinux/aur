# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libx11-git
pkgver=1.8.9.r22.g751fbc59
pkgrel=1
pkgdesc="Core X11 protocol client library"
arch=('i686' 'x86_64')
url="https://www.x.org/wiki/"
license=('LicenseRef-custom')
depends=('glibc' 'libxcb' 'xorgproto')
makedepends=('git' 'xorg-util-macros' 'xtrans')
provides=("libx11=$pkgver")
conflicts=('libx11')
options=('staticlibs')
source=("git+https://gitlab.freedesktop.org/xorg/lib/libx11.git")
sha256sums=('SKIP')


pkgver() {
  cd "libx11"

  git describe --long --tags | sed 's/^libX11-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libx11"

  NOCONFIGURE=1 ./autogen.sh
  CFLAGS="$CFLAGS -ffat-lto-objects" \
  ./configure \
    --prefix="/usr" \
    --disable-xf86bigfont
  make
}

check() {
  cd "libx11"

  #make check
}

package() {
  cd "libx11"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/libx11"
}
