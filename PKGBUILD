# Maintainer : Daniel Bermond <dbermond@archlinux.org>

pkgname=libopenshot-git
pkgver=0.3.0.r8.g510a7690
pkgrel=1
pkgdesc='A high quality, open-source video editing, animation, and playback library for C++, Python, and Ruby (git version)'
arch=('x86_64')
url='https://www.openshot.org/'
license=('LGPL3')
depends=('gcc-libs' 'glibc' 'libavcodec.so' 'libavformat.so' 'libavutil.so'
         'libswscale.so' 'libswresample.so' 'imagemagick' 'libopenshot-audio-git' 'python'
         'libjsoncpp.so' 'qt5-base' 'qt5-multimedia' 'qt5-svg' 'x264' 'zeromq')
makedepends=('git' 'cmake' 'doxygen' 'swig' 'unittestpp')
provides=('libopenshot' 'libopenshot.so')
conflicts=('libopenshot')
source=('git+https://github.com/OpenShot/libopenshot.git')
sha256sums=('SKIP')

pkgver() {
    cd libopenshot
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S libopenshot \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DMAGICKCORE_HDRI_ENABLE='1' \
        -DMAGICKCORE_QUANTUM_DEPTH='16' \
        -DUSE_SYSTEM_JSONCPP:BOOL='ON' \
        -DENABLE_RUBY='OFF' \
        -Wno-dev \
        ..
    make -C build
}

check() {
    make -C build test
}

package() {
    make -C build DESTDIR="$pkgdir" install
}
