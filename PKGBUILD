pkgname=mando-git
pkgver=20110407
pkgrel=1
pkgdesc="human computer interface using a camera and a projector"
arch=(i686 x86_64)
url="http://mando.sourceforge.net/"
license=('GPL')
depends=('lapack' 'fftw' 'qt' 'libxtst' 'v4l-utils')
makedepends=('git' 'gcc-fortran' 'glut' 'boost')
source=(f2c.h
	videodev.h)
md5sums=('b24aef06939beb5300b835805896ea0f'
         '427e5832466726a86e5b55b1329d2e9e')

_gitroot="git://mando.git.sourceforge.net/gitroot/mando/mando"
_gitname="mando"

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
  export CFLAGS="$CFLAGS -isystem $srcdir"
  export CPPFLAGS="$CPPFLAGS -isystem $srcdir"
  mkdir -p $srcdir/linux
  cp $srcdir/videodev.h $srcdir/linux/videodev.h
  [ -f Makefile ] || ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
  cd $pkgdir/usr/bin
  mv mando mando.bin
  echo -e '#!/bin/sh\nLD_PRELOAD=/usr/lib/libv4l/v4l1compat.so mando.bin "$*"' >mando
  chmod +x mando
}
