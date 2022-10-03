# ---------------------------------------------------------------
# Maintainer: Romain Bazile <gromain.baz@gmail.com>
# Co-Maintainer: François Guerraz <kubrick@fgv6.net>
# ---------------------------------------------------------------

pkgname=xygrib
pkgver=1.2.6.1
pkgrel=5
pkgdesc="Grib reader and weather visualization software. Zygrib fork."
arch=('x86_64' 'aarch64')
license=("GPL3")
provides=('xygrib')
conflicts=('xygrib-git')
depends=('libnova' 'qwt' 'proj' 'qt5-base' 'qt5-tools' 'openjpeg2')
makedepends=('cmake' 'zlib' 'bzip2' 'libpng')
url="https://opengribs.org/"
source=("https://github.com/opengribs/XyGrib/archive/v$pkgver.tar.gz" "xygrib.install" "skewt.patch" "CMakelists.txt.patch" "proj8.patch")
sha1sums=('8e3431ed6a5ef114d77ac57029129a26a381f696'
          '97eec7e40bd2d4f44986ffbf5096ac4ba37ebbfe'
          '1fa4cf6b72863c9f33a80946d9f4afe7f855df6a'
          '56b94f60f4131c8865cd25f22b90472ba21f206e'
          '1af59e1fe5e07eb7cc1a3f9a52b3989a92bfd8e7')

prepare() {
  cd $srcdir/XyGrib-$pkgver
  patch --strip=1 -i $srcdir/skewt.patch
  patch --strip=1 -i $srcdir/CMakelists.txt.patch
  patch --strip=1 -i $srcdir/proj8.patch
}

build() {
  cd $srcdir/XyGrib-$pkgver
  mkdir -p build
  cd build
  cmake ../
  make -j $(nproc)
}

package() {
  mkdir -p $pkgdir/usr/share/pixmaps
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/usr/bin
  cd $srcdir/XyGrib-$pkgver
  cp linux_online_installer/config/xyGrib_32.png $pkgdir/usr/share/pixmaps/xygrib.png
  cp debian/xygrib.desktop $pkgdir/usr/share/applications/
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr/share/openGribs/ ../
  DESTDIR="$pkgdir" make install
  mv $pkgdir/usr/share/openGribs/XyGrib/XyGrib $pkgdir/usr/bin/
}
