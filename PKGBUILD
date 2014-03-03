# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Daniel Isenmann <daniel@archlinux.org>

pkgname=windowmaker-crm-git
pkgver=0.95.5.263
pkgrel=1
pkgdesc="An X11 window manager with a NEXTSTEP look and feel"
arch=(i686 x86_64)
url="http://www.windowmaker.org"
license=('GPL' 'custom')
depends=('libxinerama' 'libxrandr' 'libbsd' 'libxpm' 'libxft' 'libtiff>=3.9.1' 'giflib' 'libxmu')
makedepends=('git')
options=('!libtool')
provides=('windowmaker')
conflicts=('windowmaker' 'windowmaker-git')
source=("git://repo.or.cz/wmaker-crm.git#branch=next"
	"wmaker.desktop")
md5sums=('SKIP'
         '2fba97bebfd691836b92b8f0db79ff13')

_gitname="wmaker-crm"

pkgver() {
  cd $_gitname
  git describe --always | sed 's|wmaker.||;s|-|.|g;s|[.]g[a-f0-9]*$||'
}

prepare() {
  cd $_gitname
  sed -e 's/^RLoadWEBP.*/RLoadWEBP(const char *file_name, int index)/' \
	-i wrlib/load_webp.c
}

build() {
  cd "$srcdir/$_gitname"
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
