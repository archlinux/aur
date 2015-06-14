# Maintainer:  AppleBloom <rat.o.drat@gmail.com>
# Previous maintainer:  Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Martin Panter <vadmium+aur@gmail.com>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: ma-79 <ma65547@gmail.com> 

pkgname=mplayer2
pkgver=20131009
pkgrel=9
pkgdesc='Advanced general-purpose media player. A fork of the original MPlayer project'
arch=('i686' 'x86_64')
license=('GPL')
url='http://www.mplayer2.org/'
install=$pkgname.install
depends=('a52dec' 'aalib' 'cdparanoia' 'desktop-file-utils' 'enca' 'faad2' 'ffmpeg'
         'fontconfig' 'freetype2' 'jack' 'ladspa' 'lame' 'libass' 'libbluray'
         'libcaca' 'libcdio-paranoia' 'libdca' 'libdvdcss' 'libdvdnav' 'libdvdread'
         'libgl' 'libjpeg' 'libmad' 'libpulse' 'libquvi' 'libvdpau'
         'libxinerama' 'libxss' 'libxv' 'libxxf86dga' 'libxxf86vm' 'lirc-utils'
         'mpg123' 'ncurses' 'sdl' 'ttf-dejavu' 'giflib')
makedepends=('mesa' 'libgl' 'unzip' 'yasm' 'python' 'python-docutils' 'git')
backup=('etc/mplayer/codecs.conf' 'etc/mplayer/input.conf')
provides=('mplayer')
conflicts=('mplayer')
options=(!emptydirs)
#_commit=2c378c71a4d9b1df382db9aa787b646628b4e3f9
_commit=6c87a981baa4972fd71c25dfddea017b5a972e89
source=(https://github.com/Barthalion/mplayer2/archive/$_commit.tar.gz
#       http://git.mplayer2.org/mplayer2/snapshot/mplayer2-$_commit.tar.bz2
        giflib-5.0.patch
        giflib-5.1.patch
        quvi-0.9.patch
        vo_gl_locale_fix.patch
        input_buffer_padding.patch
        theora.patch)
sha256sums=('e2e0e7ec17d4f206daa7b8cdd6e0f4e58c13e9ebf9b82d4041a18ccbb34013d5'
#           '141f8a641acfd1fcd249c096f712bab2ecaaa7034a7e0e77268a92ad85a4a90b'
            '20706ebb35e7c1935ae263c48d623a878db3b634ca575927913f56d9ce059c7a'
            'e77724d0f684961fdebdb64f6fbb15f1ced8594b467decccd06ece67a8f43fb0'
            'c8aedad5889c0146bdc70f7744dc75c9b2e97c00973c965358224f2bb7eaea6b'
            '6b0990e8eb011358292fc3f519a1d37cf9fbf6cf38384414a1edb356a21d2184'
            'e4309ab77add15eb36f324646460a9307d2349c1345d0826508c3fab70c7dbde'
            '31b4699024b7ef2410ce4d446f2082f80ef57794e20c4632a9733a66a443cf8d')

prepare() {
  cd "$pkgname-$_commit"
  sed 's/gmplayer/mplayer/g' -i etc/mplayer.desktop
  find -type f -exec sed -e 's/python3/python/' -i {} \;
  patch -Np1 -i ../giflib-5.0.patch
  patch -Np1 -i ../giflib-5.1.patch
  patch -Np1 -i ../quvi-0.9.patch
  patch -Np1 -i ../vo_gl_locale_fix.patch
  patch -Np1 -i ../input_buffer_padding.patch
  patch -Np0 -i ../theora.patch
}

build() {
  cd "$pkgname-$_commit"

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
  cd "$pkgname-$_commit"
  make DESTDIR="$pkgdir" install

  install -Dm644 etc/{codecs.conf,input.conf,example.conf} "$pkgdir"/etc/mplayer/
  install -dm755 "$pkgdir"/usr/share/mplayer/
  ln -s /usr/share/fonts/TTF/DejaVuSans.ttf "$pkgdir"/usr/share/mplayer/subfont.ttf

  install -dm755 "$pkgdir"/usr/share/applications/
  install -m 644 etc/mplayer.desktop "$pkgdir"/usr/share/applications/
}
