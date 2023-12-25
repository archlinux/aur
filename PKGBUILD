# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Daniel Isenmann <daniel@archlinux.org>

pkgname=lib32-gimp
_pkgbase=gimp
pkgver=2.10.36
_pkg_ver="${pkgver//./_}"
pkgrel=3
pkgdesc='GNU Image Manipulation Program (32-bit)'
url="https://www.gimp.org/"
arch=('x86_64')
depends=('lib32-dbus-glib' 'lib32-gegl' 'lib32-glib-networking'
         'lib32-lcms2' 'lib32-libgudev'
         'lib32-cairo' 'lib32-libmypaint' 'lib32-gtk2'
         'lib32-libxmu'
         'lib32-glib2' 'lib32-glibc' 'lib32-gdk-pixbuf2' 'lib32-pango'
         'lib32-libunwind' 'lib32-poppler-glib' 'gimp')
makedepends=('alsa-lib' 'curl' 'ghostscript' 'intltool' 'iso-codes')
license=('GPL' 'LGPL')
source=("https://gitlab.gnome.org/GNOME/gimp/-/archive/GIMP_${_pkg_ver}/gimp-GIMP_${_pkg_ver}.tar.bz2")
sha256sums=('8c4d52639e5890fcb8a622e55a1ff1874598f8342a31adc05bfd70d6be698ada')

build() {
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  export CFLAGS="-m32 ${CFLAGS}"
  export LDFLAGS="-m32 ${LDFLAGS}"
  export CXXFLAGS="-m32 ${CXXFLAGS}"

  pkg-config --exists --print-errors "OpenEXR >= 1.6.1"
  cd "gimp-GIMP_${_pkg_ver}/"
  ./autogen.sh --disable-gtk-doc \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --sysconfdir=/etc \
    --libexecdir=/usr/bin \
    --enable-mp \
    --enable-gimp-console \
    --without-webkit \
    --disable-check-update \
    --disable-python \
    --with-bug-report-url='https://bugs.archlinux.org/?string=gimp' \
    --without-openexr \
    --without-jpegxl \
    --without-jpeg2000 \
    --without-libheif \
    --without-libxpm \
    --without-libmng \
    --without-webp \
    --without-wmf \
    --without-aa
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "gimp-GIMP_${_pkg_ver}/"
  make DESTDIR="${pkgdir}" install

  rm -r "${pkgdir}/usr/"{share,include,bin}
  rm -r "${pkgdir}/etc"
}

