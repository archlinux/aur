# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=vtwm-git
pkgver=5.5.0.rc8.15
pkgrel=3
pkgdesc="A lightweight, customizable window manager with a virtual desktop"
arch=('i686' 'x86_64')
url="http://www.vtwm.org"
license=('custom')
provides=('vtwm')
conflicts=('vtwm')
depends=('libxpm' 'libxmu' 'libxft' 'libxinerama' 'libxrandr' 'esound' 'rplay')
optdepends=('m4: for config file preprocessing')
makedepends=('git')
backup=('etc/X11/vtwm/system.vtwmrc')
options=('!makeflags')
source=("$pkgname::git://git.code.sf.net/p/vtwm/code"
	"vtwm.desktop")
md5sums=('SKIP'
         '7b4fcabdd4cf2b3a03683c37cb0fa82b')

pkgver() {
  cd $pkgname
  git describe --tags --always | sed 's,^[^0-9]*,,;s,-,.,g;s,\.g[a-f0-9]*$,,'
}

prepare() {
  cd $pkgname
  sed -e "/^AC_INIT/s|^.*$|AC_INIT([vtwm],[$pkgver], [mailto:vtwm-hackers@lists.sandelman.ca],[vtwm])|" \
    -i configure.ac
}

build() {
  cd $pkgname
  aclocal
  automake --foreign --add-missing
  autoconf
  ./configure --prefix=/usr --sysconfdir=/etc
  make V=0 rcdir=/etc/X11/vtwm
  head -n 26 add_window.c > EH_MIT
  head -n 20 applets.c > MIT
  head -n 18 desktop.c > DE_ICSTM
  head -n 24 gram.c > Bison_GPL
  head -n 22 sound.c > DJHJ
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" rcdir=/etc/X11/vtwm install
  install -Dm0644 EH_MIT    "$pkgdir/usr/share/licenses/$pkgname/EH_MIT"
  install -Dm0644 MIT	    "$pkgdir/usr/share/licenses/$pkgname/MIT"
  install -Dm0644 DE_ICSTM  "$pkgdir/usr/share/licenses/$pkgname/DE_ICSTM"
  install -Dm0644 Bison_GPL "$pkgdir/usr/share/licenses/$pkgname/Bison_GPL"
  install -Dm0644 DJHJ	    "$pkgdir/usr/share/licenses/$pkgname/DJHJ"
  install -Dm0644 contrib/nexpm/xpm.COPYRIGHT    "$pkgdir/usr/share/licenses/$pkgname/xpm.COPYRIGHT"
  install -Dm0644 ../vtwm.desktop "$pkgdir/usr/share/xsessions/vtwm.desktop"
}
