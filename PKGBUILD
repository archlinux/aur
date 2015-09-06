# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Maciej Sieczka <msieczka at sieczka dot org>

pkgname='grass'
pkgver='7.0.1'
pkgrel='1'
pkgdesc="Geospatial data management and analysis, image processing, graphics/maps production, spatial modeling and visualization."
arch=('i686' 'x86_64')
url='http://grass.osgeo.org/'
license=('GPL')
depends=('zlib' 'freetype2' 'cfitsio' 'fftw' 'gdal' 'geos' 'glu' 'libjpeg'
         'libpng' 'libtiff' 'libxmu' 'mesa' 'postgresql' 'proj'
         'wxpython2.8' 'wxgtk2.8' 'xorg-server' 'cairo' 'unixodbc' 'python2'
         'python2-numpy' 'python2-matplotlib' 'python2-pillow')
makedepends=('doxygen')
optdepends=('r: R language interface; see http://grasswiki.osgeo.org/wiki/R_statistics')
source=("http://grass.osgeo.org/grass70/source/$pkgname-$pkgver.tar.gz")
sha256sums=('0987dd1618fde24b05785a502c7db8c09401a522a7a3ee50543068fab4eb405f')

prepare() {
  cd $pkgname-$pkgver

  ln -sf "$(which python2)" python

  sed -i "s/env python$/&2/" $(find . -name "*.py")
  sed -i 's/grass7$/grass70/' gui/icons/grass.desktop
}

build() {
  cd $pkgname-$pkgver
  export PATH="$srcdir/$pkgname-$pkgver:$PATH"

  CPPFLAGS="" ./configure \
    --prefix=/opt \
    --with-freetype-includes=/usr/include/freetype2

  make
}

package() {
  cd $pkgname-$pkgver

  make exec_prefix="$pkgdir/usr" INST_DIR="$pkgdir/opt/$pkgname" install

  sed -i "s|$pkgdir||g" "$pkgdir/opt/grass/demolocation/.grassrc70" "$pkgdir/usr/bin/grass70"
  sed -i "s|$srcdir||g" "$pkgdir/opt/grass/docs/html/t.connect.html"
  sed -i 's/"python"/"python2"/' "$pkgdir/usr/bin/grass70"

  install -Dm644 gui/icons/grass-64x64.png "$pkgdir/usr/share/icons/grass.png"
  install -Dm644 gui/icons/grass.desktop "$pkgdir/usr/share/applications/grass.desktop"
}
