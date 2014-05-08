# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net> awagner on irc.freenode.net
# Contributor: Murtuza Akhtari <inxsible at gmail dot com>
# Adopted for updates by: BKLive <bkunixos@gmail.com>

pkgname=dzen2-xft-xpm-xinerama-svn
pkgver=271
pkgrel=2
pkgdesc="X notification utility with Xinerama, XPM, XFT and gadgets, svn version"
arch=('i686' 'x86_64')
url="http://gotmor.googlepages.com/dzen"
license=('MIT')
depends=('libxpm' 'libxinerama' 'libxft' 'libxss')
makedepends=('subversion' 'gcc' 'pkg-config' 'db')
provides=('dzen2')
conflicts=('dzen2' 'dzen2-gadgets-svn' 'dzen2-svn')

_svntrunk=http://dzen.googlecode.com/svn/trunk/
_svnmod=dzen2

build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf $_svnmod-build
  cp -rf $_svnmod $_svnmod-build
  cd $_svnmod-build

  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 \
  CFLAGS=" -Wall -Os ${INCS} -DVERSION=\"${VERSION}\" -DDZEN_XINERAMA -DDZEN_XPM -DDZEN_XFT `pkg-config --cflags xft`" \
  LIBS=" -L/usr/lib -lc -L${X11LIB} -lXss -lX11 -lXinerama -lXpm `pkg-config --libs xft`" || return 1
  make PREFIX=/usr DESTDIR=$startdir/pkg install || return 1

  #license
  install -m644 -D LICENSE $startdir/pkg/usr/share/licenses/$_svnmod/COPYING

  #docs
  mkdir -p $startdir/pkg/usr/share/doc/$_svnmod
  cp README* $startdir/pkg/usr/share/doc/$_svnmod

  #gadgets
  cd gadgets
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 || return 1
  make PREFIX=/usr DESTDIR=$startdir/pkg install || return 1

  #docs
  cp README* $startdir/pkg/usr/share/doc/$_svnmod

}
