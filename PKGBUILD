# Maintainer: Lone_Wolf <lone_wolf@klaas-de-kat.nl>
# Contributor: Michael Fitzmayer <mail@michael-fitzmayer.de>
pkgname=openscenegraph-openmw-git
epoch=1
_pkgver=3.6.5
pkgver=3.6.5.r16162.69cfecebf
pkgrel=6
pkgdesc="Fork of OpenSceneGraph , with openmw-specific changes"
arch=('x86_64' 'aarch64')
url="http://www.openscenegraph.org/"
license=('custom:OSGPL')
depends=('libglvnd' 'fontconfig' 'jasper' 'libxinerama' 'libxrandr' 'collada-dom')
makedepends=('git' 'cmake')
provides=('openscenegraph')
conflicts=('openscenegraph')
source=('git+https://github.com/OpenMW/osg.git')
md5sums=('SKIP')
options=(debug strip)

pkgver() {
    cd osg
    printf "%s.r%s.%s" "${_pkgver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    # a slightly adjusted version of the example in wiki usable when upstream doesn't provied useful tags
}

build() {

    cmake \
        -B _build \
        -S "$srcdir"/osg \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_DISABLE_FIND_PACKAGE_GDAL=1 -D CMAKE_DISABLE_FIND_PACKAGE_DCMTK=1 -D CMAKE_DISABLE_FIND_PACKAGE_SDL2=1 -D CMAKE_DISABLE_FIND_PACKAGE_SDL=1 \
        -D CMAKE_DISABLE_FIND_PACKAGE_GStreamer=1 -D CMAKE_DISABLE_FIND_PACKAGE_TIFF=1  -D CMAKE_DISABLE_FIND_PACKAGE_GTA=1 -D CMAKE_DISABLE_FIND_PACKAGE_FFmpeg=1 \
        -D CMAKE_DISABLE_FIND_PACKAGE_Poppler-glib=1 -D CMAKE_DISABLE_FIND_PACKAGE_RSVG=1 -D CMAKE_DISABLE_FIND_PACKAGE_GtkGl=1 -D CMAKE_DISABLE_FIND_PACKAGE_LibVNCServer=1 \
        -D CMAKE_DISABLE_FIND_PACKAGE_ilmbase=1 -D CMAKE_DISABLE_FIND_PACKAGE_Inventor=1 -D CMAKE_DISABLE_FIND_PACKAGE_OpenEXR=1 -D CMAKE_DISABLE_FIND_PACKAGE_OpenCascade=1 \
        -D CMAKE_DISABLE_FIND_PACKAGE_FBX=1 -D CMAKE_DISABLE_FIND_PACKAGE_DirectShow=1 -D CMAKE_DISABLE_FIND_PACKAGE_DirectInput=1 \
        -D CMAKE_DISABLE_FIND_PACKAGE_NVTT=1 -D CMAKE_DISABLE_FIND_PACKAGE_GIFLIB=1 -D CMAKE_DISABLE_FIND_PACKAGE_Asio=1 -D CMAKE_DISABLE_FIND_PACKAGE_ZeroConf=1 \
        -D CMAKE_DISABLE_FIND_PACKAGE_LIBLAS=1 \
        -D BUILD_OSG_PLUGINS_BY_DEFAULT=0 \
        -D BUILD_OSG_PLUGIN_OSG=1 \
        -D BUILD_OSG_PLUGIN_DDS=1 \
        -D BUILD_OSG_PLUGIN_TGA=1 \
        -D BUILD_OSG_PLUGIN_BMP=1 \
        -D BUILD_OSG_PLUGIN_JPEG=1 \
        -D BUILD_OSG_PLUGIN_PNG=1 \
        -D BUILD_OSG_PLUGIN_FREETYPE=1 \
        -D BUILD_OSG_DEPRECATED_SERIALIZERS=0 \
        -D BUILD_OSG_PLUGIN_DAE=1 \
        -Wno-dev

    VERBOSE=1 make -C _build
}

package(){
    make -C _build DESTDIR="${pkgdir}" install
    install -Dm 644 $srcdir/osg/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

