# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: twa022 <twa022 at gmail dot com>

pkgname=lib32-libmypaint
_pkgbase=libmypaint
pkgver=1.5.1
pkgrel=1
pkgdesc='Library for making brushstrokes which is used by MyPaint and other projects (32-bit)'
url='http://mypaint.org/'
arch=('x86_64')
license=('ISC')
depends=('libmypaint' 'lib32-glibc' 'lib32-json-c' 'lib32-gegl'
         'lib32-glib2' 'lib32-json-glib' 'lib32-babl')
makedepends=('intltool' 'python' 'gobject-introspection' 'python')
source=("https://github.com/mypaint/$_pkgbase/archive/v${pkgver}/${_pkgbase}-${pkgver}.tar.gz")
sha512sums=('3cebce0adb1f029f19dfcc19b4d8c5c1102c0cd966930fe76eda60ff4e18ced9a4c8ecae8f31f12d931172c82bd5dabd7ca7a47b9c06305472192af242b3e1b6')

prepare() {
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  export CFLAGS="-m32"
  export CXXFLAGS="-m32"
  cd "${_pkgbase}-${pkgver}"
  sed 's|python2|python|' -i autogen.sh
  ./autogen.sh
}

build() {
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  export CFLAGS="-m32"
  export CXXFLAGS="-m32"
  cd "${_pkgbase}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --enable-gegl
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "${_pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -r "$pkgdir/usr/"{share,include}
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

