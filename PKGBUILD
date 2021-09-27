# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Florian Knodt <adlerweb@adlerweb.info>
# Contributor: Jose Riha <jose 1711 gmail com>

pkgname=ssvnc-nojava
_pkgname=ssvnc
pkgver=1.0.29
pkgrel=10
pkgdesc="SSL/SSH VNC viewer no java"
arch=('i686' 'x86_64')
url="http://www.karlrunge.com/x11vnc/ssvnc.html"
license=('GPL')
groups=('network')
depends=('libjpeg.so>=7' 'libxaw' 'openssl' 'tk' 'tcl')
provides=(${_pkgname})
conflicts=(${_pkgname})
makedepends=('imake')
optdepends=('perl' 'xterm' 'smbclient' 'avahi' 'stunnel')
source=(http://downloads.sf.net/sourceforge/$_pkgname/$_pkgname-$pkgver.src.tar.gz
        openssl1.1.patch
        Makefile.patch)
md5sums=('52201aeb0417c2a0fe83639e52da6ae5'
         '6a119a5748a231f63c96044a2761845f'
         '7d35673003f4f25a046c48f803e76e65')

prepare() {
  cd "$_pkgname-$pkgver"
  patch -p1 < "../openssl1.1.patch"
  patch -p0 < "../Makefile.patch"
}

build() {
  cd "$_pkgname-$pkgver"
  sed -i '/wr_tool/s/\$(PREFIX)\/\$(LIB)\/\([^/]*$\)/\/usr\/lib\/ssvnc\/\1/' Makefile
  make JSRC= config
  sed -i 's/ar clq/ar cq/' vnc_unixsrc/libvncauth/Makefile
  make JSRC= all
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make JSRC= PREFIX="$pkgdir/usr" MANDIR="share/man" install
}

# vim:set ts=2 sw=2 et:
