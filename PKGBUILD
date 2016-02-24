# Maintainer:  <gucong@gc-desktop>
pkgname=manta-svn
pkgver=r2542 
pkgrel=1
pkgdesc="a highly portable interactive ray tracing environment"
arch=('i686' 'x86_64')
url="http://mantawiki.sci.utah.edu/manta/Main_Page"
license=('MIT')
depends=('openmpi' 'libx11' 'zlib' 'libgl' 'imagemagick' 'openexr')
makedepends=('subversion' 'cmake')
provides=('manta')
source=('manta-svn::svn+http://anonymous:@gforge.sci.utah.edu/svn/Manta/trunk'
  'all.patch')
md5sums=('SKIP'
         'dd1faa5da3ec84a3db574ca7fe496f50')

prepare() {
  cd "$srcdir/$pkgname"
  patch -p1 -N < "$srcdir/all.patch"
  cd "$srcdir"
  [[ -d ${pkgname}-build ]] && rm -r ${pkgname}-build
  mkdir ${pkgname}-build
}

pkgver() {
  # svn checkout --password '' http://anonymous@gforge.sci.utah.edu/svn/Manta/trunk $pkgname
  cd "$srcdir/$pkgname"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/${pkgname}-build"
  cmake \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_C_COMPILER=mpicc \
    -DCMAKE_CXX_COMPILER=mpicxx \
    -DENABLE_MPI:BOOL=ON \
    ../$pkgname
  make
}

package() {
  cd "$srcdir/${pkgname}-build"
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir/usr/include/.svn"
}
