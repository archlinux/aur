# Maintainer: envolution
# Contributor: Brian Bidulock <bidulock@openss7.org>
#
pkgname=libunique
pkgver=1.1.6
pkgrel=11
pkgdesc="Library for writing single instance applications"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('gtk2')
makedepends=('gtk-doc' 'glib2' 'glib2-devel' 'gobject-introspection')
url="https://wiki.gnome.org/Attic/LibUnique"
source=(
        "https://download.gnome.org/sources/${pkgname}/1.1/${pkgname}-${pkgver}.tar.bz2"
        00git_g_const_return.patch
        01_format-security.patch
        99_ltmain_as-needed.patch
)        
sha256sums=('e5c8041cef8e33c55732f06a292381cb345db946cf792a4ae18aa5c66cdd4fbb'
            'b70b603c4a40d07d40caf23de63f88bb8c7cc90b88c62c84dcc45d1db4b0b921'
            'eda843d01ef27c56eb6d0753a70d658412e0acb8324b0e8c59a60594387c912d'
            '01829263fae69782d7558c6e50a4b1c9885b9309c5198844eafa9005fc470631')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i "${srcdir}/00git_g_const_return.patch"
  patch -Np1 -i "${srcdir}/01_format-security.patch"
  patch -Np1 -i "${srcdir}/99_ltmain_as-needed.patch"
}

build() {
  cd $pkgname-$pkgver
  autoreconf -fi
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --disable-dbus \
      --disable-maintainer-flags
  # Fight unused direct deps
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n\0/' libtool
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" install

  # Remove documentation, provided by libunique
  rm -r "$pkgdir/usr/share/gtk-doc"
}
