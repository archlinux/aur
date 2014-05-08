# Contributor: David Scholl <djscholl@gmail.com>
pkgname=vtwm
pkgver=5.4.7
pkgrel=5
pkgdesc="A lightweght, customizable window manager with a virtual desktop"
arch=('i686' 'x86_64')
url="http://www.vtwm.org"
license=('custom')
depends=('libxpm' 'libxmu' 'm4')
makedepends=('imake' 'bison' 'flex')
backup=('etc/X11/vtwm/system.vtwmrc')
options=('!makeflags')
source=(http://www.vtwm.org/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('707f8d93b19b46fb3d036053be66288b')

build() {
  cd $startdir/src/$pkgname-$pkgver
  sed -i '/^XCOMM NO_SOUND_SUPPORT/s/^XCOMM//' Imakefile || return 1
  sed -i '/^SOUNDLIB/s//XCOMM SOUNDLIB/' Imakefile || return 1
  sed -i '/^SOUNDINC/s//XCOMM SOUNDINC/' Imakefile || return 1
  sed -i '/VTWMLIBDIR/s/$(LIBDIR)\/twm/\/etc\/X11\/vtwm/' Imakefile || return 1
  xmkmf || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
  mkdir -p $startdir/pkg/usr/share/licenses/$pkgname
  head -n 26 add_window.c > $startdir/pkg/usr/share/licenses/$pkgname/EH_MIT
  head -n 20 applets.c > $startdir/pkg/usr/share/licenses/$pkgname/MIT
  head -n 18 desktop.c > $startdir/pkg/usr/share/licenses/$pkgname/DE_ICSTM
  head -n 24 gram.c > $startdir/pkg/usr/share/licenses/$pkgname/Bison_GPL
  head -n 22 sound.c > $startdir/pkg/usr/share/licenses/$pkgname/DJHJ
  cp contrib/nexpm/xpm.COPYRIGHT $startdir/pkg/usr/share/licenses/$pkgname/
  chmod 644 $startdir/pkg/usr/share/licenses/$pkgname/* 
}
