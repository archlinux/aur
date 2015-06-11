# Maintainer: Artem Vorotnikov <artem@vorotnikov.me>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Markus Martin <markus@archwyrm.net>

pkgname=ogre-1.8-pagedgeometry
pkgver=1.1.3
pkgrel=2
pkgdesc="Paged Geometry plugin for OGRE for fast rendering of trees and grass. Built against OGRE 1.8."
arch=('i686' 'x86_64')
url="http://code.google.com/p/ogre-paged"
license=('MIT')
makedepends=('ogre-1.8' 'boost' 'cmake')
provides=('ogre-pagedgeometry')
source=(http://ogre-paged.googlecode.com/files/ogre-paged-${pkgver}.tar.gz)
sha512sums=('48e8efb6b9bd7b38d8513a06473260b0f6a4829b18a27b4aea21319373ae1d6c41bc1d26bb6e1ec2473041cc8a4f5e833a02863b6599750a27d72c9581f7c3e4')

build() {
  cd $srcdir/ogre-paged-$pkgver
  export PKG_CONFIG_PATH="/opt/OGRE-1.8/lib/pkgconfig:$PKG_CONFIG_PATH"
  export LD_LIBRARY_PATH="/opt/OGRE-1.8/lib:$LD_LIBRARY_PATH"

  # get a clean build dir
  [[ -d build ]] && rm -rf build
  mkdir build && cd build

  cmake .. \
    -DPAGEDGEOMETRY_BUILD_SAMPLES=0 \
    -DCMAKE_INSTALL_PREFIX=/opt/PagedGeometry-OGRE1.8

  make
}

package() {
  cd $srcdir/ogre-paged-$pkgver/build

  make DESTDIR=$pkgdir install

  # Put the docs into the proper place with their own directory
  docdir=$pkgdir/opt/PagedGeometry-OGRE1.8/share/doc
  mkdir -p $docdir
  mv $pkgdir/opt/PagedGeometry-OGRE1.8/doc $docdir/ogre-pagedgeometry
}
