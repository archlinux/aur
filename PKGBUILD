# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=econnman-git
pkgver=20130318
pkgrel=2
pkgdesc="Enlightenment ConnMan user interface"
arch=('any')
url="http://www.enlightenment.org"
license=('LGPL3')
depends=('python2-efl-git' 'python2-e_dbus' 'connman')
makedepends=('git')
conflicts=('econnman' 'econnman-svn')
provides=('econnman')
source=('bindings-update.patch'
        'configure.patch')
md5sums=('f07a35832209505768c7fcd375a2de59'
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
  patch -Np1 < ../bindings-update.patch
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
