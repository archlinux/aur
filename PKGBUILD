# This is a PKGBUILD for tracemonkey, firefox's javascript engine.
# Maintainer: Benoit Favre <benoit.favre@gmail.com>
pkgname=tracemonkey-hg
pkgver=62188
pkgrel=1
pkgdesc="Firefox's javascript engine with JIT native code compilation".
arch=(i686 x86_64)
url="https://wiki.mozilla.org/JavaScript:TraceMonkey"
license=('GPL')
makedepends=('mercurial' 'autoconf2.13' 'yasm' 'zip')

_hgroot="http://hg.mozilla.org/"
_hgrepo="tracemonkey"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u
    msg "The local files are updated."
  else
    hg clone $_hgroot
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  #
  # BUILD HERE
  #

  cd js/src  
  autoconf-2.13
  ./configure --prefix=/usr 
  make
}

package() {
  cd "$srcdir/$_hgrepo-build"
  cd js/src
  make DESTDIR="$pkgdir/" install
  cp js "$pkgdir/usr/bin"
} 
