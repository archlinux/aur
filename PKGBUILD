# Maintainer: Julian Xhokaxhiu < info at julianxhokaxhiu dot com >

pkgname=sdl2-rbp-git
pkgver=2.0.3.84285c1d8ca4
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

prepare() {
  # reset build folder
  rm -rf build
  mkdir build
}

build() {
  cd sdl2

  ./configure --host=armv7l-raspberry-linux-gnueabihf --disable-pulseaudio --disable-esd --disable-video-mir --disable-video-wayland --disable-video-x11 --disable-video-opengl
  make
}

package() {
  make -C build DESTDIR="$pkgdir/" install

  install -Dm644 sdl2/COPYING.txt "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
