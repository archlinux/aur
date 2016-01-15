# Maintainer:  AppleBloom <rat.o.drat@gmail.com>
# Previous maintainer:  Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Martin Panter <vadmium+aur@gmail.com>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: ma-79 <ma65547@gmail.com> 

pkgname=mplayer2
pkgver=20131009
pkgrel=11
pkgdesc='Advanced general-purpose media player. A fork of the original MPlayer project'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/nezumisama/mplayer2'
install=$pkgname.install
depends=('a52dec' 'aalib' 'cdparanoia' 'desktop-file-utils' 'enca' 'faad2' 'ffmpeg'
         'fontconfig' 'freetype2' 'jack' 'ladspa' 'lame' 'libass' 'libbluray'
         'libcaca' 'libcdio-paranoia' 'libdca' 'libdvdcss' 'libdvdnav' 'libdvdread'
         'libgl' 'libjpeg' 'libmad' 'libpulse' 'libquvi' 'libvdpau'
         'libxinerama' 'libxss' 'libxv' 'libxxf86dga' 'libxxf86vm' 'lirc-utils'
         'mpg123' 'ncurses' 'sdl' 'ttf-dejavu' 'giflib')
makedepends=('mesa' 'libgl' 'yasm' 'python' 'python-docutils')
backup=('etc/mplayer/codecs.conf' 'etc/mplayer/input.conf')
provides=('mplayer')
conflicts=('mplayer')
options=(!emptydirs)
source=(https://github.com/nezumisama/mplayer2/archive/stable.tar.gz)
sha256sums=('2f812f946a03acf8d3984ef84b3782476d2a07cf34ca95e5c8d12f7efbcb654b')

build() {
  cd "$pkgname-stable"

  LDFLAGS+=" -ltheoradec" \
  ./configure --prefix=/usr --confdir=/etc/mplayer \
              --enable-translation --language=all \
              --enable-runtime-cpudetection \
              --enable-joystick \
              --enable-gif \
              --disable-speex \
              --disable-openal \
              --disable-libdv \
              --disable-musepack
  make
}

package() {
  cd "$pkgname-stable"
  make DESTDIR="$pkgdir" install

  install -Dm644 etc/{codecs.conf,input.conf,example.conf} "$pkgdir"/etc/mplayer/
  install -dm755 "$pkgdir"/usr/share/mplayer/
  ln -s /usr/share/fonts/TTF/DejaVuSans.ttf "$pkgdir"/usr/share/mplayer/subfont.ttf

  install -dm755 "$pkgdir"/usr/share/applications/
  install -m 644 etc/mplayer.desktop "$pkgdir"/usr/share/applications/
}
