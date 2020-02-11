# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xde-menu-git
_pkgname=xde-menu
pkgver=0.12.r2.gbcd6b62
pkgrel=1
pkgdesc="XDG compliant menu generator"
arch=('i686' 'x86_64')
url="https://github.com/bbidulock/xde-menu"
groups=('xde-git')
license=('GPL')
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
depends=('libwnck+-git' 'libsm' 'gnome-menus')
makedepends=('git')
optdepends=('xdg-launch-git: for LW WM launch notification'
	    'xde-theme: for LW WM style and theme change support')
source=("$pkgname::git+https://github.com/bbidulock/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  ./autogen.sh
}

build() {
  cd $pkgname
  # gtk2 is using deprecated glib2 declarations
  ./configure CFLAGS="-Wno-deprecated-declarations $CFLAGS"
  # Fight unused direct deps
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool
  make CFLAGS="-Wno-deprecated-declarations $CFLAGS"
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim: et sw=2:
