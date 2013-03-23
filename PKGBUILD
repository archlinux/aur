# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=python-efl-git
pkgver=20130322
pkgrel=1
pkgdesc="Python bindings for the Enlightenment Foundataion Libraries"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL3')
depends=('elementary-git' 'python')
provides=('python-efl-svn')
conflicts=('python-efl-svn')
makedepends=('git' 'cython')

_gitroot="git://git.enlightenment.org/bindings/python/python-efl.git"
_gitname="python-efl"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  python setup.py build
}

package() {
  cd "$srcdir/$_gitname-build"
  
  python setup.py install --root="$pkgdir"

  rm -r "$srcdir/$_gitname-build"
}
