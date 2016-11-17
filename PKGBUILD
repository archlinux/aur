# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=blobby-volley-svn
pkgver=r1678
pkgrel=1
pkgdesc="Official continuation of the famous Blobby Volley 1.x arcade game."
arch=('x86_64' 'i686')
url="https://sourceforge.net/projects/blobby/"
makedepends=('subversion' 'boost' 'cmake' 'zip')
depends=('physfs' 'sdl2')
license=('GPL2')
source=("blobby-code::svn+http://svn.code.sf.net/p/blobby/code/trunk"
        "0001-fix-vector-include.patch")
md5sums=('SKIP'
         '4b452f8d9280bb7e315586be588969ae')

pkgver() {
  cd blobby-code
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd $srcdir/blobby-code
  # Only patch if patch applies
  if patch -p0 -N -i $srcdir/0001-fix-vector-include.patch --dry-run; then
    patch -p0 -N -i $srcdir/0001-fix-vector-include.patch
  fi
}

build() {
  cd $srcdir/blobby-code
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd blobby-code
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
