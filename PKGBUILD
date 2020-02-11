# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xde-ctools-git
pkgver=1.12.r2.gb051028
pkgrel=1
pkgdesc="X Desktop Environment C-language tools"
groups=('xde-git')
arch=('i686' 'x86_64')
url="https://github.com/bbidulock/xde-ctools"
license=('GPL')
provides=('xde-ctools')
conflicts=('xde-ctools')
depends=('libxss' 'libsm' 'libwnck+-git' 'libcanberra' 'libnotify')
makedepends=('dbus-glib' 'libunique' 'git' 'xorgproto')
optdepends=('xdg-launch-git: launch with recent update and launch notification')
source=("$pkgname::git+https://github.com/bbidulock/xde-ctools.git")
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
