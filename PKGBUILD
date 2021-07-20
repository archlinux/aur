# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgbasename=libx11
pkgname=lib32-$_pkgbasename-git
pkgver=1.6.11
pkgrel=1
pkgdesc="X11 client-side library (32-bit)"
arch=(x86_64)
url="https://xorg.freedesktop.org/"
depends=('lib32-libxcb' $_pkgbasename)
makedepends=('xorg-util-macros' 'xorgproto' 'xtrans' 'gcc-multilib')
provides=(lib32-libx11)
conflicts=(lib32-libx11)
license=('custom:XFREE86')
source=("git+https://gitlab.freedesktop.org/xorg/lib/libx11.git")
sha512sums=('SKIP')
#validpgpkeys=('SKIP') # Alan Coopersmith <alanc@freedesktop.org>
#validpgpkeys+=('SKIP') # Matthieu Herrb <matthieu.herrb@laas.fr>
#validpgpkeys+=('SKIP') # Matt Turner <mattst88@gmail.com>
#validpgpkeys+=('SKIP') # Adam Jackson <ajax@nwnk.net>

pkgver() {
  cd "libx11"

  git describe --long --tags | sed 's/^libX11-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export CC="gcc -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd libx11
  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr --disable-static --disable-xf86bigfont \
      --libdir=/usr/lib32 --disable-specs
  make
}

#check() {
#  cd libX11-${pkgver}

#  make check
#}

package() {
  cd libx11
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share}

  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}

