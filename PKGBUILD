# Maintainer: Lukas Sabota <LTsmooth42 _at_ gmail _dot_ com>

pkgname=fceux-svn
pkgver=2888
pkgrel=1
pkgdesc="Fast and ultra-compatible NES/Famicom emulator with SDL, OpenGL and SVGALIB support"
arch=('i686' 'x86_64')
url="http://fceux.com/"
license=('GPL')
depends=('sdl' 'lua51' 'gtk2' 'gd' 'libgl')
makedepends=('subversion' 'scons' 'libgl' 'glu')
optdepends=('xchm: for viewing the help manual')
provides=('fceu' 'gfceux' 'fceux')
conflicts=('fceu' 'gfceux' 'fceux')
replaces=()
backup=()
options=()
install=
source=()
noextract=()

_svntrunk=http://svn.code.sf.net/p/fceultra/code/fceu/trunk
_svnmod=fceu
LDFLAGS=''

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  scons RELEASE=1
}

package() {
  cd "$srcdir/$_svnmod-build"

  install -D -m755 bin/fceux "$pkgdir/usr/bin/fceux"
  install -D -m755 bin/fceux-net-server "$pkgdir/usr/bin/fceux-net-server"
  install -D -m644 bin/fceux.chm "$pkgdir/usr/share/doc/fceux/fceux.chm"
  install -D -m644 "fceux.desktop" "$pkgdir/usr/share/applications/fceux.desktop"
  install -D -m644 "fceux.png" "$pkgdir/usr/share/pixmaps/fceux.png"
}
