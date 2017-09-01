# Maintainer: Peter Ivanov <ivanovp@gmail.com>
# Contributor: Hussain Jasim <hussainmkj@gmail.com>
# Contributors: Flemming Madsen (arch at themadsens dot dk), Sébastien Duquette <ekse.0x@gmail.com>
pkgname=tclx
pkgver=8.4.1
_tclsrcver=8.6.7
pkgrel=7
pkgdesc="Provides OS primitives, file scanning, data records etc. for Tcl"
url="http://tclx.sourceforge.net"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=('BSD')
depends=('tcl=8.6.7' 'tk')
source=("http://downloads.sourceforge.net/sourceforge/tclx/tclx${pkgver}.tar.bz2" \
        "http://downloads.sourceforge.net/sourceforge/tcl/tcl${_tclsrcver}-src.tar.gz" \
        "interperrorline.patch")
md5sums=('ac983708f23cf645c07058148f48440c'
         '5673aaf45b5de5d8dd80bb3daaeb8838'
         '3254188674bfa4cdf58605d0d69586d0')

#prepare() {
#  patch -d $srcdir/${pkgname}8.4/generic < interperrorline.patch
#}

build() {
  cd $srcdir/${pkgname}8.4
cp /usr/lib/tclConfig.sh $srcdir
  echo "TCL_SRC_DIR=$startdir/tcl$_tclsrcver" >> ../tclConfig.sh
  [ "$NOEXTRACT" == 1 ] || ./configure --prefix=/usr --enable-share \
                           --enable-gcc --with-tcl=$srcdir
  _tclsrc="TCL_SRC_DIR=$srcdir/tcl$_tclsrcver \
           TCL_TOP_DIR_NATIVE=$srcdir/tcl$_tclsrcver"
  make $_tclsrc || return 1
}

package() {
cd $srcdir/${pkgname}8.4
  make $_tclsrc DESTDIR="$pkgdir" mandir="/usr/share/man" install
install -D -m644 license.terms "$pkgdir/usr/share/licenses/$pkgname/license.terms"
}
