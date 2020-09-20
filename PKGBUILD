# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

pkgname=lib32-libxcursor-git
pkgver=1.2.0
pkgrel=1
pkgdesc="X cursor management library (32-bit)"
arch=(x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
provides=(lib32-libxcursor)
conflicts=(lib32-libxcursor)
depends=('lib32-libxfixes' 'lib32-libxrender' libxcursor)
makedepends=('xorg-util-macros')
source=(git+https://gitlab.freedesktop.org/xorg/lib/libxcursor)
sha256sums=('SKIP')

pkgver() {
  cd libxcursor
  git describe --tags | sed 's/-/+/g'
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd libxcursor
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --disable-static --libdir=/usr/lib32
  make
}

package() {
  cd libxcursor

  make DESTDIR=${pkgdir} install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
