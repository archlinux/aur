# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=prboom-plus-svn
pkgver=4248
pkgrel=1
pkgdesc="An enhanced version of the PrBoom Doom engine port"
arch=('i686' 'x86_64')
url="http://prboom-plus.sourceforge.net/"
license=('GPL')
depends=('libgl' 'libmad' 'mesa' 'portmidi' 'sdl_image' 'sdl_mixer' 'sdl_net')
makedepends=('subversion' 'make' 'autoconf' 'automake' 'deutex-devel' 'unzip' 'imagemagick')
conflicts=('prboom-plus')
source=(prboom-plus.desktop prboom-plus-game-server.desktop)
sha256sums=('a858c1dbb4fb10f87d1348ae5a521726e5e6f9ba4e41a392af57aa5b9b6d791d'
            '7f3ac5558ab763246402b25e55e8e6d0756e56dcc0c6c42510a9d21b5814f736')

_svntrunk=http://www.crowproductions.de/repos/prboom/branches/prboom-plus-24/prboom2
_svnmod=prboom2

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"

  cd $_svnmod

  if [ ! -e /usr/share/doom/doom2.wad ]; then
    echo "Please place doom2.wad into /usr/share/doom."
    echo "You may install Freedoom if you do not own DOOM II."
    echo " Press Enter to continue."
    read -a _unused
    if [ ! -e /usr/share/doom/doom2.wad ]; then
      echo "/usr/share/doom/doom.wad not found!"
      return 1
    fi
  fi

  tr -d '\r' < bootstrap > bootstrap.fixed
  mv -f bootstrap.fixed bootstrap
  ln -sf /usr/share/doom/doom2.wad data/
  sed 's|/games|/bin|g' -i src/Makefile.am
  sed 's|CFLAGS_OPT=.*|:|g' -i configure.ac

  sh bootstrap
  ./configure	--prefix=/usr --with-waddir=/usr/share/doom

  make || return 1
}

package() {
  cd "${srcdir}/${_svnmod}"
  make DESTDIR="${pkgdir}" install

  install -d -m755 "${pkgdir}"/usr/share/{applications,pixmaps}

  convert ICONS/fouch.ico ICONS/fouch.png
  convert ICONS/god.ico ICONS/god.png
  install -m644 ICONS/fouch.png "${pkgdir}"/usr/share/pixmaps/"${pkgname/-svn}.png"
  install -m644 ICONS/god.png "${pkgdir}"/usr/share/pixmaps/"${pkgname/-svn}-game-server.png"

  cd "${srcdir}"
  install -m644 prboom-plus{,-game-server}.desktop "${pkgdir}"/usr/share/applications/
}
