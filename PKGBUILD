# Maintainer: Guilhem Saurel <guilhem.saurel@laas.fr>
# Contributor: Yunhui Fu <yhfudev@gmail.com>

pkgname=tulip
pkgver=5.7.2
pkgrel=1
pkgdesc='Tulip is an information visualization framework dedicated to the analysis and visualization of relational data.'
arch=( 'i686' 'x86_64' 'armv6' 'armv6h' 'arm7h' )
url='http://tulip.labri.fr/'
license=('GPL')
depends=(
    'qt6-base'
    'libjpeg'
    'libpng'
    'zlib'
    'glew'
    'libxml2'
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
source=(
    "https://sourceforge.net/projects/auber/files/tulip/tulip-${pkgver}/tulip-${pkgver}_src.tar.gz"
    "cstdint.patch" "qwebengineview.patch"
    )
sha256sums=('6fe5c5092e8ab3e129c3181817359d46899f0a91d79991d79eb40cf9948b37fd'
            '9470d749a13c35dfe1eb1e648cb6ff4f5442ea2c3cb7c070c69647f2e49d0bee'
            '20fd74005597463db1f8eb030e34da6e38a77e04cbdf7a0ba3e90cc258827436')

prepare() {
    patch -d "$pkgbase-$pkgver" -p0 -i $srcdir/cstdint.patch
    patch -d "$pkgbase-$pkgver" -p0 -i $srcdir/qwebengineview.patch
}

build()
{
    cmake -B "build-$pkgver" -S "$pkgbase-$pkgver" \
        -DTULIP_BUILD_TESTS=ON \
        -DTULIP_USE_QT6=ON \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
    cmake --build "build-$pkgver"
}

#check() {
    #cmake --build "build-$pkgver" -t test
    ##Error:
    ##33/35 Test #35: ExternalPluginsBuildTest.............***Failed    0.44 sec
    ##CMake Error at /home/nim/aur/tulip/src/build-5.7.1/thirdparty/sip-4.19.25/siplib/cmake_install.cmake:60 (file):
      ##file cannot create directory: /usr/lib/tulip/python/tulip/native.  Maybe
      ##need administrative privileges.
    ##Call Stack (most recent call first):
      ##/home/nim/aur/tulip/src/build-5.7.1/thirdparty/sip-4.19.25/cmake_install.cmake:47 (include)
      ##/home/nim/aur/tulip/src/build-5.7.1/thirdparty/cmake_install.cmake:54 (include)
      ##/home/nim/aur/tulip/src/build-5.7.1/cmake_install.cmake:69 (include)
#}

package() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
}
