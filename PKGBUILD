# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Maciej Sieczka <msieczka at sieczka dot org>

pkgname=grass
pkgver=7.0.1
pkgrel=5
_shortver=${pkgver%.*}
_shortver=${_shortver/./}
pkgdesc='Geospatial data management and analysis, image processing, graphics/maps production, spatial modeling and visualization'
arch=('i686' 'x86_64')
url='http://grass.osgeo.org/'
license=('GPL')
depends=('fftw' 'gdal' 'glu' 'wxpython' 'python2-pillow')
makedepends=('libxt')
optdepends=('postgresql: PostgreSQL database interface')
source=("http://grass.osgeo.org/grass$_shortver/source/$pkgname-$pkgver.tar.gz")
md5sums=('bda8f612443a935b9da78dba85733db4')

prepare() {
  cd $pkgname-$pkgver

  ln -sf "$(which python2)" python

  sed -i 's/\(env \|\/usr\/bin\/\)python$/&2/' $(find . -name "*.py")
  sed -i '/os\.environ.*GRASS_PYTHON/ s/"python"/"python2"/' lib/init/grass.py
  sed -i "/^Exec/ s/=.*/=grass$_shortver/" gui/icons/grass.desktop
}

build() {
  cd $pkgname-$pkgver

  export PATH="$srcdir/$pkgname-$pkgver:$PATH"
  export CFLAGS="$CPPFLAGS $CFLAGS"
  export CXXFLAGS="$CPPFLAGS $CXXFLAGS"
  unset CPPFLAGS

  ./configure \
    --prefix=/opt/$pkgname \
    --with-freetype-includes=/usr/include/freetype2 \
    --with-wxwidgets \
    --with-readline \
    --with-pthread \
    --with-netcdf \
    --with-nls \
    --with-geos \
    --with-postgres

  make
}

package() {
  cd $pkgname-$pkgver

  make exec_prefix="$pkgdir/usr" INST_DIR="$pkgdir/opt/$pkgname" install

  sed -i "s|$pkgdir||g" "$pkgdir/opt/grass/demolocation/.grassrc$_shortver" "$pkgdir/usr/bin/grass$_shortver"
  sed -i "s|$srcdir||g" "$pkgdir/opt/grass/docs/html/t.connect.html"

  # This is needed for qgis to find grass
  install -d "$pkgdir/etc/ld.so.conf.d/"
  echo "/opt/$pkgname/lib" > "$pkgdir/etc/ld.so.conf.d/$pkgname.conf"

  install -Dm644 gui/icons/grass-64x64.png "$pkgdir/usr/share/pixmaps/grass.png"
  install -Dm644 gui/icons/grass.desktop "$pkgdir/usr/share/applications/grass.desktop"
}
