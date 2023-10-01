# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libopenshot-git
pkgver=0.3.2.r31.g95eccafc
pkgrel=1
pkgdesc='A high quality, open-source video editing, animation, and playback library for C++, Python, and Ruby (git version)'
arch=('x86_64')
url='https://www.openshot.org/'
license=('LGPL3')
depends=('gcc-libs' 'glibc' 'libavcodec.so' 'libavformat.so' 'libavutil.so'
         'libswscale.so' 'libswresample.so' 'imagemagick' 'libopenshot-audio-git' 'python'
         'libjsoncpp.so' 'qt5-base' 'qt5-multimedia' 'qt5-svg' 'zeromq')
makedepends=('git' 'cmake' 'cppzmq' 'doxygen' 'swig' 'unittestpp')
provides=('libopenshot' 'libopenshot.so')
conflicts=('libopenshot')
source=('git+https://github.com/OpenShot/libopenshot.git')
sha256sums=('SKIP')

pkgver() {
    git -C libopenshot describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S libopenshot \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DUSE_SYSTEM_JSONCPP:BOOL='ON' \
        -DENABLE_RUBY='OFF' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
