# Maintainer: Julian Xhokaxhiu < info at julianxhokaxhiu dot com >

pkgname=sdl2-rbp-git
pkgver=2.0.3.r1304.84285c1d8ca4
pkgrel=1
pkgdesc="A library for portable low-level access to video, audio and input (development version)"
arch=('arm' 'armv6h' 'armv7h')
url="http://www.libsdl.org"
license=('ZLIB')
provides=('sdl2')
conflicts=('sdl2')
depends=('freeimage' 'openal' 'pango' 'libsndfile' 'alsa-lib' 'libjpeg-turbo' 'libtiff' 'libwebp')
makedepends=('mercurial' 'automake' )
optdepends=('alsa-lib: ALSA audio driver')
source=(sdl2::"hg+http://hg.libsdl.org/SDL")
md5sums=('SKIP')

pkgver() {
  cd sdl2
  _tag=$(hg tags -q | sort -r | grep release- | head -n1)
  _commits=$(hg log --template "{node}\n" -r $_tag:tip | wc -l)
  echo "${_tag/release-}.r$_commits.$(hg identify -i)"
}

build() {
  cd sdl2

  ./configure --host=armv7l-raspberry-linux-gnueabihf --enable-sdl-dlopen \
    --disable-arts --disable-esd --disable-nas \
    --enable-alsa \
    --disable-pulseaudio \
    --disable-video-wayland \
    --without-x --disable-video-x11 --disable-x11-shared \
    --disable-video-x11-xcursor --disable-video-x11-xinerama \
    --disable-video-x11-xinput --disable-video-x11-xrandr \
    --disable-video-x11-scrnsaver --disable-video-x11-xshape \
    --disable-video-x11-vm --disable-video-opengl \
    --disable-video-directfb --enable-video-opengles \
    --enable-video-dummy \
    --disable-rpath
  make CFLAGS="-I/opt/vc/include -I/usr/include -I/opt/vc/include/interface/vcos/pthreads -I/opt/vc/include/interface/vmcs_host/linux $CFLAGS"
}

package() {
  cd sdl2
  make install DESTDIR="${pkgdir}"
  install -Dm644 COPYING.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
