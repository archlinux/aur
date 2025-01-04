# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="gdl"
pkgname="lib32-${_name}"
pkgver=3.40.0
pkgrel=1
pkgdesc="GNOME Docking Library (32-bit)"
url="https://gitlab.gnome.org/Archive/${_name}"
arch=('x86_64')
license=('LGPL-2.1-or-later')
depends=("${_name}" 'lib32-cairo' 'lib32-gdk-pixbuf2' 'lib32-glib2>=2.10'
         'lib32-glibc' 'lib32-gtk3' 'lib32-libxml2>=2.2.8')
makedepends=('glib2-devel' 'gobject-introspection' 'intltool>=0.40.4')
provides=("lib${_name}-${pkgver%%.*}.so")
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.xz::https://download.gnome.org/sources/${_name}/${pkgver%.*}/${_pkgsrc}.tar.xz")
sha256sums=('3641d4fd669d1e1818aeff3cf9ffb7887fc5c367850b78c28c775eba4ab6a555')

build() {
  export CFLAGS+=" -m32 -Wno-error=incompatible-pointer-types"
  export CXXFLAGS+=" -m32 -Wno-error=incompatible-pointer-types"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}/${_pkgsrc}"
  libtoolize
  autoreconf -vfi
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
