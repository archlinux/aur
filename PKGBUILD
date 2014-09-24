# Maintainer: lantw44 at gmail dot com

pkgname=mingw-w64-gtk3
pkgver=3.14.0
pkgrel=1
pkgdesc="GObject-based multi-platform GUI toolkit (v3) (mingw-w64)"
arch=(any)
url="http://www.gtk.org"
license=("LGPL")
makedepends=(mingw-w64-gcc mingw-w64-pkg-config gtk-update-icon-cache python2)
# python2 is required to run gdbus-codegen
makedepends+=(autoconf automake libtool)
# autotools are required because several Makefile.am are modified
depends=(
'mingw-w64-crt'
'mingw-w64-atk>=2.12.0'
'mingw-w64-pango>=1.36.7'
'mingw-w64-glib2>=2.41.2'
'mingw-w64-cairo>=1.12.0'
'mingw-w64-gdk-pixbuf2>=2.30.0')
options=(!strip !buildflags staticlibs)

source=(
"http://ftp.gnome.org/pub/gnome/sources/gtk+/${pkgver%.*}/gtk+-${pkgver}.tar.xz"
"gtk3-commit-62254c.patch"
"0001-Bug-731013-cross-compilation-broken-when-building-ex.patch"
"0005-Remove-gobject-introspection.patch")

# The second and the third patch are downloaded from Fedora Project

sha256sums=('68d6b57d15c16808d0045e96b303f3dd439cc22a9c06fdffb07025cd713a82bc'
            '1c8812f68446d509e019b3f26863348f2cfc469dbb8866bbdfa3213e55a7c433'
            'd2825227188cf60740540086cd71c56f8e5c6d9c9b9ad7c0869e6746ad0caebe'
            'ae632ad20c87032c326dbb1cda086e33a5078909f89174b2ba232be1b48c32a3')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/gtk+-${pkgver}"
  patch -Np1 -R < "../gtk3-commit-62254c.patch"
  patch -Np1 < "../0001-Bug-731013-cross-compilation-broken-when-building-ex.patch"
  patch -Np1 < "../0005-Remove-gobject-introspection.patch"
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
    rm -r "$pkgdir/usr/${_arch}/etc"
    rm -r "$pkgdir/usr/${_arch}/share/man"
  done
}
