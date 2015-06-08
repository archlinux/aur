# Contributor: Thomas Dziedzic < gostrc at gmail >
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=sawfish-theming-git
pkgver=20120328
pkgrel=1
pkgdesc='A window manager extensible using a Lisp-based scripting language.'
arch=('i686' 'x86_64')
url='http://sawfish.wikia.com'
license=('GPL')
depends=('libsm' 'rep-gtk-git' 'hicolor-icon-theme')
makedepends=('git' 'gettext' 'emacs')
optdepends=('emacs: for using sawfish.el')
provides=('sawfish-git')
conflicts=('sawfish')
install=sawfish.install
options=('!libtool')
source=()
md5sums=()

_gitroot='git://git.tuxfamily.org/gitroot/sawfish/main.git'
_gitname='sawfish'

build() {
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    (cd $_gitname && git pull origin)
  else
    git clone $_gitroot $_gitname --branch theming-1.9
  fi
  

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  [ -d $_gitname-build ] && rm -rf $_gitname-build
  git clone $_gitname $_gitname-build
  cd $_gitname-build

  ./autogen.sh 
  ./configure --prefix=/usr --with-nls 
  make 
  emacs -batch -q -f batch-byte-compile sawfish.el
}
package() {
  cd $_gitname-build
  make DESTDIR="$pkgdir" install 
  install -Dm644 sawfish.el $pkgdir/usr/share/emacs/site-lisp/sawfish.el
  install -Dm644 sawfish.elc $pkgdir/usr/share/emacs/site-lisp/sawfish.elc
} 
