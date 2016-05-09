# $Id$
# Maintainer: Samuel Fernando Mesa Giraldo samuelmesa@linuxmail.org>
# Initial Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Initial Maintainer: Hans Janssen <janserv@gmail.com>
# Initial Contributor: my64 <packages@obordes.com>
# Initial Contributor: Colin Pitrat <colin.pitrat@gmail.com>

pkgname=openscenegraph-qt4
pkgver=3.4.0
pkgrel=1
pkgdesc="An Open Source, high performance real-time graphics toolkit"
arch=('i686' 'x86_64')
license=('custom:OSGPL')
url="http://www.openscenegraph.org"
depends=('giflib' 'jasper' 'librsvg' 'xine-lib' 'curl' 'pth')
makedepends=('cmake' 'libvncserver' 'qt4' 'ffmpeg' 'mesa')
optdepends=('libvncserver' 'gdal' 'openexr' 'poppler-glib' 'qt4' 'ffmpeg')
conflicts=('openthreads', 'openscenegraph')
provides=('openthreads', 'openscenegraph')
source=(http://trac.openscenegraph.org/downloads/developer_releases/OpenSceneGraph-$pkgver.zip openscenegraph-ffmpeg3.patch)
md5sums=('a5e762c64373a46932e444f6f7332496'
         'f8151db111ad492ea3bf93971f9a32a9')

prepare() {
  cd OpenSceneGraph-$pkgver
# Fix build with ffmpeg 3.0 (Debian)
  patch -p2 -i ../openscenegraph-ffmpeg3.patch
}

build() {
  cd OpenSceneGraph-$pkgver
#  CFLAGS="$CFLAGS -D__STDC_CONSTANT_MACROS"
#  CXXFLAGS="$CXXFLAGS -D__STDC_CONSTANT_MACROS"
  [ $NOEXTRACT -eq 1 ] || cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DOSG_USE_QT:BOOL=ON \
    -DDESIRED_QT_VERSION=4 \
    -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4
  make -j2
}

package() {
  cd OpenSceneGraph-$pkgver
  make DESTDIR="$pkgdir" install
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  [ -d "$pkgdir/usr/lib64" ] && mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib" || true
}
