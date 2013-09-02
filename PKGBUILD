# Contributor: Daniel Isenmann <daniel@archlinux.org>

pkgname=windowmaker-crm-git
pkgver=20130902
pkgrel=1
pkgdesc="An X11 window manager with a NEXTSTEP look and feel"
arch=(i686 x86_64)
url="http://www.windowmaker.org"
license=('GPL' 'custom')
depends=('libxinerama' 'libxrandr' 'libpng' 'libxpm' 'libxft' 'libtiff>=3.9.1' 'giflib' 'libxmu')
makedepends=('git')
options=('!libtool')
provides=('windowmaker')
conflicts=('windowmaker' 'windowmaker-git')
source=("git://repo.or.cz/wmaker-crm.git"
	wmaker.desktop
	wm-giflib.patch)
md5sums=('SKIP'
         '2fba97bebfd691836b92b8f0db79ff13'
         '05d8e98fb579f2fa5a097b629374e6b8')

_gitname="wmaker-crm"

pkgver() {
  date -uI | sed s',-,,g'
}

build() {
  cd "$srcdir/$_gitname"
  patch -Np0 -b -z .orig -i "$srcdir/wm-giflib.patch"
  [ -z "$LINGUAS" ] && export LINGUAS="`ls po/*.po | sed 's:po/\(.*\)\.po$:\1:'`"
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --enable-xinerama \
    --with-nlsdir=/usr/share/locale --with-gnustepdir=/usr/lib/GNUstep \
    --enable-usermenu --enable-modelock --enable-xrandr
  make
}

package() {
  cd "$srcdir/$_gitname"

  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING.WTFPL "$pkgdir/usr/share/licenses/$pkgname/COPYING.WTFPL"
  install -D -m644 "$srcdir/wmaker.desktop" "$pkgdir/usr/share/xsessions/wmaker.desktop"
}
