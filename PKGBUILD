# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgbase=uzbl-next-git
pkgrel=1
pkgname=('uzbl-core-next-git' 'uzbl-browser-next-git' 'uzbl-tabbed-next-git')
pkgver=2012.05.14.1260.g315da25
arch=('i686' 'x86_64')
url="http://www.uzbl.org"
license=('GPL3')
depends=('webkitgtk' 'cairo')
makedepends=('git')
source=("git+https://github.com/uzbl/uzbl.git#branch=next")
md5sums=('SKIP')
_gitname="uzbl"
options=('!emptydirs')

pkgver() {
  cd "$srcdir"/"$_gitname"
  git describe --tags | sed 's|-|.|g'
}

build() {
  cd "$srcdir"/"$_gitname"
  make PREFIX=/usr
}

package_uzbl-core-next-git() {
  pkgdesc="Webpage interface component meant for integration with other tools and scripts"
  provides=('uzbl-core')
  conflicts=('uzbl-core')
  optdepends=('socat: to interface with the socket'
	      'dmenu: to run some of the example scripts'
              'zenity: to run some of the example scripts'
              'python: to run some of the example scripts'
              'xclip: for clipboard related keybindings'
	      'pygtk: for uzbl-tabbed')
  install=uzbl.install
  
  cd "$srcdir/$_gitname"
  make clean
  make DESTDIR="$pkgdir" PREFIX=/usr install-uzbl-core
}

package_uzbl-browser-next-git() {
  install=uzbl.install
  arch=('any')
  pkgdesc="A complete browser experience based on uzbl-core"
  depends=("uzbl-core-next-git=$pkgver"
	   'desktop-file-utils' 'python' 'python2')
  provides=('uzbl-browser')
  conflicts=('uzbl-browser')
  install -d $pkgdir/usr/share/appdata
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" PREFIX=/usr install-uzbl-browser
  # avoid conflicts
  rm -f $pkgdir/usr/bin/uzbl-core \
     $pkgdir/usr/share/uzbl/docs/AUTHORS \
     $pkgdir/usr/share/uzbl/docs/COMMUNITY.md \
     $pkgdir/usr/share/uzbl/docs/CONTRIBUTING.md \
     $pkgdir/usr/share/uzbl/docs/FAQ.md \
     $pkgdir/usr/share/uzbl/docs/INSTALL.md \
     $pkgdir/usr/share/uzbl/docs/README.md \
     $pkgdir/usr/share/uzbl/docs/config.h \
     $pkgdir/usr/bin/uzbl-tabbed \
     $pkgdir/usr/share/man/man1/uzbl-core.1 
}

package_uzbl-tabbed-next-git() {
  pkgdesc="Tabbing manager providing multiple uzbl-browser instances in 1 window"
  arch=('any')
  depends=('python2' 'uzbl-core')
  provides=('uzbl-tabbed')
  conflicts=('uzbl-tabbed')
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" PREFIX=/usr install-uzbl-tabbed
}
  
