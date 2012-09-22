# Maintainer: Vain <aurmaint1 on host: uninformativ dot de>
pkgname=slinp-git
pkgver=20120922
pkgrel=1
pkgdesc="PDF presentation tool chest"
arch=('i686' 'x86_64')
url='http://www.uninformativ.de/projects/?q=slinp'
license=('custom:PIZZA-WARE')
depends=('gtk3' 'python' 'poppler-glib')
makedepends=('git')

_gitroot="git://github.com/vain/slinp.git"
_gitname="slinp"

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

  #
  # BUILD HERE
  #

  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir" prefix="/usr" install

  # This is specific to Arch Linux.
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
