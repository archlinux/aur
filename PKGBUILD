# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Nathan Owe. <ndowens04+AUR@gmail.com>
pkgname=blackbox-cvs
pkgver=0.70.2
pkgrel=1
pkgdesc="Blackbox CVS"
arch=(i686 x86_64)
url="http://blackboxwm.sourceforge.net"
license=('custom')
provides=('blackbox')
conflicts=('blackbox')
depends=('gcc-libs' 'libxext' 'bash' 'libxft')
options=('!libtool')
makedepends=('cvs')
source=(bbdock.patch
	bsetbg-feh.patch
	textpropertytostring-unconditional.patch
	ewmh.patch)
md5sums=('69c5a5e981b087b2d8267cab996b48dd'
         'e7fb0d5bfd95820c0194ec73df66dadc'
         '3b92ad246f07126dd55ae9634d6e875e'
         'ecb8940c7e4a27cad6ba82d51e183461')

_cvsroot=":pserver:anonymous@blackboxwm.cvs.sourceforge.net:/cvsroot/blackboxwm"
_cvsmod="blackbox"

build() {
  cd "$srcdir"
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co -f $_cvsmod
    cd $_cvsmod
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_cvsmod-build"
  cp -r "$srcdir/$_cvsmod" "$srcdir/$_cvsmod-build"
  cd "$srcdir/$_cvsmod-build"

  patch -Np0 -i ../bbdock.patch
  patch -Np0 -i ../bsetbg-feh.patch
  patch -Np1 -i ../textpropertytostring-unconditional.patch
  patch -Np0 -i ../ewmh.patch

  autoreconf -fi
  ./configure --prefix=/usr --mandir=/usr/share/man
  make || return 1
}
package() {
  cd "$srcdir/$_cvsmod-build"
  make DESTDIR="$pkgdir/" install || return 1
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
