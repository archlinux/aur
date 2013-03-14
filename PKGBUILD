# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=econnman-git
pkgver=20130314
pkgrel=1
pkgdesc="Enlightenment ConnMan user interface"
arch=('any')
url="http://www.enlightenment.org"
license=('LGPL3')
depends=('python2-efl-svn' 'connman')
makedepends=('git')
conflicts=('econnman' 'econnman-svn')
provides=('econnman')
source=('bindings-update.patch'
        'configure.patch')
md5sums=('7a3d14c2ce0412e2fc503d278401a035'
         '9006b3b8d28dbd9a944c497fec40d79f')
         
_gitroot="git://git.enlightenment.org/apps/econnman.git"
_gitname="econnman"

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
  
# Run with python2
  sed -i 's:/usr/bin/python:/usr/bin/python2:' econnman-bin.in

# Patch for new bindings
  patch -Np0 < ../bindings-update.patch
  patch -Np0 < ../configure.patch

  PYTHON=python2 \
  ./autogen.sh --prefix=/usr

  make
}

package() {
  cd "$srcdir/$_gitname-build"
  
  make DESTDIR="$pkgdir" install

# Delete build dir
  rm -r "$srcdir/$_gitname-build"
}
