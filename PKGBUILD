# Maintainer: zaps166 <spaz16@wp.pl>

pkgname=qmplay2
pkgver=23.02.05
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
        "https://github.com/zaps166/QMPlay2/commit/a9e317f992b415ed79674489f9709b96cd9d329d.patch"
        "https://github.com/zaps166/QMPlay2/commit/6a2caa3fbae7dbc753b65fd07f137e08bcac6657.patch"
)
sha1sums=(616bd7e629e3a0255576d997459cf4eae01c5a50
          42adbb0663832c3ff724d2386cd3221d063c8eec
          5da71e7d1a6dcf847cc5d824d4dfbd1f041411eb
)

prepare()
{
    mkdir -p $srcdir/QMPlay2-build
    cd $srcdir/QMPlay2-src-${pkgver}
    patch -p1 < ../a9e317f992b415ed79674489f9709b96cd9d329d.patch
    patch -p1 < ../6a2caa3fbae7dbc753b65fd07f137e08bcac6657.patch
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
