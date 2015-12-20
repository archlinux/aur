# Maintainer: Mateusz Łukasik <mati75@linuxmint.pl>

pkgname=tinywm-git
pkgver=20121222
pkgrel=1
pkgdesc="A tiny window manager written in only ~50 lines of code"
arch=('i686' 'x86_64')
url="http://incise.org/tinywm.html"
license=('custom')
makedepends=('git')
provides=('tinywm')
conflicts=('tinywm')
depends=('libx11')
optdepends=('python-xlib: for python version (uncomment last line of 
PKGBUILD)')

_gitroot="git://github.com/mackstann/tinywm.git"
_gitname="tinywm"

build() {
  msg "Avahi needs to be running to run tests."
  msg "Remove the 'make test' line in the PKGBUILD if you don't want to 
run tests."
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
  
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  install -D -m755 tinywm $pkgdir/usr/bin/tinywm
  install -D -m644 README $pkgdir/usr/share/licenses/$pkgname/LICENSE
  #install -D -m755 tinywm.py $pkgdir/usr/bin/tinywm.py
}
