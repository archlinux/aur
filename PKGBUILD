# Maintainer: Gicu Gorodenco <cyclopsihus 'at' gmail 'dot' com>
# Contributor: josephgbr <rafael.f.f1 'at' gmail 'dot' com> 
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

_pkgbasename=glibmm
pkgname=lib32-$_pkgbasename
pkgver=2.56.0
pkgrel=1
pkgdesc="C++ bindings for GLib (32 bit, library only)"
url="http://www.gtkmm.org/"
arch=(x86_64)
license=(LGPL)
depends=(lib32-glib2 lib32-libsigc++ "${_pkgbasename}")
makedepends=(pkgconfig gcc-multilib git mm-common perl-xml-parser clang)
_commit=8236b0f457e6ede0511f5e197017baa31eb953b4  # tags/2.56.0^0
source=("git+https://git.gnome.org/browse/glibmm#commit=$_commit")
sha256sums=('SKIP')
options=('!libtool')

pkgver() {
  cd ${_pkgbasename}
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd ${_pkgbasename}
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd ${_pkgbasename}
  ./configure --prefix=/usr --enable-maintainer-mode --libdir=/usr/lib32 CC='gcc' CFLAGS='-m32' CXXFLAGS='-m32 -w -fpermissive' PKG_CONFIG_PATH='/usr/lib32/pkgconfig/'
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd ${_pkgbasename}
  sed -i -e '/^doc_subdirs/s/^/#/' Makefile
  make DESTDIR="${pkgdir}" install
  # Workarround for lib32-atkmm not to break 
  sed -i 's#${libdir}/glibmm#/usr/lib/glibmm#' \
    "${pkgdir}"/usr/lib32/pkgconfig/glibmm-2.4.pc
  # Cleanup for a lib32 package
  rm -rf ${pkgdir}/usr/{include,lib32/giomm*,lib32/glibmm*,share}
}
