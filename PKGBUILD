# Maintainer: OS Hazard <oshazard+aur@gmail.com>
pkgname=gtkdialog-svn
pkgver=514
pkgrel=7
pkgdesc="Gtkdialog is a small utility for fast and easy GUI building (SVN)"
arch=('i686' 'x86_64' 'arm')
url="https://code.google.com/p/gtkdialog"
license=('GPL')
depends=('libglade' 'vte')
makedepends=('subversion' 'automake' 'bison' 'flex')
optdepends=('gtkdialog-examples: sample projects - pfeme, pfontview, playmusic')
provides=('gtkdialog')
conflicts=('gtkdialog')
install=gtkdialog.install

#_svntrunk=http://gtkdialog.googlecode.com/svn/trunk
_svntrunk=https://github.com/oshazard/gtkdialog
_svnmod=gtkdialog

build() {
  cd "$srcdir"
  svn checkout $_svntrunk --config-dir ./ $_svnmod
  msg "SVN checkout done or server timeout"
  cd $_svnmod/trunk

  msg "Starting configure..."
  ./autogen.sh --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info

  msg "Running make..."
  make
}

package() {
  cd $_svnmod/trunk
  make DESTDIR=$pkgdir UPDATE_ICON_CACHE=true install
  rm -f $pkgdir/usr/share/info/dir
  mkdir -p $pkgdir/usr/share/doc/$pkgname
  cp -a examples $pkgdir/usr/share/doc/$pkgname/examples
}

