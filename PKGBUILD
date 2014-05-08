# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Maintainer: Joan Rieu <toto_pirate@hotmail.fr>

pkgname=roxterm-git
pkgver=20120121
pkgrel=1
pkgdesc="Tabbed, VTE-based terminal emulator"
arch=('i686' 'x86_64')
url="http://roxterm.sourceforge.net"
license=('GPL3')
depends=('dbus-glib' 'vte3' 'hicolor-icon-theme' 'dbus-core' 'glib2')
makedepends=('git' 'docbook-xsl' 'xmlto' 'po4a' 'python2')
provides=('roxterm')
conflicts=('roxterm')
install=roxterm-git.install

_gitroot="git://roxterm.git.sourceforge.net/gitroot/roxterm/roxterm"
_gitname="roxterm"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  
  python2 mscript.py configure --prefix=/usr --no-lock
  python2 mscript.py build --no-lock
}

package() {
  cd "$srcdir/$_gitname-build"
  python2 mscript.py install DESTDIR="$pkgdir/" --no-lock
} 
