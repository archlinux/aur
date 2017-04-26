# Maintainer: zaps166 <spaz16@wp.pl>

pkgname=qmplay2
pkgver=17.04.21
pkgrel=2
pkgdesc='QMPlay2 is a video and audio player which can play most formats and codecs'
arch=('i686' 'x86_64' 'armv7' 'armv6' 'armv5')
url='http://zaps166.sourceforge.net/?app=QMPlay2'
license=('LGPL')
depends=('qt5-base' 'qt5-svg' 'ffmpeg' 'libass' 'libgl' 'libva' 'libxv' 'alsa-lib' 'libcdio' 'taglib' 'libcddb' 'libpulse' 'libgme' 'libsidplayfp')
optdepends=('pulseaudio: PulseAudio support'
            'game_music_emu-kode54-git: Better chiptune support (less bugs in sound, AUR package)')
makedepends=('make' 'gcc' 'pkg-config' 'qt5-tools' 'cmake')
source=("https://github.com/zaps166/QMPlay2/releases/download/${pkgver}/QMPlay2-src-${pkgver}.tar.xz"
        "https://github.com/zaps166/QMPlay2/commit/b50d8bea09d7010896e324919845c4d9108b1ba2.diff")
sha1sums=(87d95132f71826de4f83c0502965415c9362824a
          91c5acccb4ce5af2afd06c4a4206979f1fd5d862)

build()
{
	# Uncomment below line if you don't want to have 'libsidplayfp' dependency and remove it from 'depends' list
	#USE_SIDPLAYFP='-DUSE_CHIPTUNE_SID=OFF'

	# Uncomment below line if you want to use 'jemalloc' and add it to 'depends' list
	#USE_JEMALLOC='-DUSE_JEMALLOC=ON'

	cd $srcdir
	patch -d QMPlay2-src-$pkgver -p1 -i ../b50d8bea09d7010896e324919845c4d9108b1ba2.diff
	mkdir -p QMPlay2-build
	cd QMPlay2-build
	cmake ../QMPlay2-src-$pkgver -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DUSE_QT5=ON -DUSE_LINK_TIME_OPTIMIZATION=ON $USE_JEMALLOC $USE_SIDPLAYFP
	time make
}

package()
{
	cd $srcdir/QMPlay2-build
	make DESTDIR=$pkgdir install
}
