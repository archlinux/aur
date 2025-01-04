# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="gdlmm"
pkgname="lib32-${_name}"
pkgver=3.7.3
pkgrel=1
pkgdesc="C++ bindings for the gdl library (32-bit)"
url="https://gitlab.gnome.org/Archive/${_name}"
arch=('x86_64')
license=('LGPL-2.0-or-later')
depends=("${_name}" 'lib32-atkmm' 'lib32-gcc-libs' 'lib32-gdl' 'lib32-glib2'
         'lib32-glibc' 'lib32-glibmm' 'lib32-gtk3' 'lib32-gtkmm3'
         'lib32-libsigc++')
makedepends=('mm-common')
provides=("lib${_name}-3.0.so")
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.xz::https://download.gnome.org/sources/${_name}/${pkgver%.*}/${_pkgsrc}.tar.xz")
sha256sums=('e280ed9233877b63ad0a0c8fb04d2c35dc6a29b3312151ee21a15b5932fef79b')

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}/${_pkgsrc}"
  NOCONFIGURE=1 ./autogen.sh
  ./configure \
    --prefix='/usr' \
    --program-suffix="-32" \
    --lib{exec,}dir='/usr/lib32' \
    --build=i686-pc-linux-gnu
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool # Fix overlinking
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}/usr"
  rm -rf "include" "share"
}
