# Maintainer:  Yigit Dallilar <yigit.dallilar@gmail.com>
#
# for _mod use either (src_no_xspec_modeldata or src) and dont forget to change sha256sums

pkgname=heasoft
pkgver=6.27
pkgrel=3
_mod="src_no_xspec_modeldata"
pkgdesc="NASA high energy astrophysics library"
makedepends=("glibc" "gcc-fortran" "perl" "python-numpy")
depends=("ncurses" "readline" "libxpm" "libidn")
url="https://heasarc.gsfc.nasa.gov/docs/software/lheasoft/"
arch=('x86_64')
license=('NASA' 'GPL')
source=("https://heasarc.gsfc.nasa.gov/FTP/software/lheasoft/lheasoft${pkgver}/${pkgname}-${pkgver}${_mod}.tar.gz")
sha256sums=('a2359c2c765828eb9c1782769398e2a1f83cbcd3d46fb1be6b59a89b847cc5d4')
install="${pkgname}.install"

build() {
  cd "$srcdir/${pkgname}-${pkgver}/BUILD_DIR"

  ./configure --prefix="/opt/${pkgname}" --build=${CHOST}

  # parallel builds may fail
  make -j1
}

package(){
  local glibcver HEADAS

  cd "$srcdir/${pkgname}-${pkgver}/BUILD_DIR"

  make DESTDIR="$pkgdir" install

  glibcver=`ldd --version | sed -n 's/ldd (GNU libc) //p'`
  HEADAS="/opt/${pkgname}/${CHOST}-libc${glibcver}"

  install -d "$pkgdir"/{usr/bin,etc/profile.d}
  ln -s "${HEADAS}/headas-init.sh" "$pkgdir/usr/bin/"
  echo "export HEADAS=${HEADAS}" > "$pkgdir/etc/profile.d/heasoft.sh"
}
