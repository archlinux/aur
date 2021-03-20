# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>
# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=mailtc
pkgver=1.4.2
pkgrel=1
pkgdesc="Lightweight GTK2 mail checker for the system tray/notification area of panels."
arch=('i686' 'x86_64')
url="http://mailtc.sourceforge.net"
license=('GPL')
depends=('gtk2' 'libunique')
options=('!emptydirs' '!libtool')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2
       gdk_display.patch)
sha256sums=('f778456b658b2941c0a73baafaec62cf8b35a7fdd2602e03d213286b53964c37'
            '43ec209624b6368fe4fc0b5d9c1f0a51d699593a42b98a6277b101371536dc9e')

build() {
  export LDFLAGS="-lgmodule-2.0 $LDFLAGS"

  cd "${srcdir}/${pkgname}-${pkgver}"

#  patch -p1 -i $srcdir/gdk_display.patch

  ./configure --prefix=/usr
  # Fight unused direct deps
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
