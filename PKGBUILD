# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: detto <detto-brumm@freenet.de>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=gtk-engine-murrine
pkgver=0.98.2
pkgrel=5
pkgdesc="GTK2 engine to make your desktop look like a 'murrina', an italian word meaning the art glass works done by Venicians glass blowers."
arch=(x86_64 i686)
url="http://cimitan.com/murrine/project/murrine"
license=(LGPL-3.0-or-later)
depends=(gtk2)
makedepends=(intltool)
source=(https://ftp.gnome.org/pub/GNOME/sources/murrine/0.98/murrine-${pkgver}.tar.xz
		http://deb.debian.org/debian/pool/main/g/gtk2-engines-murrine/gtk2-engines-murrine_${pkgver}-4.debian.tar.xz
        fix-crasher.patch)
sha256sums=('e9c68ae001b9130d0f9d1b311e8121a94e5c134b82553ba03971088e57d12c89'
            'a1383d465e6f388c8b9c2df2e4a595df7e5cc3eecb3b092d2ccc40cbfaaa7845'
            'e33f76ea23e38eecd2921300c7c01ff06ca33f63b9c7810d83d95e47681fe7da')

prepare() {
  cd murrine-${pkgver}
  # https://bugs.archlinux.org/task/48294
  #patch -Np1 -i ../fix-crasher.patch

  for patch in ../debian/patches/*.patch; do
    patch -Np1 < $patch
  done
}

build() {
  cd murrine-${pkgver}
  ./configure \
    --prefix=/usr \
    --enable-animation \
    --enable-animationrtl
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd murrine-${pkgver}
  make DESTDIR="$pkgdir" install
}
