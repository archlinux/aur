# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Brendan Szymanski <bscubed@pm.me>

_pkgname=citra
pkgname=$_pkgname-canary-git
pkgver=r9391.f16706288
pkgrel=2
pkgdesc='An experimental open-source Nintendo 3DS emulator/debugger'
arch=('i686' 'x86_64')
url='https://github.com/citra-emu/citra-canary'
license=('GPL2')
depends=('shared-mime-info'
         'desktop-file-utils'
         'sdl2'
         'qt5-base'
         'qt5-multimedia'
         'qt5-tools'
         'qt5-wayland'
         'libxkbcommon-x11'
         'ffmpeg'
         'libfdk-aac'
         'libusb')
makedepends=('git' 'cmake' 'python' 'doxygen')
source=("$_pkgname::git+https://github.com/citra-emu/citra-canary.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgname"

    git submodule update --init --recursive
}

build() {
    cd "$srcdir/$_pkgname"
    
    # Trick the compiler into thinking we're building from a continuous
    # integration tool so the build number is correctly shown in the title
    export CI=true
    export TRAVIS=true
    export TRAVIS_REPO_SLUG=citra-emu/citra-canary
    export TRAVIS_TAG=$(git describe --tags)
    
    # Fix to help cmake find libusb
    CXXFLAGS+=" -I/usr/include/libusb-1.0"
    
    if [[ -d build ]]; then
        rm -rf build
    fi
    mkdir -p build && cd build
    cmake .. \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release \
      -DENABLE_QT_TRANSLATION=ON \
      -DCITRA_ENABLE_COMPATIBILITY_REPORTING=ON \
      -DENABLE_COMPATIBILITY_LIST_DOWNLOAD=ON \
      -DUSE_DISCORD_PRESENCE=ON \
      -DENABLE_FFMPEG_VIDEO_DUMPER=ON \
      -DENABLE_FFMPEG_AUDIO_DECODER=ON \
      -DUSE_SYSTEM_BOOST=OFF \
      -DUSE_SYSTEM_SDL2=ON
    make
}

check() {
    cd "$srcdir/$_pkgname/build"
    make test
}

package() {
    cd "$srcdir/$_pkgname/build"
    make DESTDIR="$pkgdir/" install
    rm -rf "$pkgdir/usr/include"
    rm -rf "$pkgdir/usr/lib"
    rm -rf "$pkgdir/usr/share/cmake"

}
