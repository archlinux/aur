# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Gicu Gorodenco <cyclopsihus 'at' gmail 'dot' com>
# Contributor: josephgbr

_name="gtkmm"
pkgname="lib32-${_name}"
pkgver=2.24.5
pkgrel=1
pkgdesc="C++ bindings for GTK+ 2 (32-bit)"
url="https://www.gtkmm.org"
arch=('x86_64')
license=('LGPL-2.1-or-later')
depends=("${_name}" 'lib32-atkmm>=2.22.2' 'lib32-cairomm' 'lib32-gcc-libs'
         'lib32-gdk-pixbuf2' 'lib32-glib2' 'lib32-glibc' 'lib32-glibmm>=2.27.93'
         'lib32-gtk2>=2.24' 'lib32-libsigc++' 'lib32-pangomm>=2.27.1')
makedepends=('mm-common')
provides=('libg'{'d','t'}'kmm-2.4.so')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.xz::https://download.gnome.org/sources/${_name}/${pkgver%.*}/${_pkgsrc}.tar.xz")
sha256sums=('0680a53b7bf90b4e4bf444d1d89e6df41c777e0bacc96e9c09fc4dd2f5fe6b72')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  rm -rf "demos" "docs" "tests"
  sed -e '/demos/d'  \
      -e '/docs/d'   \
      -e '/tests/d'  \
      -i 'configure.ac'
  sed -e 's/demos//' \
      -e 's/docs//'  \
      -e 's/tests//' \
      -i 'Makefile.am'
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export ENABLE_DOCUMENTATION=false

  cd "${srcdir}/${_pkgsrc}"
  NOCONFIGURE=1 ./autogen.sh
  ./configure \
    --prefix='/usr' \
    --program-suffix="-32" \
    --lib{exec,}dir='/usr/lib32' \
    --build=i686-pc-linux-gnu
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' 'libtool' # Fix overlinking
  make
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   make check
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}/usr"
  rm -rf "include" "share"
}
