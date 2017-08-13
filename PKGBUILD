pkgname=opendune
_pkgname=OpenDUNE
pkgver=0.8
pkgrel=2
pkgdesc="Open source re-creation of the popular game Dune II"
arch=('i686' 'x86_64')
url="http://opendune.org"
license=('GPL2')
depends=('sdl' 'sdl_image' 'alsa-lib' 'hicolor-icon-theme' 'dune2-data')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/OpenDUNE/OpenDUNE/archive/$pkgver.tar.gz"
        "dune-data-dir.patch")
sha256sums=('fada4127715e4913553f4dbe8b5ac284ee6080377da62e65ae03f1e1d551dfbd'
            '2f56ac5554790c12e152dca4ba8ad475c143b2deb1f54c47aaa1cce0360188ae')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  # Version information
  echo "${pkgver}		0	${pkgver}" > .ottdrev
  # Tell opendune where to find data files
  patch -p1 < "$srcdir/dune-data-dir.patch"
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  sed -i "s/flags\=\"\$flags\ \-ansi\ \-pedantic\"/:/" config.lib
  ./configure \
    --disable-assert \
    --prefix-dir=/usr \
    --binary-dir=bin \
    --data-dir="share/games/dune2" \
    --install-dir="$pkgdir/"
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make install
  rmdir "${pkgdir}/usr/share/games/dune2"
  rmdir "${pkgdir}/usr/share/games"
}

