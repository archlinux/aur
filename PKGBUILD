# Maintainer: Glen Dsouza <gdsouza@linuxmail.org>
# Contributor: jmf <jmf at mesecons dot net>

pkgname=openscenegraph-git
pkgver=3.7.0r15866.198592733
_pkgver=3.7.0
pkgrel=1
pkgdesc="An open source, high performance real-time graphics toolkit"
arch=('x86_64')
url="http://www.openscenegraph.org"
license=('custom:OSGPL')
depends=('giflib' 'jasper' 'librsvg' 'xine-lib' 'curl' 'pth')
makedepends=('cmake' 'libvncserver' 'qt5-base' 'ffmpeg' 'mesa')
optdepends=('libvncserver' 'gdal' 'openexr' 'poppler-glib' 'qt5-base' 'ffmpeg')
provides=('openscenegraph' 'openthreads')
conflicts=('openscenegraph' 'openthreads')
source=("openscenegraph::git+https://github.com/openscenegraph/OpenSceneGraph.git#branch=master")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "%sr%s.%s" "${_pkgver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p "${srcdir}/${pkgname%-git}/build"
}

build() {
  cd "${srcdir}/${pkgname%-git}/build"
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIBRARY_OUTPUT_PATH=/usr/lib \
    -DCMAKE_BUILD_TYPE=Release \
    ..
  make
}

package(){
  cd "${srcdir}/${pkgname%-git}/build"
  make DESTDIR="$pkgdir" install
  install -Dm 644 "../LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/usr/lib64" "${pkgdir}/usr/lib"
}

