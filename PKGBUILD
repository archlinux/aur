# Contributor: Gyo <nucleogeek_at_gmail_dot_com>
pkgname=koules
pkgver=1.4
pkgrel=2
pkgdesc="A fast arcade game based on fundamental law of bodies attraction"
arch=('i686' 'x86_64')
url="http://www.ucw.cz/~hubicka/koules/English/"
license=('GPL')
depends=('dialog' 'libx11' 'libxext')
makedepends=('patch' 'imake' 'xextproto' 'xproto')
source=(http://www.ucw.cz/~hubicka/koules/packages/${pkgname}${pkgver}-src.tar.gz $pkgname-$pkgver-gcc3.patch.bz2)
md5sums=('0a5ac9e57c8b72e9fc200bc98273235c' 'b16677698a084e11e78324098b7a9e57')

build() {
  # some sources modifications
  cd $startdir/src/${pkgname}${pkgver}
  patch -Np1 < ../$pkgname-$pkgver-gcc3.patch || return 1
  sed -i \
    -e "/^KOULESDIR/s:=.*:=/usr/bin:" \
    -e "/^SOUNDDIR/s:=.*:=/usr/share/$pkgname:" Iconfig || return 1
  sed -i \
    -e "s:/usr/local/bin:/usr/bin:" koules || return 1
  sed -i \
    -e 's:exec.*tcl:exec xkoules -M "$@":' koules || return 1

  ln -s xkoules.6 xkoules.man
  ln -s xkoules.6 xkoules._man

  # generate makefiles and building
  xmkmf -a
  sed -i \
    -e '/SYSDEFS =/d' \
    -e "/^ *CFLAGS =/s:$: ${CFLAGS}:" Makefile || return 1
  make || return 1

  # installation
  mkdir -p $startdir/pkg/usr/bin
  install -m755 xkoules $startdir/pkg/usr/bin
  install -m755 koules $startdir/pkg/usr/bin
  mkdir -p $startdir/pkg/usr/share/koules
  install -m755 koules.sndsrv.linux $startdir/pkg/usr/share/koules
  install -m644 sounds/* $startdir/pkg/usr/share/koules
  mkdir -p $startdir/pkg/usr/share/man/man6
  install -m644 xkoules.6 $startdir/pkg/usr/share/man/man6
}
