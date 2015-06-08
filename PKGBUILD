# Maintainer: q9 <qqqqqqqqq9 at web dot de>
pkgname=scid-git
_pkgname=scid
pkgver=4.5.2.r99.g317dfab
pkgrel=2
pkgdesc="A Free Chess Database Application - git-Checkout "
arch=('x86_64' 'i686')
url="http://scid.sourceforge.net"
license=('GPL')
depends=('tk' 'python')
optdepends=('snack: for sound support')
options=('!emptydirs')
source=("$pkgname"::'git://git.code.sf.net/p/scid/code')
md5sums=('SKIP')
pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//g'
}
# _languages="tcl/lang/catalan.tcl tcl/lang/checklangs.tcl tcl/lang/czech.tcl tcl/lang/deutsch.tcl tcl/lang/english.tcl tcl/lang/francais.tcl tcl/lang/greek.tcl tcl/lang/hungary.tcl tcl/lang/italian.tcl tcl/lang/nederlan.tcl tcl/lang/norsk.tcl tcl/lang/polish.tcl tcl/lang/portbr.tcl tcl/lang/propagatelang.tcl tcl/lang/removetoken.tcl tcl/lang/rename.sh tcl/lang/russian.tcl tcl/lang/serbian.tcl tcl/lang/spanish.tcl tcl/lang/suomi.tcl tcl/lang/swedish.tcl"
# _languages="tcl/lang/deutsch.tcl" does not work, i don't know why

prepare() {
  cp -r $srcdir/$pkgname  $srcdir/$pkgname-build
}

build() {
  cd $srcdir/$pkgname-build 
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//g'
  ./configure BINDIR=${pkgdir}/usr/bin SHAREDIR=${pkgdir}/usr/share/${_pkgname}
  # ./configure LANGUAGES="$_languages" BINDIR=${pkgdir}/usr/bin SHAREDIR=${pkgdir}/usr/share/${_pkgname}
  make
}

package () {
  cd ${srcdir}/$pkgname-build
  make install
  msg "Creating Desktop file"
  install -Dm644 ${srcdir}/$pkgname-build/svg/scid.ico ${pkgdir}/usr/share/scid/scid.ico
  echo "
[Desktop Entry]
Version=4.5-git-$pkgver
Name=${_pkgname}
Comment=${pkgdesc}
Exec=${_pkgname}
Icon=/usr/share/${_pkgname}/${_pkgname}.ico
Categories=Game;BoardGame;
Type=Application
Terminal=false
StartupNotify=false
" > $srcdir/$_pkgname.desktop

  install -Dm644 $srcdir/$_pkgname.desktop $pkgdir/usr/share/applications/$_pkgname.desktop

  msg "Fix some permission issues"
  find $pkgdir/usr/share/scid/books -type f -exec chmod 644 {} \;

  msg "Copying sound files"
  install -d $pkgdir/usr/share/sounds
  install -Dm644 ${srcdir}/$pkgname-build/sounds/*.wav $pkgdir/usr/share/sounds
  sed -e "s@${pkgdir}@@g" ${pkgdir}/usr/bin/scid -i
}
