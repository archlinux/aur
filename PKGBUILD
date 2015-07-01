# Maintainer: Marat Akhin <Marat.Akhin@gmail.com>

pkgname=ibrowse-git
pkgver=20101026
pkgrel=1
pkgdesc="Erlang HTTP client"
arch=('i686' 'x86_64')
url="http://github.com/cmullaparthi/ibrowse"
license=('BSD')
depends=('erlang')
makedepends=('git')

_gitroot="http://github.com/cmullaparthi/ibrowse.git"
_gitname="ibrowse"

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
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  make || return 1
  make DESTDIR="$pkgdir"/usr/lib/erlang install

  # Install the BSD license
  install -m755 -d "$pkgdir"/usr/share/licenses/erlang-ibrowse
  install -m644 "$srcdir/$_gitname"/BSD_LICENSE "$pkgdir"/usr/share/licenses/erlang-ibrowse/LICENSE
}
