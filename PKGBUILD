# Maintainer: zaps166 <spaz16@wp.pl>

pkgname=qmplay2
pkgver=23.10.22
pkgrel=3
pkgdesc='QMPlay2 is a video and audio player which can play most formats and codecs'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/zaps166/QMPlay2'
license=('LGPL')
depends=('qt5-base' 'qt5-svg' 'qt5-declarative' 'qt5-x11extras' 'ffmpeg' 'libass' 'libgl' 'libva' 'libxv' 'alsa-lib' 'libcdio' 'taglib' 'libcddb' 'libpulse' 'libgme' 'libsidplayfp' 'pipewire' 'rubberband')
optdepends=('pulseaudio: PulseAudio support'
            'game_music_emu-kode54-git: Better chiptune support (less bugs in sound, AUR package)')
makedepends=('ninja' 'clang' 'pkg-config' 'qt5-tools' 'cmake' 'fakeroot' 'patch')
source=("https://github.com/zaps166/QMPlay2/releases/download/${pkgver}/QMPlay2-src-${pkgver}.tar.xz"
        "fed57c8cf746812bdc93704af7d0ebcfa69a5156.patch"
)
sha256sums=(d81c5a81a8839ac441eb7466eb16931aab92f71fd784a3b3e1d709272c4237cf
            d746e7750e08833f0d9daa7b998f18e51f7edd1d97be65b08dadc7088b5f1468
)

prepare()
{
    mkdir -p $srcdir/QMPlay2-build
    cd $srcdir/QMPlay2-src-${pkgver}
    patch -p1 < $srcdir/fed57c8cf746812bdc93704af7d0ebcfa69a5156.patch
}

build()
{
    cd $srcdir/QMPlay2-build
    cmake \
        -G Ninja \
        -DCMAKE_C_COMPILER=clang \
        -DCMAKE_CXX_COMPILER=clang++ \
        ../QMPlay2-src-${pkgver} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DUSE_CHIPTUNE_SID=ON \
        -DUSE_LINK_TIME_OPTIMIZATION=OFF \
        -DUSE_PCH=ON \
        -DUSE_GLSLC=OFF \
        -DUSE_GIT_VERSION=OFF
    time ninja
}

package()
{
    cd $srcdir/QMPlay2-build
    DESTDIR=$pkgdir ninja install
}
