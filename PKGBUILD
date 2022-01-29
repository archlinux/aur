# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xde-ctools
pkgver=1.15
pkgrel=1
pkgdesc="X Desktop Environment C-language tools"
groups=('xde')
arch=('i686' 'x86_64')
url="https://github.com/bbidulock/$pkgname"
license=('GPL')
depends=('libxss' 'libwnck+' 'libcanberra')
makedepends=('dbus-glib' 'libunique' 'xorgproto' 'libnotify' 'gdk-pixbuf-xlib')
optdepends=('xdg-launch: launch with recent update and launch notification')
source=("https://github.com/bbidulock/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.lz")
sha256sums=('103484ed27ab8924f4d525bc8b453e6976c3fec324863aff5f413fcb730f6291')

build() {
  cd $pkgname-$pkgver
  # gtk2 is using deprecated glib2 declarations
  ./configure --sysconfdir=/etc CFLAGS="-Wno-deprecated-declarations $CFLAGS"
  # Fight unused direct deps
  sed -i -e "s| -shared | $LDFLAGS\0 |g" -e "s|    if test \"\$export_dynamic\" = yes && test -n \"\$export_dynamic_flag_spec\"; then|      func_append compile_command \" $LDFLAGS\"\n      func_append finalize_command \" $LDFLAGS\"\n\0|" libtool
  make CFLAGS="-Wno-deprecated-declarations $CFLAGS"
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir" install
}
