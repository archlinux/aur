# $Id: PKGBUILD 79203 2012-10-31 14:37:00Z bluewind $
# Upstream Maintainer:  Ionut Biru <ibiru@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Mikko Seppälä <t-r-a-y@mbnet.fi>
# Maintainer: Fantix King <fantix.king at gmail.com>

_pkgbasename=glib2
pkgname=libx32-$_pkgbasename
pkgver=2.34.1
pkgrel=1.1
pkgdesc="Common C routines used by GTK+ 2.4 and other libs (x32 ABI)"
url="http://www.gtk.org/"
arch=('x86_64')
license=('LGPL')
depends=('libx32-pcre' 'libx32-zlib' 'libx32-dbus-core' libx32-libffi $_pkgbasename)
makedepends=('gcc-multilib-x32' binx32-python2)
options=('!libtool' '!docs')
source=(
http://ftp.gnome.org/pub/GNOME/sources/glib/${pkgver%.*}/glib-${pkgver}.tar.xz
glib-2.0_fix_for_x32.patch
)
sha256sums=(
'6e84dc9d84b104725b34d255421ed7ac3629e49f437d37addde5ce3891c2e2f1'
'a2018bad1f010c036fd6959d514046b5d6315f07aa6a2154f5e591e89ab48ea0'
)

build() {
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  cd "${srcdir}/glib-${pkgver}"

  patch -p1 -i "${srcdir}/glib-2.0_fix_for_x32.patch"

  PYTHON=/usr/bin/python2.7-x32 ./configure --prefix=/usr --sysconfdir=/etc --libdir=/usr/libx32 \
      --enable-static --enable-shared --with-pcre=system --disable-fam
  make
}

package() {
  cd "${srcdir}/glib-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/{etc,usr/{share,include}}

  cd "${pkgdir}"/usr/bin
  mv gio-querymodules gio-querymodules-x32
  rm -f gdbus glib* gobject-query gsettings gtester*
  rm -rf "$pkgdir"/usr/{bin,libx32/gdbus-2.0}
}
