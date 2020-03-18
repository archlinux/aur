# Maintainer: zaps166 <spaz16@wp.pl>

pkgname=qmplay2-git
pkgver=19.12.19
pkgrel=4
pkgdesc='QMPlay2 is a video and audio player which can play most formats and codecs'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/zaps166/QMPlay2'
license=('LGPL')
depends=('qt5-base' 'qt5-svg' 'qt5-declarative' 'qt5-x11extras' 'ffmpeg' 'libass' 'libgl' 'libva' 'libxv' 'alsa-lib' 'libcdio' 'taglib' 'libcddb' 'libpulse' 'libgme' 'libsidplayfp')
optdepends=('pulseaudio: PulseAudio support'
            'game_music_emu-kode54-git: Better chiptune support (less bugs in sound, AUR package)')
conflicts=('qmplay2')
provides=('qmplay2')
makedepends=('ninja' 'clang' 'git' 'pkg-config' 'qt5-tools' 'cmake' 'fakeroot' 'shaderc')
source=('git+https://github.com/zaps166/QMPlay2')
sha256sums=('SKIP')

pkgver() {
    cd QMPlay2
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd QMPlay2
    git submodule update --init
}

build() {
    cd $srcdir
    mkdir -p QMPlay2-build
    cd QMPlay2-build
    cmake \
        -G Ninja \
        -DCMAKE_C_COMPILER=clang \
        -DCMAKE_CXX_COMPILER=clang++ \
        ../QMPlay2 \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DUSE_LINK_TIME_OPTIMIZATION=OFF \
        -DUSE_PCH=ON \
        -DUSE_GLSLC=ON
    time ninja
}

package() {
    cd $srcdir/QMPlay2-build
    DESTDIR=$pkgdir ninja install
}
