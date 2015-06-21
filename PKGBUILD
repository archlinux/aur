# Maintainer: Gicu Gorodenco <cyclopsihus 'at' gmail 'dot' com>
# Contributor: josephgbr <rafael.f.f1 'at' gmail 'dot' com> 
_pkgbasename=glibmm
pkgname=lib32-$_pkgbasename
pkgver=2.44.0
pkgrel=1
pkgdesc="Glib-- (glibmm) is a C++ interface for glib (32 bit, library only)"
arch=('x86_64')
license=('LGPL')
depends=('lib32-glib2' 'lib32-libsigc++' "${_pkgbasename}")
makedepends=('pkgconfig' 'gcc-multilib')
source=(http://ftp.gnome.org/pub/GNOME/sources/${_pkgbasename}/${pkgver%.*}/${_pkgbasename}-${pkgver}.tar.xz)
options=('!libtool')
url="http://gtkmm.sourceforge.net/"
sha256sums=('1b0ac0425d24895507c0e0e8088a464c7ae2d289c47afa1c11f63278fc672ea8')

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  ./configure --prefix=/usr --libdir=/usr/lib32 CC='gcc -m32' CXX='g++ -m32'
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
