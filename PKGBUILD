# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=osgearth-git
_gitname=osgearth
pkgver=4764.36f72fa
pkgrel=1
pkgdesc="A terrain rendering toolkit for OpenSceneGraph"
arch=('i686' 'x86_64')
url=('http://www.osgearth.org')
license=('LGPL')
depends=('openscenegraph' 'gdal' 'expat' 'curl' )
optdepends=('geos: Improved vector support'
            'sqlite: Flat file cache'
            'libzip: Archive support')
makedepends=('git' 'cmake')
source=( "$_gitname::git+https://github.com/gwaldron/osgearth" )
provides=( "$_gitname" )
conflicts=( "$_gitname" )

sha1sums=( 'SKIP' )

pkgver() {
  cd "$srcdir/$_gitname"
  # Use the tag of the last commit
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {

    cd "$srcdir/$_gitname"
    rm -rf build
    mkdir -p build
    cd build

    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
   cd "$srcdir/$_gitname"/build
   make DESTDIR="$pkgdir" install
   mkdir -p "$pkgdir"/usr/share/osgearth
   cp -r "$srcdir"/$_gitname/tests "$pkgdir"/usr/share/osgearth
   cp -r "$srcdir"/$_gitname/data "$pkgdir"/usr/share/osgearth
}

