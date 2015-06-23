pkgname=dxr3player-cvs
#pkgver=`date +%Y%m%d`
pkgver=20130427
pkgrel=1
pkgdesc="DVD player for the DXR3 MPEG-2 decoder board dxr3Player is a DVD player for Linux and the \
 DXR3 (aka Hollywood+) MPEG-2 decoder board. It can now also play DVDs without a DXR3 board, \
 using the X Window System through the SDL library."
arch=('i686' 'x86_64')
url="http://dxr3player.sourceforge.net/"
license=('GPL')
depends=('em8300-utils' 'em8300' 'libmad' 'libmpeg2' 'sdl' 'lirc' 'lirc-utils')
makedepends=('cvs' 'em8300-utils' 'gcc' 'libpng')
#provides=('dxr3player')
conflicts=('dxr3player')
replaces=('dxr3player')
_cvsroot=":pserver:anonymous@dxr3player.cvs.sourceforge.net:/cvsroot/dxr3player"
_cvsmod="dxr3player"

arch=('i686')

build() {
    cd "$srcdir"
    msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
    if [ -d $_cvsmod/CVS ]; then
	cd $_cvsmod
	cvs -z3 update -d
    else
	cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
	cd $_cvsmod
    fi
	 

    msg "CVS checkout done or server timeout"
    msg "Starting make..."
			     
    rm -rf "$srcdir/$_cvsmod-build"
    cp -r "$srcdir/$_cvsmod" "$srcdir/$_cvsmod-build"
    cd "$srcdir/$_cvsmod-build"
    
      aclocal || return 1
      autoheader || return 1
      automake --add-missing --copy || return 1
      autoconf || return 1

  ./configure  --prefix=/usr --enable-overlay --with-lirc=/usr --enable-static-lirc --enable-joystick  --with-em8300=/usr --with-sdl || return 1
}
package(){  
  cd "$srcdir/$_cvsmod-build"
  make || return 1
  make DESTDIR=$pkgdir install
  mkdir -p $pkgdir/usr/share/dxr3player/info
  cp misc/info/*.* $pkgdir/usr/share/dxr3player/info/
}


