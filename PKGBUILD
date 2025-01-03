# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="libepc"
pkgname="lib32-${_name}"
pkgver=0.4.6
pkgrel=1
pkgdesc="Easy Publish and Consume Library (32-bit)"
arch=('x86_64')
url="https://gitlab.gnome.org/Archive/libepc"
license=('LGPL-2.1-or-later')
depends=('lib32-avahi>=0.6' 'lib32-glib2>=2.36' 'lib32-glibc'
         'lib32-gnutls>=1.4' 'lib32-gtk3' 'lib32-libsoup>=2.2'
         'lib32-util-linux')
makedepends=('gnome-common' 'intltool>=0.35')
provides=("${_name}-1.0.so" "${_name}-ui-1.0.so")
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.xz::https://download.gnome.org/sources/${_name}/${pkgver%.*}/${_pkgsrc}.tar.xz")
sha256sums=('215990847a8526c85774cb74fbcaea4c46866df58281b21dce5a62aac5da7ae8')

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}/${_pkgsrc}"
  libtoolize
  autoreconf -vfi
 ./configure \
    --prefix='/usr' \
    --program-suffix="-32" \
    --lib{exec,}dir='/usr/lib32' \
    --build=i686-pc-linux-gnu \
    --disable-gtk-doc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install
  
  cd "${pkgdir}/usr"
  rm -rf "include" "share"
}