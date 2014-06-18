# $Id: PKGBUILD 215171 2014-06-14 19:17:25Z andyrtr $
# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=windowmaker-git
pkgver=0.95.5.r231.gd30b942
pkgrel=2
pkgdesc="An X11 window manager with a NEXTSTEP look and feel"
arch=('i686' 'x86_64')
url="http://www.windowmaker.org/"
license=('GPL' 'custom')
provides=('windowmaker')
conflicts=('windowmaker')
makedepends=('git')
depends=('libxinerama' 'libxrandr' 'libxmu' 'libbsd' 'libxpm' 'libxft' 'libtiff' 'giflib' 'libexif')
source=("$pkgname::git://repo.or.cz/wmaker-crm.git"
	wmaker.desktop
	giflib-5.1.0.patch)
md5sums=('SKIP'
         '2fba97bebfd691836b92b8f0db79ff13'
         '59ec642cd64a1b5222ba672a19afe489')

pkgver() {
  cd $pkgname
  git describe --long | sed -r 's/wmaker.//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  patch -Np2 -b -z .orig -i ../giflib-5.1.0.patch
  
  autoreconf -fi
  
  # fix some paths FS#3080 - ckeck also Gentoo ebuild
  for file in WindowMaker/*menu* util/wmgenmenu.c; do
 	if [[ -r $file ]] ; then
 	sed -i -e "s:/usr/local/GNUstep/Applications/WPrefs.app:/usr/lib/GNUstep/Applications/WPrefs.app:g;" "$file"
 	sed -i -e "s:/usr/local/share/WindowMaker:/usr/share/WindowMaker:g;" "$file"
 	sed -i -e "s:/opt/share/WindowMaker:/usr/share/WindowMaker:g;" "$file"
 	fi;
  done;
}

build() {
  cd $pkgname
  [ -z "$LINGUAS" ] && export LINGUAS="`ls po/*.po | sed 's:po/\(.*\)\.po$:\1:'|tr '\n' ' '`"
  ./configure --prefix=/usr --sysconfdir=/etc --enable-xinerama \
    --with-nlsdir=/usr/share/locale --with-gnustepdir=/usr/lib/GNUstep \
    --enable-usermenu --enable-modelock --enable-xrandr
  make V=0
}

package() {
  cd $pkgname

  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING.WTFPL "$pkgdir/usr/share/licenses/$pkgname/COPYING.WTFPL"
  install -D -m644 ../wmaker.desktop "$pkgdir/usr/share/xsessions/wmaker.desktop"
}

