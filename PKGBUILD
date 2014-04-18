# Maintainer: Markus Heidelberg <markus dot heidelberg at web dot de>
# Contributor: Gyo <nucleogeek_at_gmail_dot_com>
pkgname=koules
pkgver=1.4
pkgrel=4
pkgdesc="A fast arcade game based on fundamental law of bodies attraction"
arch=('i686' 'x86_64')
url="http://www.ucw.cz/~hubicka/koules/English/"
license=('GPL')
depends=('dialog' 'libx11' 'libxext')
makedepends=('imake' 'xextproto' 'xproto')
source=(http://www.ucw.cz/~hubicka/koules/packages/$pkgname$pkgver-src.tar.gz
        $pkgname-$pkgver-gcc3.patch
        koules.desktop)
md5sums=('0a5ac9e57c8b72e9fc200bc98273235c'
         'ccc92d4ab7d61ca482d30192a5ee83ec'
         'fb3cd393464214643c239ac4350f963a')

prepare() {
  cd "$srcdir/$pkgname$pkgver"
  patch -p1 < "$srcdir/$pkgname-$pkgver-gcc3.patch"
}

build() {
  cd "$srcdir/$pkgname$pkgver"

  # some source modifications
  sed -i \
    -e "/^KOULESDIR/s:=.*:=/usr/bin:" \
    -e "/^SOUNDDIR/s:=.*:=/usr/share/$pkgname:" \
    -e "/SYSDEFS/s:=.*:= ${CFLAGS}:" Iconfig
  sed -i \
    -e "s:/usr/local/bin:/usr/bin:" \
    -e 's:exec.*tcl:exec xkoules -M "$@":' koules

  # generate makefiles, then build
  xmkmf -a
  make MANSRCSUFFIX=6
}

package() {
  cd "$srcdir/$pkgname$pkgver"
  install -Dm755 xkoules "$pkgdir/usr/bin/xkoules"
  install -Dm755 koules "$pkgdir/usr/bin/koules"
  install -Dm755 koules.sndsrv.linux "$pkgdir/usr/share/koules/koules.sndsrv.linux"
  install -m644 sounds/* "$pkgdir/usr/share/koules"
  install -Dm644 xkoules.6 "$pkgdir/usr/share/man/man6/xkoules.6"
  install -Dm644 Koules.xpm "$pkgdir/usr/share/pixmaps/koules.xpm"
  install -Dm644 "$srcdir/koules.desktop" "$pkgdir/usr/share/applications/koules.desktop"
}
