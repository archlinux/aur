# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Corey Mwamba <contact.me@coreymwamba.co.uk>
pkgname=jwm-git
pkgver=s1685.r6.d5ca153
pkgrel=1
pkgdesc="JWM is a light-weight window manager for the X11 Window System. Git version."
arch=('i686' 'x86_64')
url="http://joewing.net/projects/jwm/"
license=('MIT')
groups=('x11')
provides=('jwm')
conflicts=('jwm' 'jwm-snapshot' 'jwm-flashfixed' 'jwm-snapshot-lite')
depends=('libx11' 'libxft' 'libjpeg>=7' 'libxpm' 'libxinerama' 'libpng' 'cairo' 'librsvg' 'fribidi')
backup=('etc/system.jwmrc')
makedepends=('git')
source=("$pkgname::git+https://github.com/joewing/jwm.git"
        jwm.desktop)
md5sums=('SKIP'
         'ad898472f7538ffc3ff511c055fee535')

pkgver() {
  cd $pkgname
  # Use the tag of the last commit
  git describe --always | sed -r 's|-([^-]*)-g(.*)|.r\1.\2|'
}

prepare() {
  cd $pkgname
  /usr/bin/cp -f /usr/share/automake-1.16/config.guess .
  /usr/bin/cp -f /usr/share/automake-1.16/config.sub .
  /usr/bin/cp -f /usr/share/automake-1.16/install-sh .
  /usr/bin/cp -f /usr/share/gettext/config.rpath .
  /usr/bin/cp -f /usr/share/gettext/po/Makefile.in.in po/
  autoreconf
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --sysconfdir=/etc 
  # --disable-icons         disable icon support
  #--disable-png           disable PNG images
  #--disable-cairo         disable Cairo support
  #--disable-rsvg          disable rsvg support
  #--disable-jpeg          disable JPEG images
  #--disable-xft           disable Xft
  #--disable-xrender       disable XRender
  #--disable-fribidi       disable bi-directional unicode support
  #--disable-xpm           disable XPM images
  #--disable-shape         disable use of the X shape extension
  #--disable-xmu           disable Xmu support
  #--disable-xinerama      disable Xinerama support
  #--disable-nls           do not use Native Language Support
  make V=0
}

package() {
  cd $pkgname
  make BINDIR="$pkgdir/usr/bin" MANDIR="$pkgdir/usr/share/man" \
       DESTDIR="$pkgdir" SYSCONF="$pkgdir/etc" \
       mkdir_p="/usr/bin/mkdir -p" install
  install -Dm644 "$srcdir/jwm.desktop" "$pkgdir/usr/share/xsessions/jwm.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
