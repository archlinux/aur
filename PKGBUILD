# Maintainer: Markus Heidelberg <markus dot heidelberg at web dot de>
# Contributor: Gyo <nucleogeek_at_gmail_dot_com>
pkgname=koules
pkgver=1.4
pkgrel=3
pkgdesc="A fast arcade game based on fundamental law of bodies attraction"
arch=('i686' 'x86_64')
url="http://www.ucw.cz/~hubicka/koules/English/"
license=('GPL')
depends=('dialog' 'libx11' 'libxext')
makedepends=('imake' 'xextproto' 'xproto')
source=(http://www.ucw.cz/~hubicka/koules/packages/$pkgname$pkgver-src.tar.gz
        $pkgname-$pkgver-gcc3.patch)
md5sums=('0a5ac9e57c8b72e9fc200bc98273235c'
         'ccc92d4ab7d61ca482d30192a5ee83ec')

prepare() {
  cd "$srcdir/$pkgname$pkgver"
  patch -p1 < "$srcdir/$pkgname-$pkgver-gcc3.patch"
}

build() {
  cd "$srcdir/$pkgname$pkgver"

  # some sources modifications
  sed -i \
    -e "/^KOULESDIR/s:=.*:=/usr/bin:" \
    -e "/^SOUNDDIR/s:=.*:=/usr/share/$pkgname:" Iconfig
  sed -i \
    -e "s:/usr/local/bin:/usr/bin:" koules
  sed -i \
    -e 's:exec.*tcl:exec xkoules -M "$@":' koules

  ln -s xkoules.6 xkoules.man
  ln -s xkoules.6 xkoules._man

  # generate makefiles and building
  xmkmf -a
  sed -i \
    -e '/SYSDEFS =/d' \
    -e "/^ *CFLAGS =/s:$: ${CFLAGS}:" Makefile
  make
}

package() {
  cd "$srcdir/$pkgname$pkgver"
  install -Dm755 xkoules "$pkgdir/usr/bin/xkoules"
  install -Dm755 koules "$pkgdir/usr/bin/koules"
  install -Dm755 koules.sndsrv.linux "$pkgdir/usr/share/koules/koules.sndsrv.linux"
  install -m644 sounds/* "$pkgdir/usr/share/koules"
  install -Dm644 xkoules.6 "$pkgdir/usr/share/man/man6/xkoules.6"
}
