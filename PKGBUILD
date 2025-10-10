# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libopenshot-git
pkgver=0.4.0.r140.g7b4e9992
pkgrel=1
pkgdesc='A high quality, open-source video editing, animation, and playback library for C++, Python, and Ruby (git version)'
arch=('x86_64')
url='https://www.openshot.org/'
license=('LGPL-3.0-or-later')
depends=(
    'babl'
    'ffmpeg4.4'
    'gcc-libs'
    'glibc'
    'jsoncpp'
    'libmagick'
    'libopenshot-audio-git'
    'opencv'
    'protobuf'
    'python'
    'qt5-base'
    'qt5-multimedia'
    'qt5-svg'
    'zeromq')
makedepends=(
    'catch2'
    'cmake'
    'cppzmq'
    'doxygen'
    'git'
    'python-setuptools'
    'swig'
    'unittestpp')
provides=('libopenshot' 'libopenshot.so')
conflicts=('libopenshot')
source=('git+https://github.com/OpenShot/libopenshot.git')
sha256sums=('SKIP')

pkgver() {
    git -C libopenshot describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    export PKG_CONFIG_PATH="/usr/lib/ffmpeg4.4/pkgconfig${PKG_CONFIG_PATH:+":${PKG_CONFIG_PATH}"}"
    
    cmake -B build -S libopenshot \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DENABLE_RUBY:BOOL='OFF' \
        -DUSE_SYSTEM_JSONCPP:BOOL='ON' \
        -Wno-dev
    cmake --build build
}

check() {
    # disable broken tests
    # https://github.com/OpenShot/libopenshot/issues/922
    # https://github.com/OpenShot/libopenshot/issues/948
    ctest --test-dir build --output-on-failure \
        -E '(Caption:caption effect|FFmpegWriter:DisplayInfo|FFmpegWriter:Options_Overloads|FFmpegWriter:Webm)'
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
