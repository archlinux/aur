# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=blackbox-git
pkgver=0.70.2.20
pkgrel=1
pkgdesc="A window manager for X11"
arch=('i686' 'x86_64')
url="http://blackboxwm.sourceforge.net/"
license=('MIT')
provides=('blackbox')
conflicts=('blackbox' 'blackbox-cvs')
depends=('gcc-libs' 'libxft' 'libxext')
options=('!libtool' 'staticlibs')
makedepends=('git')
source=("$pkgname::git+https://github.com/bbidulock/blackboxwm.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --always | sed 's|-|.|g;s|[.]g[a-f0-9]*$||'
}

prepare() {
  cd $pkgname
  sed "s|^AC_INIT(.*$|AC_INIT([blackbox], [$pkgver], [http://github.com/bbidulock/blackboxwm])|" \
    -i configure.ac
}

build() {
  cd $pkgname
  autoreconf -fiv
  ./configure --prefix=/usr --mandir=/usr/share/man
  make V=0
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim: et sw=2:
