# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Jan de Groot  <jgc@archlinux.org>
pkgname=libwnck+-git
pkgver=2.31.0.r34.gb1bee94
pkgrel=1
pkgdesc="Window Navigator Construction Kit"
arch=('i686' 'x86_64')
license=('LGPL')
provides=('libwnck=2.31.0' 'libwnck+=2.31.0')
conflicts=('libwnck' 'libwnck+')
depends=('gtk2' 'startup-notification' 'libxres')
makedepends=('git' 'libxt' 'intltool' 'gobject-introspection' 'gnome-common')
url="https://github.com/bbidulock/libwnck"
source=("$pkgname::git+https://github.com/bbidulock/libwnck.git#branch=libwnck+")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's,LIBWNCK_,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}

build() {
  cd $pkgname
  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
	--localstatedir=/var --disable-static \
	--enable-tools --enable-gtk-doc
  # Fight unused direct deps
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  # libwnck3 installs these with the normal names linked against wrong library
  mv "${pkgdir}"/usr/bin/wnckprop "${pkgdir}"/usr/bin/wnckprop2
  mv "${pkgdir}"/usr/bin/wnck-urgency-monitor "${pkgdir}"/usr/bin/wnck-urgency-monitor2
}
