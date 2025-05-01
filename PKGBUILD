# Maintainer: Lone_Wolf <lone_wolf@klaas-de-kat.nl>
# Contributor: Michael Fitzmayer <mail@michael-fitzmayer.de>
pkgname=openscenegraph-openmw-git
epoch=1
_pkgver=3.6.5
pkgver=3.6.5.r16186.43faf6fa8
pkgrel=4
pkgdesc="Fork of OpenSceneGraph , with openmw-specific changes"
arch=('x86_64' 'aarch64')
url="http://www.openscenegraph.org/"
license=('custom:OSGPL')
depends=(libglvnd fontconfig libxinerama libxrandr collada-dom 
                    freetype2 glibc libjpeg-turbo libpng gcc-libs zlib libx11)
makedepends=(git cmake)
provides=('openscenegraph')
conflicts=('openscenegraph')
source=('git+https://github.com/OpenMW/osg.git')
md5sums=('SKIP')
options=(!debug)

pkgver() {
    cd osg
    printf "%s.r%s.%s" "${_pkgver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    # a slightly adjusted version of the example in wiki usable when upstream doesn't provide useful tags
}

build() {

    cmake \
        -B _build \
        -S "$srcdir"/osg \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D CMAKE_BUILD_TYPE=Release \
        -D BUILD_OSG_APPLICATIONS=OFF \
        -D BUILD_OSG_DEPRECATED_SERIALIZERS=OFF \
        -D OSG_FIND_3RD_PARTY_DEPS=OFF \
        -D BUILD_OSG_PLUGINS_BY_DEFAULT=OFF \
        -D BUILD_OSG_PLUGIN_BMP=ON \
        -D BUILD_OSG_PLUGIN_DAE=ON \
        -D BUILD_OSG_PLUGIN_DDS=ON \
        -D BUILD_OSG_PLUGIN_FREETYPE=ON \
        -D BUILD_OSG_PLUGIN_JPEG=ON \
        -D BUILD_OSG_PLUGIN_KTX=ON \
        -D BUILD_OSG_PLUGIN_OSG=ON \
        -D BUILD_OSG_PLUGIN_PNG=1 \
        -D BUILD_OSG_PLUGIN_TGA=1 \
        -D OSG_USE_FLOAT_MATRIX=OFF \
        -D OSG_USE_FLOAT_PLANE=OFF \
        -D OSG_USE_FLOAT_QUAT=OFF \
        -D OPENGL_PROFILE="GL2" \
        -D BUILD_SHARED_LIBS=ON \
        -D DYNAMIC_OPENTHREADS=ON \
        -D DYNAMIC_OPENSCENEGRAPH=ON \
        -D CMAKE_POLICY_VERSION_MINIMUM=3.5 \
       -Wno-dev

    VERBOSE=1 make -C _build
}

package(){
    make -C _build DESTDIR="${pkgdir}" install
    install -Dm 644 $srcdir/osg/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
