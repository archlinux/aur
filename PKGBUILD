# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: twa022 <twa022 at gmail dot com>

pkgname=lib32-libmypaint
_pkgbase=libmypaint
pkgver=1.4.0
pkgrel=1
pkgdesc='Library for making brushstrokes which is used by MyPaint and other projects (32-bit)'
url='http://mypaint.org/'
arch=('x86_64')
license=('ISC')
depends=('libmypaint' 'lib32-glibc' 'lib32-json-c' 'lib32-gegl'
         'lib32-glib2' 'lib32-json-glib' 'lib32-babl')
makedepends=('intltool' 'python' 'gobject-introspection' 'python')
source=("https://github.com/mypaint/$_pkgbase/archive/v${pkgver}/${_pkgbase}-${pkgver}.tar.gz"
        libmypaint-1.4-gegl-version-revert.patch::"https://github.com/anthraxx/$_pkgbase/commit/5e0290c5fb8a175a9f0dd4c6897ff234361c321f.patch"
        gegl-0.4.patch)
sha512sums=('d6c17381dbfc8ee346762f9b4d337ccc691e48b9004f0890c682be0911a2a8c9d35592461d54d55063298c16e81353b1f004f7a0c34bb96d7e511bf9b39cd7a7'
            '313f1d4c20fa8389a184c3a8111d33c8ae99e6c746ee5baf0fe20ba73915296899371eb154ed20fc6b02dccfcd5af53010b9439b70b8d0c4843987c07169b052'
            '0df26f4c8f6f6c31a4d5718d97b3338455fbdb9168167bcae36942f5dc1d5c61db1db2448cfa62cb4551356c7454a7ef91885042cb4529a410d6fc59597fa4b9')

prepare() {
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  export CFLAGS="-m32"
  export CXXFLAGS="-m32"
  cd "${_pkgbase}-${pkgver}"
  patch -Rp1 < ../libmypaint-1.4-gegl-version-revert.patch
  patch -Np1 < ../gegl-0.4.patch
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

