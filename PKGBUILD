# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: twa022 <twa022 at gmail dot com>

pkgname=lib32-libmypaint
_pkgbase=libmypaint
pkgver=1.6.1
pkgrel=1
pkgdesc='Library for making brushstrokes which is used by MyPaint and other projects (32-bit)'
url='http://mypaint.org/'
arch=('x86_64')
license=('ISC')
depends=('libmypaint' 'lib32-glibc' 'lib32-json-c' 'lib32-gegl'
         'lib32-glib2' 'lib32-json-glib' 'lib32-babl')
makedepends=('intltool' 'python' 'gobject-introspection' 'python')
source=("https://github.com/mypaint/$_pkgbase/archive/v${pkgver}/${_pkgbase}-${pkgver}.tar.gz")
sha512sums=('f759223e2e2da9fcc675bc2fa6324e2688ab36bdd979c0b3fad6737a6884e6095b6599c37960fd4897b9fd9063d5643fc2ab7e559438095c1872e019cd46d38b')

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

