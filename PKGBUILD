# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Jakub Luzny <limoto94@gmail.com>
pkgname=openscenegraph-2.8
pkgver=2.8.5
pkgrel=4
pkgdesc="An Open Source, high performance real-time graphics toolkit"
arch=('i686' 'x86_64')
license=('custom:OSGPL')
url="http://www.openscenegraph.org"
depends=('giflib4' 'jasper' 'librsvg' 'xine-lib' 'curl' 'pth')
makedepends=('cmake' 'libvncserver')
optdepends=('libvncserver' 'gdal1' 'openexr' 'poppler-glib')
conflicts=('openthreads' 'openscenegraph')
provides=('openthreads' "openscenegraph=$pkgver")
source=(http://www.openscenegraph.org/downloads/stable_releases/OpenSceneGraph-$pkgver/source/OpenSceneGraph-$pkgver.zip
        ffmpeg.patch findffmpeg.patch findgdal.patch findgiflib.patch video_out_rgb.patch)
md5sums=('SKIP'
         '65790bc6dbdedecf6bd3ee01ad22212a'
         'a6cce978f18522176247e4ac5e72e3b0'
         '9301eebbac03c56bab82e571a47b15d2'
         '445cb50fd391b31beca4a95fa7a7ffcc'
         '97a3a602f45a3869e5f2e19781dd6934')


build() {
  cd OpenSceneGraph-$pkgver

  patch -Np1 -i "$srcdir/ffmpeg.patch"
  cd CMakeModules
  patch -Np0 -i "$srcdir/findffmpeg.patch"
  patch -Np0 -i "$srcdir/findgdal.patch"
  patch -Np0 -i "$srcdir/findgiflib.patch"
  cd ${srcdir}/OpenSceneGraph-${pkgver}/src/osgPlugins/xine
  patch -Np0 -i "$srcdir/video_out_rgb.patch"
  cd ${srcdir}/OpenSceneGraph-${pkgver}

  [ $NOEXTRACT -eq 1 ] || cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  sed -i 's|#include <curl/types.h>|//#include <curl/types.h>|' src/osgPlugins/curl/ReaderWriterCURL.cpp
  make
}

package() {
  cd OpenSceneGraph-$pkgver
  make DESTDIR="$pkgdir" install
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  [ -d "$pkgdir/usr/lib64" ] && mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib" || true
}

#category: lib
