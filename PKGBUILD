# Maintainer: Samuel Fernando Mesa Giraldo <samuelmesa dot linuxmail.org>
# Initial Maintainer: <julien@skiltz_laptop>

pkgname=grass74-svn
pkgver=r73601
pkgrel=1
_shortver=74
pkgdesc='Geospatial data management and analysis, image processing, graphics/map
s production, spatial modeling and visualization'
arch=('i686' 'x86_64')
url='http://grass.osgeo.org/'
license=('GPL')
depends=('cairo' 'fftw' 'fontconfig' 'freetype2' 'gcc-libs' 'gdal' 'geos' 'glibc' 'glu' 'libpng' 'libtiff' 'libx11' 'libgl' 'netcdf' 'proj' 'python2-pillow' 'readline' 'subversion' 'wxpython' 'zlib' 'liblas-git')
makedepends=('libxt')
optdepends=('postgresql: PostgreSQL database interface'
            'sqlite: SQLite database interface')
provides=('grass')
conflicts=('grass')
replaces=()
backup=()
options=()
install=
changelog=
source=('svn+https://svn.osgeo.org/grass/grass/branches/releasebranch_7_4' )
sha512sums=('SKIP')
noextract=()

_svnmod=releasebranch_7_4


pkgver() {
  cd "releasebranch_7_4"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  sed -i 's/\(env \|\/usr\/bin\/\)python$/&2/' $(find . -iname "*.py")
  sed -i '/os\.environ.*GRASS_PYTHON/ s/"python"/"python2"/' lib/init/grass.py
  sed -i '/^PYTHON/ s/python$/&2/' include/Make/Platform.make.in

  # Fix path
  sed -i '/^\s*INSTDIR/ s/".*"//' configure
  export CXXFLAGS="-std=c++98 $CXXFLAGS"

  # Ancient autoconf used upstream can't handle CPPFLAGS correctly, so set CPP teso ignore warnings
  CPP="gcc -E -w" \
  ./configure \
    --prefix=/opt/$pkgname \
    --with-freetype-includes=/usr/include/freetype2 \
    --with-wxwidgets \
    --with-readline \
    --with-pthread \
    --with-netcdf \
    --with-nls \
    --with-geos \
    --with-liblas \
    --with-postgres

  make
}

package() {
  cd $_svnmod-build

  make exec_prefix="$pkgdir/usr" INST_DIR="$pkgdir/opt/$pkgname" install

  # Install linker config file, needed for qgis to find grass
  install -d "$pkgdir/etc/ld.so.conf.d/"
  echo "/opt/$pkgname/lib" > "$pkgdir/etc/ld.so.conf.d/$pkgname.conf"

  cd "$pkgdir/opt/$pkgname"

  # Fix for 3rd party python scripts
  ln -s ../../../usr/bin/python2 bin/python

  # Put freedesktop.org files in correct location
  mv share "$pkgdir/usr"

  # Fix some paths that get hard coded by make install
  sed -i "s|$pkgdir||g" demolocation/.grassrc$_shortver \
                        include/Make/{Platform,Grass}.make \
                        etc/fontcap \
                        "$pkgdir/usr/bin/grass$_shortver"
  sed -i "s|$srcdir||g" docs/html/t.connect.html
}

