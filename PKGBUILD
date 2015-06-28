# Maintainer: Sergey Khorev <sergey.khorev@gmail.com>
pkgname=idutils-git
pkgver=20130707
pkgrel=1
pkgdesc="ID database utilities to navigate tokens in source code."
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/idutils"
license=('GPL')
groups=('devel')
makedepends=('git' 'gperf' 'help2man' 'rsync' 'texinfo')
options=('!buildflags')

_gitroot=http://git.savannah.gnu.org/r/idutils.git
_gitname=idutils

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

  ./bootstrap
  ./configure --prefix=/usr
  sed -i doc/idutils.texi -e 's/@table @bullet/@table @code/' -e 's/@itemx --files0-from=@var{FILE}/@item --files0-from=@var{FILE}/'
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
