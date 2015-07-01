# Maintainer: Alois Nespor <info at aloisnespor dot info>
 
pkgname=gst-mpg123
pkgver=20121118
pkgrel=1
pkgdesc="MP3 decoding for gstreamer-0.10, using the mpg123 library."
arch=('i686' 'x86_64')
url="https://github.com/dv1/gstmpg123.git"
license=('LGPL')
depends=('gstreamer0.10-base' 'mpg123')
makedepends=('pkgconfig' 'git')

_gitroot="git://github.com/dv1/gstmpg123.git"
_gitname="gstmpg123"

build() {

  msg "Connecting to the git repository..."
  if [ -d "$srcdir/$_gitname" ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  cd "$srcdir"
  rm -rf $_gitname-build
  git clone $_gitname $_gitname-build
  cd $_gitname-build

  msg2 "Configuring..."  
  sed -i 's:python:python2:' waf  
  sed -i 's:python:python2:' wscript
  ./waf configure build_0_10 --prefix=/usr --disable-gstreamer-1-0 

}
 
package() {
  cd "$srcdir/$_gitname-build"
 DESTDIR="$pkgdir" ./waf install_0_10
}

