# $Id: PKGBUILD 144547 2015-10-21 05:26:35Z fyan $
# Maintainer:  Ionut Biru <ibiru@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Mikko Seppälä <t-r-a-y@mbnet.fi>
# x32 Maintainer: Fantix King <fantix.king at gmail.com>

_pkgbasename=glib2
pkgname=libx32-$_pkgbasename
pkgver=2.46.1
pkgrel=1.1
pkgdesc="Common C routines used by GTK+ 2.4 and other libs (x32 ABI)"
url="http://www.gtk.org/"
arch=('x86_64')
license=('LGPL')
depends=('libx32-dbus' 'libx32-libffi' 'libx32-pcre' 'libx32-zlib' "$_pkgbasename")
makedepends=('gcc-multilib-x32' 'python2')
options=('!docs')
source=("http://ftp.gnome.org/pub/GNOME/sources/glib/${pkgver%.*}/glib-${pkgver}.tar.xz"
        'revert-warn-glib-compile-schemas.patch')
sha256sums=('5a1f03b952ebc3a7e9f612b8724f70898183e31503db329b4f15d07163c8fdfb'
            '049240975cd2f1c88fbe7deb28af14d4ec7d2640495f7ca8980d873bb710cc97')

prepare() {
  cd "${srcdir}/glib-${pkgver}"
  patch -Rp1 -i ../revert-warn-glib-compile-schemas.patch
}

build() {
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  ## Prevent runtime unloading of glib
  # https://bugs.archlinux.org/task/46619
  # https://bugzilla.gnome.org/show_bug.cgi?id=755609
  LDFLAGS+=" -Wl,-z,nodelete"

  cd "${srcdir}/glib-${pkgver}"
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr --sysconfdir=/etc \
      --libdir=/usr/libx32 --with-pcre=system --disable-fam
  make
}

package() {
  cd "${srcdir}/glib-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/{etc,usr/{share,include}}

  cd "${pkgdir}"/usr/bin
  mv gio-querymodules gio-querymodules-x32
  rm -f gdbus glib* gobject-query gsettings gtester*
  rm -rf "$pkgdir"/usr/libx32/gdbus-2.0
  find "$pkgdir/usr/bin" -type f -not -name gio-querymodules-x32 -delete
}
