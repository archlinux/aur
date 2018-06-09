pkgname=opendune
_pkgname=OpenDUNE
pkgver=0.9
pkgrel=1
pkgdesc="Open source re-creation of the popular game Dune II"
arch=('i686' 'x86_64')
url="http://opendune.org"
license=('GPL2')
depends=('sdl2' 'sdl2_image' 'alsa-lib' 'hicolor-icon-theme' 'dune2-data')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/OpenDUNE/OpenDUNE/archive/$pkgver.tar.gz")
sha256sums=('8d5ed67669df1f17a44c097d9b6bee4e0623ce2a37f11938ce9cd77de546d06c')

_dune2_data_dir=share/games/dune2

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  # Version information
  echo "${pkgver}		0	${pkgver}" > .ottdrev
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  sed -i "s/flags\=\"\$flags\ \-ansi\ \-pedantic\"/:/" config.lib
  CFLAGS="-DDUNE_DATA_DIR='\\\"/usr/${_dune2_data_dir}\\\"' $CFLAGS" ./configure \
    --disable-assert \
    --prefix-dir=/usr \
    --binary-dir=bin \
    --data-dir="${_dune2_data_dir}" \
    --install-dir="$pkgdir/"
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make install
  rmdir "${pkgdir}/usr/${_dune2_data_dir}"
  rmdir "${pkgdir}/usr/share/games"
}

