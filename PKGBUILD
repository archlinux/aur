# Maintainer: lantw44 at gmail dot com

pkgname=mingw-w64-gtk3
pkgver=3.14.5
pkgrel=1
pkgdesc="GObject-based multi-platform GUI toolkit (v3) (mingw-w64)"
arch=(any)
url="http://www.gtk.org"
license=("LGPL")
makedepends=(mingw-w64-gcc mingw-w64-pkg-config gtk-update-icon-cache python2)
# python2 is required to run gdbus-codegen
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
"0005-Remove-gobject-introspection.patch"
"gtk3-bug-731013-fix-cross-compilation.patch"
"window-GtkPlug-is-conditionally-supported-on-X11-o.patch")

# The third patch is downloaded from Fedora Project
# The fourth patch: https://bugzilla.gnome.org/show_bug.cgi?id=739885

sha256sums=('ba70f5ccde6646c6d8aa5a6398794b7bcf23fc45af22580a215d258f392dbbe2'
            'ae632ad20c87032c326dbb1cda086e33a5078909f89174b2ba232be1b48c32a3'
            '2dd763d32f7b7de08a325d32b811e87266277edb6055a043632d10c146ffc6d3'
            '32be72eb4e6cead4c94a90a23c636adc76f41ac33fc6328740c0764ae02fdd9b')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/gtk+-${pkgver}"
  patch -Np1 < "../0005-Remove-gobject-introspection.patch"
  patch -Np1 < "../gtk3-bug-731013-fix-cross-compilation.patch"
  patch -Np1 < "../window-GtkPlug-is-conditionally-supported-on-X11-o.patch"
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
