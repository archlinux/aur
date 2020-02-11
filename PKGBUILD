# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xde-theme-git
_pkgname=xde-theme
pkgver=1.4.r2.gda577af
pkgrel=1
pkgdesc="Theme and style setting utilities for the X Desktop Environment (XDE)"
arch=('i686' 'x86_64')
url="http://github.com/bbidulock/xde-theme"
groups=('xde-git')
license=('GPL3')
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
depends=('libxinerama' 'gdk-pixbuf2' 'libxrandr' 'libsm' 'imlib2')
makedepends=('git')
optdepends=('xde-styles: for styles that work with xde-style')
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
 ./configure
  # Fight unused direct deps
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool
 make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim: et sw=2:
