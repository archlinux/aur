# Maintainer: Gicu Gorodenco <cyclopsihus 'at' gmail 'dot' com>
# Contributor: josephgbr
_pkgbasename=pangomm
pkgname=lib32-$_pkgbasename
pkgver=2.40.1
pkgrel=1
pkgdesc="C++ bindings for pango (32 bit, library only)"
arch=('x86_64')
url="http://gtkmm.sourceforge.net/"
license=('LGPL')
depends=('lib32-pango' 'lib32-glibmm' 'lib32-cairomm')
makedepends=('gcc-multilib')
options=('!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/${_pkgbasename}/${pkgver::4}/${_pkgbasename}-${pkgver}.tar.xz)
sha256sums=('9762ee2a2d5781be6797448d4dd2383ce14907159b30bc12bf6b08e7227be3af')

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  ./configure --prefix=/usr --libdir=/usr/lib32 CC='gcc' CFLAGS='-m32' PKG_CONFIG_PATH='/usr/lib32/pkgconfig/'
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  sed -i -e 's/^doc_subdirs/#doc_subdirs/' Makefile
  make DESTDIR="${pkgdir}" install
  # Cleanup for a lib32 package
  rm -rf ${pkgdir}/usr/include
}
