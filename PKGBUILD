# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Nicky726 <nicky726@gmail.com>
# Contributor: Tom Killian <tom@archlinux.org>
# Contributor: Rémy Oudompheng <remyoudompheng@gmail.com>

pkgname=lib32-libtheora
pkgver=1.2.0
pkgrel=1
pkgdesc='Standard encoder and decoder library for the Theora video compression format (32-bit)'
arch=(x86_64)
url='https://www.theora.org/'
license=(BSD-3-Clause)
depends=(
  lib32-glibc
  lib32-libogg
  libtheora
)
makedepends=(
  git
  lib32-libvorbis
)
source=("git+https://github.com/xiph/theora.git#tag=v$pkgver")
b2sums=('50ed821f0a8ee98c95ea638c66740dda5d2346b70742f1834b96f0089d219c9f3b0d0fad539138b7c514f47d968a550fa842bfff22935db748caf6a4c489428c')
validpgpkeys=(17E78AB6BD65A91EE811D60947000F7BB1441DEF) # Ralph Giles <giles@mozilla.com>

prepare() {
  cd theora
  autoreconf -fi
}

build() {
  cd theora

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-examples
  make
}

check() {
  cd theora
  make check
}

package() {
  cd theora
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir"/usr/{include,share}
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE COPYING
}
