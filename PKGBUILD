# Maintainer: Allen Choong Chieng Hoon <allen dot choong at gmail dot com>
pkgname=ironahk-git
pkgver=20120716
pkgrel=1
pkgdesc="Cross platform .NET rewrite of the popular AutoHotkey scripting language for desktop automation"
arch=('i686' 'x86_64')
url="http://www.ironahk.net/"
license=('custom')
depends=('mono')
makedepends=('git')

_gitroot="git://github.com/polyethene/IronAHK.git"
_gitname="IronAHK"

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
  #cd "$srcdir/$_gitname-build"

  #make
}

package() {
  cd "$srcdir/$_gitname-build"
  mkdir -p $pkgdir/usr/bin
  chmod u+x Deploy/setup.sh
  make DESTDIR="$pkgdir/usr/" prefix="$pkgdir/usr/" install
  echo "#!/bin/sh" > "$pkgdir/usr/bin/ironahk"
  echo "exec mono \"/usr/lib/IronAHK/IronAHK.exe\" \"\$@\"" >> "$pkgdir/usr/bin/ironahk"
} 

