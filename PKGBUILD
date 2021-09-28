# Maintainer: Lone_Wolf <lone_wolf@klaas-de-kat.nl>
# Contributor: Michael Fitzmayer <mail@michael-fitzmayer.de>
pkgname=openscenegraph-openmw-git
epoch=1
_pkgver=3.6.5
pkgver=3.6.5.r16150.b02abe200
pkgrel=1
pkgdesc="Fork of OpenSceneGraph , with openmw-specific changes"
arch=('x86_64')
url="http://www.openscenegraph.org/"
license=('custom:OSGPL')
depends=('giflib' 'jasper' 'librsvg' 'curl' 'pth' 'libxrandr' 'libxinerama')
makedepends=('git' 'cmake' 'qt5-base' 'mesa')
optdepends=('qt5-base')
provides=('openscenegraph')
conflicts=('openscenegraph')
source=('git+https://github.com/OpenMW/osg.git')
md5sums=('SKIP')

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
        -D BUILD_OSG_PLUGINS_BY_DEFAULT=0 \
        -D BUILD_OSG_PLUGIN_OSG=1 \
        -D BUILD_OSG_PLUGIN_DDS=1 \
        -D BUILD_OSG_PLUGIN_TGA=1 \
        -D BUILD_OSG_PLUGIN_BMP=1 \
        -D BUILD_OSG_PLUGIN_JPEG=1 \
        -D BUILD_OSG_PLUGIN_PNG=1 \
        -D BUILD_OSG_PLUGIN_FREETYPE=1 \
        -D BUILD_OSG_DEPRECATED_SERIALIZERS=0 \
        -D CMAKE_DISABLE_FIND_PACKAGE_DCMTK=1 \
        -D CMAKE_DISABLE_FIND_PACKAGE_GDAL=1 \
        -D CMAKE_DISABLE_FIND_PACKAGE_GTA=1 \
        -D CMAKE_DISABLE_FIND_PACKAGE_Poppler-glib=1 \
        -D CMAKE_DISABLE_FIND_PACKAGE_GStreamer=1 \
        -D CMAKE_DISABLE_FIND_PACKAGE_SDL2=1 \
        -D CMAKE_DISABLE_FIND_PACKAGE_SDL=1 \
        -D CMAKE_DISABLE_FIND_PACKAGE_GtkGl=1 \
        -D CMAKE_DISABLE_FIND_PACKAGE_FFmpeg=1 \
        -Wno-dev

    make -C _build
}

package(){
    make -C _build DESTDIR="${pkgdir}" install
    install -Dm 644 $srcdir/osg/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

