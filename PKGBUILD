# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=osgocean-svn
_svnname=osgocean
pkgver=0.r258
pkgrel=1
pkgdesc="An ocean rendering nodekit for OpenSceneGraph"
arch=('i686' 'x86_64')
url=('https://code.google.com/p/osgocean/')
license=('LGPL')
depends=('openscenegraph' 'fftw' )
makedepends=('subversion' 'cmake' 'unrar' )
source=( "$_svnname::svn+http://osgocean.googlecode.com/svn/tags/osgOcean-1.0.1/"
         "https://osgocean.googlecode.com/files/osgOcean-Resources-1.0.1.rar" )
noextract=( 'osgOcean-Resources-1.0.1.rar' )
provides=( "$_svnname" )
conflicts=( "$_svnname" )

sha1sums=('SKIP'
          '70f70cf673561ce6b71a220ccb2ff57d6ae6761b')

pkgver() {
  cd "$srcdir/$_svnname"
  local ver="$(svnversion)"
  printf "0.r%s" "${ver//[[:alpha:]]}"
}

build() {

    cd "$srcdir/$_svnname"
    cd resources
    #rm -fr .//*
    yes | unrar x "$srcdir/osgOcean-Resources-1.0.1.rar"
    cd ..

    rm -rf build
    mkdir -p build
    cd build

    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DUSE_FFTW3=ON \
        -DUSE_FFTSS=OFF \
        -DFFTW3-3_LIBRARY=/usr/lib/libfftw3.so \
        -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
   cd "$srcdir/$_svnname"/build
   make DESTDIR="$pkgdir" install
}
