# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Glen Dsouza <gdsouza@linuxmail.org>
# Contributor: jmf <jmf at mesecons dot net>

pkgname=openscenegraph-git
pkgver=3.6.5.r103.g06558a5dd
pkgrel=2
pkgdesc="An open source, high performance real-time graphics toolkit"
arch=(x86_64)
url="http://www.openscenegraph.org"
license=('custom:OSGPL')
depends=(libglvnd libxinerama)
makedepends=(git cmake fontconfig ffmpeg4.4 gdal gst-plugins-base-libs jasper librsvg libvncserver openexr poppler-glib)
optdepends=(ffmpeg4.4 gdal gst-plugins-base-libs jasper librsvg libvncserver openexr poppler-glib)
provides=(openscenegraph openthreads)
conflicts=(openscenegraph openthreads)
source=("git+https://github.com/openscenegraph/OpenSceneGraph.git#branch=OpenSceneGraph-3.6")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/OpenSceneGraph"
  git describe --long --tags | sed 's/^OpenSceneGraph.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig'

prepare() {
  mkdir -p "${srcdir}/OpenSceneGraph/build"
}

build() {
  cd "${srcdir}/OpenSceneGraph/build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release

  VERBOSE=1 make
}

package(){
  cd "${srcdir}/OpenSceneGraph/build"
  make DESTDIR="$pkgdir" install
  install -Dm 644 "../LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

