# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=exult-git
pkgver=6891.176935e
pkgrel=1
pkgdesc="A recreation of the Ultima 7 engine"
arch=('i686' 'x86_64')
url="http://exult.sourceforge.net/"
license=('GPL2')
depends=('sdl_mixer' 'alsa-lib' 'gcc-libs' 'libxft')
optdepends=('libpng' 'timidity++')
makedepends=('git')
provides=('exult')
conflicts=('exult' 'exult-cvs' 'exult-svn')
replaces=('exult-cvs' 'exult-svn')
source=('exult::git+https://github.com/exult/exult.git'
        'http://downloads.sourceforge.net/exult/exult_audio.zip')
md5sums=('SKIP'
         '1905328f00bbbfee33812c1942bc7880')

pkgver() {
  cd "$srcdir/exult"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/exult"
  ./autogen.sh

  LIBS="-lXft -lX11" ./configure --prefix=/usr --enable-shared --disable-static \
    --with-timidity="/etc/timidity++/timidity.cfg"
  make
}

package() {
  cd "$srcdir/exult"
  make DESTDIR="$pkgdir" install

  # Install audio files
  install -d -m755 "$pkgdir"/usr/share/exult/music
  install "$srcdir"/*.flx "$pkgdir"/usr/share/exult/
  install "$srcdir"/*.txt "$pkgdir"/usr/share/exult/
  install "$srcdir"/music/*.ogg "$pkgdir"/usr/share/exult/music
}
