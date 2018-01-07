# $Id: PKGBUILD 310007 2017-11-15 14:11:34Z foutrelis $
# Maintainer: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=windowmaker
pkgver=0.95.8
pkgrel=2
pkgdesc="An X11 window manager with a NEXTSTEP look and feel"
arch=('x86_64')
url="http://www.windowmaker.org/"
license=('GPL' 'custom')
depends=('libxinerama' 'libxrandr' 'libxmu' 'libpng' 'libxpm' 'libxft' 'libtiff' 'giflib')
source=(http://windowmaker.org/pub/source/release/WindowMaker-$pkgver.tar.gz
        wmaker.desktop)
sha256sums=('9dbf5c5571bb79c4b1584f496c960ee2cd7379af45ef0f58b4b0f487259de88a'
            '126da08ac9cffc4354bb4f246ec5ed5abd3cd29ed665d05d190c5bf842c84bef')

prepare() {
  cd WindowMaker-$pkgver
  
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
  cd WindowMaker-$pkgver
  export LINGUAS="be bg bs ca cs da de el es et fi fr fy gl hr hu hy it ja ko ms nl no pl pt ro ru sk sv tr uk zh_CN zh_TW"
  #export LINGUAS="`ls po/*.po | sed 's:po/\(.*\)\.po$:\1:'`"
  
  ./configure --prefix=/usr --sysconfdir=/etc --enable-xinerama \
    --localedir=/usr/share/locale --with-gnustepdir=/usr/lib/GNUstep \
    --enable-usermenu --enable-modelock --enable-randr
  make
}

package() {
  cd WindowMaker-$pkgver
  
  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING.WTFPL "$pkgdir/usr/share/licenses/$pkgname/COPYING.WTFPL"
  install -D -m644 ../wmaker.desktop "$pkgdir/usr/share/xsessions/wmaker.desktop"
}

