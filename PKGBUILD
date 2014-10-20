# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=prboom-plus-svn
pkgver=4403
pkgrel=1
pkgdesc="An enhanced version of the PrBoom Doom engine port"
arch=('i686' 'x86_64')
url="http://prboom-plus.sourceforge.net/"
license=('GPL')
depends=('libgl' 'libmad' 'mesa' 'portmidi' 'sdl_image' 'sdl_mixer' 'sdl_net')
makedepends=('subversion' 'make' 'autoconf' 'automake' 'deutex-devel' 'unzip' 'imagemagick')
conflicts=('prboom-plus')
source=('prboom-plus::svn+https://svn.prboom.org/repos/branches/prboom-plus-24/prboom2'
        prboom-plus.desktop prboom-plus-game-server.desktop)
sha256sums=('SKIP'
            'a858c1dbb4fb10f87d1348ae5a521726e5e6f9ba4e41a392af57aa5b9b6d791d'
            '013f1ebf0ff41592b44d8cd510824d258dd06a53ddedafc1e87403a70d37159a')

pkgver() {
  cd prboom-plus
  local ver="$(svnversion)"
  printf "%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/prboom-plus"

  if [ ! -e /usr/share/games/doom/doom2.wad ]; then
    echo "Please place doom2.wad into /usr/share/games/doom."
    echo "You may install Freedoom if you do not own DOOM II."
    echo " Press Enter to continue."
    read -a _unused
    if [ ! -e /usr/share/games/doom/doom2.wad ]; then
      echo "/usr/share/games/doom/doom.wad not found!"
      return 1
    fi
  fi

  tr -d '\r' < bootstrap > bootstrap.fixed
  mv -f bootstrap.fixed bootstrap
  ln -sf /usr/share/games/doom/doom2.wad data/
  sed 's|/games|/bin|g' -i src/Makefile.am
  sed 's|CFLAGS_OPT=.*|:|g' -i configure.ac

  sh bootstrap
  ./configure --prefix=/usr --with-waddir=/usr/share/games/doom

  make || return 1
}

package() {
  cd "${srcdir}/prboom-plus"
  make DESTDIR="${pkgdir}" install

  install -d -m755 "${pkgdir}"/usr/share/{applications,pixmaps}

  install -m644 ICONS/prboom-plus.svg "${pkgdir}"/usr/share/pixmaps/prboom-plus.svg

  cd "${srcdir}"
  install -m644 prboom-plus{,-game-server}.desktop "${pkgdir}"/usr/share/applications/
}
