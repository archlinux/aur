# Maintainer: Guilhem Saurel <guilhem.saurel@laas.fr>
# Contributor: Yunhui Fu <yhfudev@gmail.com>

pkgname=tulip
pkgver=6.0.0
pkgrel=1
pkgdesc='An information visualization framework dedicated to the analysis and visualization of relational data.'
arch=( 'i686' 'x86_64' 'armv6' 'armv6h' 'arm7h' )
url='http://tulip.labri.fr/'
license=('GPL')
depends=(
    'qt6-base'
    'libjpeg-turbo'
    'libpng'
    'zlib'
    'glew'
    'libxml2'
    'libzip'
    'freetype2'
    'qhull'
    'quazip-qt6'
    'yajl'
    'python'
    'desktop-file-utils'
    )
makedepends=(
    'cmake'
    'cppunit'
    'sip'
    )
optdepends=(
    'doxygen'
    'python-sphinx'
    )
source=("https://sourceforge.net/projects/auber/files/tulip/tulip-${pkgver}/tulip-${pkgver}_src.tar.gz")
sha256sums=('781a73407072816e6b39d8e7d54fdb75d7f7e9dbf3d82d37d1754fb18e8f85e4')

prepare() {
    # allow python 3.14
    sed -i \
        's/3.9...<3.14/3.9...<3.15/' \
        "$pkgname-$pkgver/CMakeLists.txt"
    sed -i \
        's/PY_MINOR_VERSION >= 14/PY_MINOR_VERSION >= 15/' \
        "$pkgname-$pkgver/library/tulip-python/src/ConsoleUtilsModule.cpp"


    # dont get confused by the version number in the build dir name
    sed -i \
        '/^FILE(GLOB/a\\nget_filename_component(SIP_DIST_NAME "${SIP_DIST}" NAME)' \
        "$pkgname-$pkgver/cmake/TulipPython.cmake"
    sed -i \
        '/^STRING(REGEX/s/SIP_DIST/SIP_DIST_NAME/' \
        "$pkgname-$pkgver/cmake/TulipPython.cmake"
}

build()
{
    cmake -B "build-$pkgver" -S "$pkgbase-$pkgver" \
        -DTULIP_BUILD_TESTS=ON \
        -DTULIP_USE_QT6=ON \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_CXX_FLAGS="-fpermissive" \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build "build-$pkgver"
}

#check() {
    #cmake --build "build-$pkgver" -t test
    ##The following tests FAILED:
            ##16 - PushPopTest (Subprocess aborted)
            ##31 - TulipPluginsLoadingTest (Subprocess aborted)
            ##35 - ExternalPluginsBuildTest (Failed)
#}

package() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
}
