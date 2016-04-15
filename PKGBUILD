# Maintainer: Glen Dsouza <gdsouza@linuxmail.org>
# Contributor: jmf <jmf at mesecons dot net>
pkgname=openscenegraph-git
pkgver=20160415
pkgrel=1
_gitname=OpenSceneGraph
pkgdesc="An open source, high performance real-time graphics toolkit - git mirror"
arch=('i686' 'x86_64')
url="http://www.openscenegraph.org/"
license=('GPL')
depends=('giflib' 'jasper' 'librsvg' 'xine-lib' 'curl' 'pth')
makedepends=('cmake' 'libvncserver' 'qt5-base' 'ffmpeg' 'mesa')
optdepends=('libvncserver' 'gdal' 'openexr' 'poppler-glib' 'qt5-base' 'ffmpeg')
provides=('openscenegraph-git' 'openscenegraph' 'openthreads')
conflicts=('openscenegraph' 'openscenegraph-svn' 'openthreads')
source=(git://github.com/openscenegraph/OpenSceneGraph.git openscenegraph-ffmpeg3.patch)
md5sums=('SKIP'
         'f8151db111ad492ea3bf93971f9a32a9')

pkgver() {
  echo "$(date +"%Y%m%d")"
}

prepare() {
  cd OpenSceneGraph
# Fix build with ffmpeg 3.0 (Debian)
  patch -p2 -i ../openscenegraph-ffmpeg3.patch
}

build() {
  mkdir ${srcdir}/${_gitname}-build/
  cd "${srcdir}/${_gitname}-build/"
  cmake ../${_gitname} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIBRARY_OUTPUT_PATH=/usr/lib \
    -DCMAKE_BUILD_TYPE=Release

  make || return 1
}

package(){
  cd "${srcdir}/${_gitname}-build"
  make DESTDIR="${pkgdir}/" install
  install -D -m644 "${srcdir}/${_gitname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  [ -d "$pkgdir/usr/lib64" ] && mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib" || true
}

