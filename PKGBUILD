# Maintainer: lantw44 at gmail dot com

pkgname=mingw-w64-gtk3
pkgver=3.10.0
pkgrel=1
pkgdesc="GTK+ is a multi-platform toolkit (v3) (mingw-w64)"
arch=(any)
url="http://www.gtk.org"
license=("LGPL")
makedepends=(mingw-w64-gcc mingw-w64-pkg-config gtk-update-icon-cache python2)
# python2 is required to run gdbus-codegen
makedepends+=(autoconf automake libtool)
# autotools are required because several Makefile.am are modified
depends=(
'mingw-w64-crt'
'mingw-w64-atk>=2.7.5'
'mingw-w64-pango>=1.32.4'
'mingw-w64-glib2>=2.37.5'
'mingw-w64-cairo>=1.12.0'
'mingw-w64-gdk-pixbuf2>=2.27.1')
options=(!libtool !strip !buildflags)

source=(
"http://ftp.gnome.org/pub/gnome/sources/gtk+/${pkgver%.*}/gtk+-${pkgver}.tar.xz"
"0004-BURN-THE-.DEF.patch")

# The second source file is downloaded from Fedora Project

md5sums=('f5148a330886b906ba0eb7842409d93f'
         '369582585e60eab9fa5c9aa22a68e41c')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/gtk+-${pkgver}"
  patch -Np1 < "../0004-BURN-THE-.DEF.patch"
  autoreconf -i
  for _arch in ${_architectures}; do
    unset LDFLAGS
    export CFLAGS="-O2 -mms-bitfields"
    export CXXFLAGS="${CFLAGS}"
    export PKG_CONFIG="${_arch}-pkg-config"
    export PKG_CONFIG_FOR_BUILD="pkg-config"
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    msg "Starting configure and make"
    ${srcdir}/gtk+-${pkgver}/configure \
      --prefix=/usr/${_arch} \
      --build=$CHOST \
      --host=${_arch} \
      --enable-win32-backend \
      --enable-gtk2-dependency \
      --enable-static \
      --enable-shared \
      --disable-cups
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    make -j1 DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' -o -name '*.manifest' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip -x
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
    rm -r "$pkgdir/usr/${_arch}/"{etc,share}
  done
}
