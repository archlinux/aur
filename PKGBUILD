# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Daniel Isenmann <daniel@archlinux.org>

pkgname=lib32-gimp
_pkgbase=gimp
pkgver=2.10.18
pkgrel=1
pkgdesc='GNU Image Manipulation Program (32-bit)'
url="https://www.gimp.org/"
arch=('x86_64')
depends=('lib32-dbus-glib' 'lib32-gegl' 'lib32-glib-networking'
         'lib32-lcms2' 'lib32-libheif' 'lib32-libexif' 'lib32-libgudev'
         'lib32-libmng' 'lib32-cairo' 'lib32-libmypaint' 'lib32-gtk2'
         'lib32-libwebp' 'lib32-libwmf' 'lib32-libxmu' 'lib32-libxpm'
         'lib32-glib2' 'lib32-glibc' 'lib32-gdk-pixbuf2' 'lib32-pango'
         'lib32-libunwind' 'lib32-poppler-glib' 'gimp')
makedepends=('alsa-lib' 'curl' 'ghostscript' 'intltool' 'iso-codes')
license=('GPL' 'LGPL')
source=("https://download.gimp.org/pub/gimp/v${pkgver%.*}/${_pkgbase}-${pkgver}.tar.bz2")
sha256sums=('65bfe111e8eebffd3dde3016ccb507f9948d2663d9497cb438d9bb609e11d716')

prepare() {
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  export CFLAGS="-m32 ${CFLAGS}"
  export LDFLAGS="-m32 ${LDFLAGS}"
  export CXXFLAGS="-m32 ${CXXFLAGS}"

  cd "${_pkgbase}-${pkgver}"
  autoreconf -vi
}

build() {
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  export CFLAGS="-m32 ${CFLAGS}"
  export LDFLAGS="-m32 ${LDFLAGS}"
  export CXXFLAGS="-m32 ${CXXFLAGS}"

  pkg-config --exists --print-errors "OpenEXR >= 1.6.1"
  cd ${_pkgbase}-${pkgver}
  PYTHON=/usr/bin/python2 ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --sysconfdir=/etc \
    --libexecdir=/usr/bin \
    --enable-mp \
    --enable-gimp-console \
    --disable-python \
    --with-bug-report-url='https://bugs.archlinux.org/?string=gimp' \
    --with-openexr \
    --without-aa
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd ${_pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" install

  rm -r "${pkgdir}/usr/"{share,include,bin}
  rm -r "${pkgdir}/etc"
}

