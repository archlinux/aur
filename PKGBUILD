# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xde-menu
pkgver=0.14
pkgrel=1
pkgdesc="XDG compliant menu generator"
arch=('i686' 'x86_64')
url="https://github.com/bbidulock/xde-menu"
groups=('xde')
license=('GPL')
depends=('libwnck' 'libsm' 'gnome-menus')
makedepends=('gdk-pixbuf-xlib')
optdepends=('libwnck+: for enhanced functionality'
	    'xdg-launch: for LW WM launch notification'
	    'xde-theme: for LW WM style and theme change support')
source=("https://github.com/bbidulock/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.lz")
sha256sums=('8a37e95c5c21f903d0a818dad6e9e2477610c28bb94d53278043a4f97c6096c5')

build() {
  cd $pkgname-$pkgver
  # gtk2 is using deprecated glib2 declarations
  ./configure CFLAGS="-Wno-deprecated-declarations $CFLAGS"
  # Fight unused direct deps
  sed -i -e "s| -shared | $LDFLAGS\0 |g" -e "s|    if test \"\$export_dynamic\" = yes && test -n \"\$export_dynamic_flag_spec\"; then|      func_append compile_command \" $LDFLAGS\"\n      func_append finalize_command \" $LDFLAGS\"\n\0|" libtool
  make CFLAGS="-Wno-deprecated-declarations $CFLAGS"
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir" install
}

# vim: et sw=2:
