# Maintainer: lantw44 at gmail dot com

pkgname=mingw-w64-gtk3
pkgver=3.14.6
pkgrel=1
pkgdesc='GObject-based multi-platform GUI toolkit (v3) (mingw-w64)'
arch=(any)
url='http://www.gtk.org'
license=('LGPL')
makedepends=(
  'mingw-w64-gcc'
  'mingw-w64-pkg-config'
  'mingw-w64-configure'
  'gtk-update-icon-cache'
  'python2') # python2 is required to run gdbus-codegen
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
  "gtk3-aur-remove-gobject-introspection.patch"
  "gtk3-bug-731013-fix-cross-compilation.patch"
  "gtk3-bug-741827-reftests-fix-typo.patch")

sha256sums=('cfc424e6e10ffeb34a33762aeb77905c3ed938f0b4006ddb7e880aad234ef119'
            'ae632ad20c87032c326dbb1cda086e33a5078909f89174b2ba232be1b48c32a3'
            '2dd763d32f7b7de08a325d32b811e87266277edb6055a043632d10c146ffc6d3'
            '839ac6fa6613d0daf6e8eac6ef8d07b8f825a6556640fa480c597bd7c88e3e82')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/gtk+-${pkgver}"
  patch -Np1 < "../${source[1]}"
  patch -Np1 < "../${source[2]}"
  patch -Np1 < "../${source[3]}"
  autoreconf -i
  for _arch in ${_architectures}; do
    unset LDFLAGS
    export PKG_CONFIG="${_arch}-pkg-config"
    export PKG_CONFIG_FOR_BUILD="pkg-config"
    mkdir -p "build-${_arch}"
    cd "build-${_arch}"
    msg "Starting configure and make"
    ${_arch}-configure \
      --enable-win32-backend \
      --enable-gtk2-dependency \
      --disable-cups
    make
    cd ..
  done
}

package() {
  cd "${srcdir}/gtk+-${pkgver}"
  for _arch in ${_architectures}; do
    cd "build-${_arch}"
    make -j1 DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' -o -name '*.manifest' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip -x
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
    rm -r "$pkgdir/usr/${_arch}/etc"
    rm -r "$pkgdir/usr/${_arch}/share/man"
    cd ..
  done
}
