# Maintainer: tobias <tobias@archlinux.org>

pkgname=gtk-sharp-2
pkgver=2.12.29
pkgrel=1
pkgdesc="gtk2 bindings for C#"
arch=(i686 x86_64)
license=('LGPL')
url="http://gtk-sharp.sourceforge.net"
depends=('mono' 'libglade' 'gtk2')
makedepends=('pkgconfig' 'monodoc')
conflicts=('gtk#')
options=('!makeflags')
source=(gtk-sharp-${pkgver}.tar.gz::https://github.com/mono/gtk-sharp/archive/${pkgver}.tar.gz)
md5sums=('0c682fbebe57ebcb5ab81c376ac657b9')

build() {
  cd gtk-sharp-${pkgver}
  ./bootstrap-2.12 --prefix=/usr --sysconfdir=/etc --disable-static

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool

  make
}

package() {
  cd gtk-sharp-${pkgver}
  make DESTDIR="${pkgdir}" install
}
