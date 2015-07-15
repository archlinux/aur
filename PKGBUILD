# Contributor: Borislav Gerassimov (slimmer) <borislavba (at) gmail.com>
# Previous contributors: Jozef K. (jofko) <joffko@gmail.com>
pkgname=antico-git
pkgver=20130303
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Lightweight pure QT4 window manager"
url="http://qt-apps.org/content/show.php/Antico?content=93778"
license=('GPL')
depends=('qt4')
makedepends=('git' 'make')
install=$pkgname.install

_gitroot=git://github.com/antico/antico.git
_gitname=antico
_builddir=$srcdir/$_gitname-build

build() {
  cd $srcdir/
  msg "Connecting to github.com GIT server...."
  if [ -d $srcdir/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting make..."
  git clone $_gitname $_gitname-build

  cd $_builddir
  qmake-qt4 VERBOSE=1 || return 1
  sed -i '19s|lpthread|lpthread -lXext -lX11|g' Makefile
  make || return 1

  install -d $pkgdir/usr/share/antico/theme/default
  install -m755 $_builddir/antico $pkgdir/usr/share/antico/antico
  install -m644 $_builddir/theme/default/* $pkgdir/usr/share/antico/theme/default/
  install -m644 $_builddir/COPYING $pkgdir/usr/share/antico/COPYING
  install -m644 $_builddir/README $pkgdir/usr/share/antico/README
  install -m644 $_builddir/CHANGELOG $pkgdir/usr/share/antico/CHANGELOG

  # .desktop files
  install -d $pkgdir/usr/share/xsessions
  install -m644 $_builddir/antico-gdm.desktop $pkgdir/usr/share/xsessions/
  install -d $pkgdir/usr/share/apps/kdm/sessions
  install -m644 $_builddir/antico-kdm.desktop $pkgdir/usr/share/apps/kdm/sessions/
 
   # For .desktop compatibility
  install -d $pkgdir/usr/bin
  ln -s /usr/share/antico/antico $pkgdir/usr/bin/antico
}