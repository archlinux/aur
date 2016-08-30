# Maintainer: Gicu Gorodenco <cyclopsihus 'at' gmail 'dot' com>
# Contributor: josephgbr <rafael.f.f1 'at' gmail 'dot' com> 
_pkgbasename=glibmm
pkgname=lib32-$_pkgbasename
pkgver=2.48.1
pkgrel=1
pkgdesc="Glib-- (glibmm) is a C++ interface for glib (32 bit, library only)"
arch=('x86_64')
license=('LGPL')
depends=('lib32-glib2' 'lib32-libsigc++' "${_pkgbasename}")
makedepends=('pkgconfig' 'gcc-multilib')
source=(http://ftp.gnome.org/pub/GNOME/sources/${_pkgbasename}/${pkgver:0:4}/${_pkgbasename}-${pkgver}.tar.xz)
options=('!libtool')
url="http://gtkmm.sourceforge.net/"
sha256sums=('dc225f7d2f466479766332483ea78f82dc349d59399d30c00de50e5073157cdf')

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  ./configure --prefix=/usr --libdir=/usr/lib32 CC='gcc' CFLAGS='-m32' CXXFLAGS='-m32 -w -fpermissive' PKG_CONFIG_PATH='/usr/lib32/pkgconfig/'
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  sed -i -e 's/^doc_subdirs/#doc_subdirs/' Makefile
  make DESTDIR="${pkgdir}" install
  # Workarround for lib32-atkmm not to break 
  sed -i 's#${libdir}/glibmm#/usr/lib/glibmm#' \
    "${pkgdir}"/usr/lib32/pkgconfig/glibmm-2.4.pc
  # Cleanup for a lib32 package
  rm -rf ${pkgdir}/usr/{include,lib32/giomm*,lib32/glibmm*,share}
}
