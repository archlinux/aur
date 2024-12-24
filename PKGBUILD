# Maintainer: zaps166 <mumei6102@gmail.com>

pkgname=qmplay2
pkgver=24.12.23
pkgrel=2
pkgdesc='QMPlay2 is a video and audio player which can play most formats and codecs'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/zaps166/QMPlay2'
license=('LGPL')
depends=('qt6-base' 'qt6-svg' 'qt6-declarative' 'qt6-5compat' 'ffmpeg' 'libass' 'libgl' 'libva' 'libxv' 'alsa-lib' 'libcdio' 'taglib' 'libcddb' 'libpulse' 'libgme' 'libsidplayfp' 'pipewire' 'rubberband')
optdepends=('pulseaudio: PulseAudio support'
            'game_music_emu-kode54-git: Better chiptune support (less bugs in sound, AUR package)')
makedepends=('ninja' 'clang' 'pkg-config' 'qt6-tools' 'cmake' 'fakeroot' 'patch')
options=(!lto)
source=("https://github.com/zaps166/QMPlay2/releases/download/${pkgver}/QMPlay2-src-${pkgver}.tar.xz"
        "https://github.com/zaps166/QMPlay2/commit/04e1c2ed09e6edb47c9c0951eceb9055d410f504.patch")
sha256sums=(9b7e53c01dfce2cc7359c889e07b44aefca7af18ceee820561bbc760dc26708a
            e1b43a0ce9bb19ac187a8df803d020a05b45fb1a8e3a881f492208a954b9783b)

prepare()
{
    mkdir -p $srcdir/QMPlay2-build
    cd $srcdir/QMPlay2-src-${pkgver}
    patch -p1 < ../04e1c2ed09e6edb47c9c0951eceb9055d410f504.patch
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
        -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
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
