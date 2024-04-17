# Maintainer: zaps166 <spaz16@wp.pl>

pkgname=qmplay2
pkgver=24.04.07
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
        "https://github.com/zaps166/QMPlay2/commit/67aa6108c2625ba03b2f240d0ffbe8cb9149e59e.patch"
        "https://github.com/zaps166/QMPlay2/commit/7add6ca90b84895b24eeecb82dff2bf97957151e.patch"
        "https://github.com/zaps166/QMPlay2/commit/f032defcaf4098d8428734f59dbb401ba49e04a9.patch")
sha256sums=(7c525c936ef9096a3a271865e42fee9f494bd18a3992e56505cac94d07145da7
            2102ef7c80e06ce2feb7c357bbfb460f90987740e0dc42871888cfd5a288ffa7
            fa818c6a72dc551d55effafb27e802726f05752dc42bc14ee718b6daf626d438
            16b5a6bcc1e09e607305c90348299443cba8aa775dee20cf521fa791061c91ad)

prepare()
{
    mkdir -p $srcdir/QMPlay2-build
    cd $srcdir/QMPlay2-src-${pkgver}
    patch -p1 < ../67aa6108c2625ba03b2f240d0ffbe8cb9149e59e.patch
    patch -p1 < ../7add6ca90b84895b24eeecb82dff2bf97957151e.patch
    patch -p1 < ../f032defcaf4098d8428734f59dbb401ba49e04a9.patch
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
