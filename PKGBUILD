# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=sdl2_mixer-hg
pkgver=2.0.2.r5.131286a6b7b8+
pkgrel=1
pkgdesc="A simple multi-channel audio mixer (Version 2, development version)"
arch=('i686' 'x86_64')
url="http://libsdl.org/projects/SDL_mixer"
license=('MIT')
depends=('sdl2-hg' 'libvorbis' 'libmodplug' 'mpg123' 'flac')
makedepends=('mercurial' 'fluidsynth')
optdepends=('fluidsynth: MIDI software synth, replaces built-in timidity')
provides=('sdl2_mixer')
conflicts=('sdl2_mixer' 'sdl2-mixer-hg')
source=($pkgname::'hg+http://hg.libsdl.org/SDL_mixer')
md5sums=('SKIP')

pkgver() {
  cd $pkgname

  local _lasttag=$(hg tags -q | sort -r | grep release- | head -n1)
  local _commits=$(hg log --template "{node}\n" -r $_lasttag:tip | wc -l)
  printf "%s.r%s.%s" "${_lasttag/release-}" "$_commits" "$(hg identify -i)"
}

prepare() {
  # fix timidity path
  sed -e "s|/etc/timidity|/etc/timidity++|g" \
      -e "s|/etc/timidity++.cfg|/etc/timidity++/timidity.cfg|g" \
      -i $pkgname/timidity/options.h
}

build() {
  cd $pkgname

  ./autogen.sh
  ./configure --disable-static --prefix=/usr
  make
}

package() {
  cd $pkgname

  make DESTDIR="$pkgdir/" install install-bin
  mv "$pkgdir"/usr/bin/playwave{,2}
  mv "$pkgdir"/usr/bin/playmus{,2}

  install -Dm644 COPYING.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
