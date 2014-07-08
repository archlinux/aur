# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=vtwm-git
pkgver=5.5.0.rc8.15
pkgrel=5
pkgdesc="A lightweight, customizable window manager with a virtual desktop"
arch=('i686' 'x86_64')
url="http://www.vtwm.org"
license=('MIT')
provides=('vtwm')
conflicts=('vtwm')
depends=('libxpm' 'libxmu' 'libxft' 'libxinerama' 'libxrandr' 'esound' 'rplay')
optdepends=('m4: for config file preprocessing')
makedepends=('git')
backup=('usr/share/X11/vtwm/system.vtwmrc')
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
  (
	  head -n 26 add_window.c
	  head -n 20 applets.c
	  head -n 18 desktop.c
	  head -n 22 sound.c
	  cat contrib/nexpm/xpm.COPYRIGHT

  ) >COPYRIGHT
}

build() {
  cd $pkgname
  aclocal
  automake --foreign --add-missing
  autoconf
  ./configure --prefix=/usr --sysconfdir=/etc
  make V=0
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm0644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
  install -Dm0644 ../vtwm.desktop "$pkgdir/usr/share/xsessions/vtwm.desktop"
}
