# Maintainer: zaps166 <spaz16@wp.pl>

pkgname=qmplay2
pkgver=24.12.06
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
        "https://github.com/zaps166/QMPlay2/commit/2ded75d71b78ce7859bc0b9b11f30e2dfd39da95.patch")
sha256sums=(dc59d9b87f3af6753195be1793a2e10aebf3ad59d20e2e43a5c21e10a46c7cec
            c5dc82c79f2cf474b82fa838b90ad342e89402d8d10dd1fd0dbf9ae23f6b788d
)

prepare()
{
    mkdir -p $srcdir/QMPlay2-build
    cd $srcdir/QMPlay2-src-${pkgver}
    patch -p1 < ../2ded75d71b78ce7859bc0b9b11f30e2dfd39da95.patch
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
