# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Glen Dsouza <gdsouza@linuxmail.org>
# Contributor: jmf <jmf at mesecons dot net>

pkgname=openscenegraph-git
pkgver=3.6.5.r108.g925270d90
pkgrel=2
pkgdesc="An open source, high performance real-time graphics toolkit"
arch=(x86_64)
url="https://www.openscenegraph.com/"
license=('custom:OSGPL')
depends=(glibc gcc-libs ffmpeg4.4 libglvnd libxinerama)
makedepends=(git cmake fontconfig gdal gst-plugins-base-libs jasper librsvg libvncserver openexr poppler-glib)

# fail to build with: opencascade
# not detected: poppler
# not detected: COLLADA (opencollada)
# not detected: LIBLAS
# not detected: ZeroConf (avahi ?)
# not detected: LIBLAS (blas libblas.so) (openblas libopenblas.so) also 64 bit integer variant
# automagick deps: gtk2 gtkglext dcmtk coin (INVENTOR) sdl12-compat

optdepends=(gdal gst-plugins-base-libs jasper librsvg libvncserver openexr poppler-glib)
provides=(openscenegraph openthreads)
conflicts=(openscenegraph openthreads)
source=("git+https://github.com/openscenegraph/OpenSceneGraph.git#branch=OpenSceneGraph-3.6"
        "openscenegraph-ffmpeg4.4.patch::https://gitlab.archlinux.org/archlinux/packaging/packages/openscenegraph/-/raw/main/ffmpeg4.4.patch"
        "https://gitlab.archlinux.org/archlinux/packaging/packages/openscenegraph/-/raw/main/openscenegraph-openexr3.patch")
sha256sums=('SKIP'
            '64a492d266e49aec611fd609251fa7dd08f75e86b25120a1abaf0328223c921a'
            '680ea7cd1b1681fb42137dd1510c64862507b889286d8788d3f017d9d307792d')

pkgver() {
  cd "${srcdir}/OpenSceneGraph"
  git describe --long --tags | sed 's/^OpenSceneGraph.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd OpenSceneGraph
  patch -p1 < ../openscenegraph-openexr3.patch # Fix build with openEXR 3
  patch -p1 < ../openscenegraph-ffmpeg4.4.patch # Find ffmpeg 4.4 headers
}

build() {
  export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig'
  cmake -B build -S "OpenSceneGraph" -Wno-dev \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib

  cmake --build build
}

package(){
  DESTDIR="$pkgdir" cmake --install build
  install -Dm 644 "OpenSceneGraph/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
