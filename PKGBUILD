# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=gpsshogi-svn
pkgver=r2925
pkgrel=2
pkgdesc="Shogi (Japanese chess) playing program based on OpenShogiLib"
arch=('i686' 'x86_64')
url='http://gps.tanaka.ecc.u-tokyo.ac.jp/gpsshogi/index.php?GPSShogiEn'
license=('custom')
groups=('lib')
depends=('libosl-svn' 'gsl' 'poco' 'qt4' 'boost-libs')
makedepends=('chrpath' 'boost' 'qtchooser')
install='gpsshogi.install'
source=("gpsshogi.tar.gz::http://gps.tanaka.ecc.u-tokyo.ac.jp/cgi-bin/viewvc.cgi/trunk/gpsshogi/?root=gpsshogi&view=tar"
'makefile.conf.patch'
'gpsshogi.profile'
'Makefile.patch'
)
md5sums=('SKIP'
         '539c37dcf4feb57b24ce2c155856f4e8'
         '3bafa7d5464e856bca8b3e801e3a8617'
         '3963a545156ea613d5371d0f38b1ca1b')

pkgver() {
 curl -s "http://gps.tanaka.ecc.u-tokyo.ac.jp/cgi-bin/viewvc.cgi/trunk/gpsshogi/?root=gpsshogi" |\
  sed -n -e 's/^.*Revision \([0-9]*\).*$/r\1/p'
}

prepare() {
  cd "$srcdir"/${pkgname%-svn}
  patch --verbose -i $srcdir/makefile.conf.patch
  patch --verbose -i $srcdir/Makefile.patch
  sed -i -e "s/%%revision/$pkgver/" $srcdir/gpsshogi/Makefile
}

build() {
  cd "$srcdir"/gpsshogi/
  QT_SELECT=4 make viewer-release
  cd ./release
  make
  cd ../sample/gpsshell
  make
}

package() {
  install -Dm644 $srcdir/gpsshogi/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 $srcdir/gpsshogi.profile ${pkgdir}/etc/profile.d/gpsshogi.sh
  install -Dm644 $srcdir/gpsshogi/makefile.conf $pkgdir/usr/share/gpsshogi/makefile.conf
  mkdir -m755 -p $pkgdir/usr/{bin,include}
  cp -r $srcdir/gpsshogi/data "$pkgdir"/usr/share/gpsshogi/
  rm -f $srcdir/gpsshogi/include/gpsshogi/revision.h.new
  cp -r $srcdir/gpsshogi/include/gpsshogi "$pkgdir"/usr/include/
  install -m755 $srcdir/gpsshogi/release/{alphabetastat,gps{usi,shogi}} "$pkgdir"/usr/bin/
  chrpath --delete $srcdir/gpsshogi/sample/viewer/viewer
  install -m755 $srcdir/gpsshogi/sample/viewer/viewer "$pkgdir"/usr/bin/gpsshogi-viewer
  install -m755 $srcdir/gpsshogi/sample/gpsshell/gpsshell "$pkgdir"/usr/bin/
}
