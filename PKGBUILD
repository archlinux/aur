# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=libopenshot-git
pkgver=0.1.7.r3.gc30dbb9
pkgrel=1
pkgdesc='A high quality, open-source video editing, animation, and playback library for C++, Python, and Ruby (git version)'
arch=('i686' 'x86_64')
url='http://www.openshot.org/'
license=('LGPL3')
depends=('imagemagick' 'ffmpeg' 'libx264' 'libopenshot-audio' 'python' 'jsoncpp' 'qt5-multimedia' 'zeromq')
makedepends=('git' 'cmake' 'doxygen' 'swig' 'unittestpp')
provides=('libopenshot')
conflicts=('libopenshot')
source=("$pkgname"::'git+https://github.com/OpenShot/libopenshot.git')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "$pkgname"
    mkdir -p build
    cd build
    
    if command -v magick >/dev/null 2>&1
    then
        local _im_command='magick'
    else
        local _im_command='convert'
    fi
    
    if "$_im_command" --version | grep -q 'HDRI'
    then
        local _hdri='1'
    else
        local _hdri='0'
    fi
    
    local _depth="$("$_im_command" --version | grep -oE 'Q[0-9]+' | sed 's/Q//')"
    
    #export CXXFLAGS+=" -std=gnu++98"
    
    cmake \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_COLOR_MAKEFILE:BOOL='ON' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DUSE_SYSTEM_JSONCPP:BOOL='ON' \
        -DMAGICKCORE_HDRI_ENABLE="$_hdri" \
        -DMAGICKCORE_QUANTUM_DEPTH="$_depth" \
        -DENABLE_RUBY='0' \
        -Wno-dev \
        ..
    make
}

package() {
    cd "$pkgname"
    cd build
    make DESTDIR="$pkgdir" install
}
