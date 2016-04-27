# Contributor: Trevor Jim
# Maintainer: Sean Greenslade <aur AT seangreenslade DOT com>

pkgname=libwebcam-git
pkgver=20160427
pkgrel=1
pkgdesc="A library that is designed to simplify the development of webcam applications"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/libwebcam/"
license=('GPL')
depends=('libxml2')
makedepends=('cmake' 'linux-headers')
source=('fix_path.patch')

_gitroot="http://git.code.sf.net/p/libwebcam/code"
_gitname="libwebcam"

build() {
  cd $srcdir
  msg 'Connecting to GIT server...'
  if [ -d $_gitname ] ; then
    (cd $_gitname; git pull origin)
    msg 'The local files are updated.'
  else
    git clone $_gitroot $_gitname
  fi
  msg "GIT checkout done or server timeout"

  patch -p1 < fix_path.patch

  msg "Starting make..."

  rm -rf build
  mkdir build
  cd build
  cmake ../$_gitname -DCMAKE_INSTALL_PREFIX=/usr -DUVCVIDEO_INCLUDE_PATH=../common/include/
  make
}

package() {
  cd $srcdir/build
  make DESTDIR=$pkgdir install
}
sha512sums=('bd2c86e5e32a20a85bb36cdcfb47737a6bbf6dfd2b44126de679d7cd241eefcdec8983a54236d0ee574c2439c3deafafba3d02695ce5d8128a6646d7c9395d6e')
