# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xde-ctools
pkgver=1.14
pkgrel=1
pkgdesc="X Desktop Environment C-language tools"
groups=('xde')
arch=('i686' 'x86_64')
url="https://github.com/bbidulock/xde-ctools"
license=('GPL')
depends=('libxss' 'libsm' 'libwnck+' 'libcanberra' 'libnotify' 'gdk-pixbuf-xlib')
makedepends=('dbus-glib' 'libunique')
optdepends=('xdg-launch: launch with recent update and launch notification')
source=("https://github.com/bbidulock/xde-ctools/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.lz")
sha256sums=('80d4378a7d5724127323d7795b74cde5634c22cacbc04807bda4c2f28f308117')

build() {
  cd $pkgname-$pkgver
  # gtk2 is using deprecated glib2 declarations
  ./configure --sysconfdir=/etc CFLAGS="-Wno-deprecated-declarations $CFLAGS"
  # Fight unused direct deps
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool
  make CFLAGS="-Wno-deprecated-declarations $CFLAGS"
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
