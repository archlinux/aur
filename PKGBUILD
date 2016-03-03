# Maintainer: Jan Oliver Oelerich <janoliver@oelerich.org> 
pkgname=ovito-git
pkgver=2.6.1.r18.g0fbb1db
pkgrel=1
pkgdesc="Scientific visualization and analysis software for atomistic simulation data"
arch=('i686' 'x86_64')
url="http://www.ovito.org/"
license=('GPLv3')
provides=('ovito')
depends=('python' 'zlib' 'tachyon' 'qscintilla-qt5' 'cgal')
makedepends=('git' 'cmake' 'gcc' 'qt5-base' 'qt5-script' 'qt5-svg' 'qt5-imageformats')
conflicts=('ovito')
md5sums=('SKIP'
         'df2e7eb73038d9ad6abe1a7805513d77')
source=('ovito'::'git+http://git.code.sf.net/p/ovito/git' 
        'arch.patch')
_gitname="ovito"

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git describe --always --long | sed 's/^[v]//;s/-/-r/' | tr - .)
}

prepare() {
  cd $srcdir/$_gitname
  patch -p1 -i $srcdir/arch.patch 
}

build() {
  cd $srcdir/$_gitname
  
  cmake . \
      -DCMAKE_BUILD_TYPE=Release \
      -DOVITO_BUILD_PLUGIN_PYSCRIPT=on \
      -DOVITO_BUILD_PLUGIN_NETCDF=on \
      -DOVITO_VIDEO_OUTPUT_SUPPORT=on \
      -DOVITO_BUILD_PLUGIN_SCRIPTING=on \
      -DCMAKE_INSTALL_PREFIX:PATH=/usr \
      -DCMAKE_EXE_LINKER_FLAGS='-Wl,-rpath,/usr/lib/ovito'
  make
}

package() {
  cd $srcdir/$_gitname
  make DESTDIR="${pkgdir}/" install
} 


