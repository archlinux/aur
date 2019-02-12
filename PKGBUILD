# Maintainer: lantw44 at gmail dot com

pkgname=mingw-w64-gtk3
pkgver=3.24.5
pkgrel=1
pkgdesc='GObject-based multi-platform GUI toolkit (mingw-w64)'
arch=('any')
url='http://www.gtk.org'
install="${pkgname}.install"
license=('LGPL')
makedepends=(
  'mingw-w64-gcc'
  'mingw-w64-pkg-config'
  'mingw-w64-configure'
  'gobject-introspection'
  'gtk-update-icon-cache'
  'python') # python is required to run gdbus-codegen
depends=(
  'mingw-w64-crt'
  'mingw-w64-adwaita-icon-theme'
  'mingw-w64-atk>=2.15.1'
  'mingw-w64-cairo>=1.14.2-3'
  'mingw-w64-fribidi>=0.19.7'
  'mingw-w64-gdk-pixbuf2>=2.30.0'
  'mingw-w64-glib2>=2.53.4'
  'mingw-w64-libepoxy>=1.4'
  'mingw-w64-pango>=1.41.0')
options=('!strip' '!buildflags' 'staticlibs')
source=(
  "https://download.gnome.org/sources/gtk+/${pkgver%.*}/gtk+-${pkgver}.tar.xz"
  'gtk3-link-gdk-against-fribidi.patch'
  'gtk3-fribidi-private-dependency.patch')
sha256sums=(
  '0be5fb0d302bc3de26ab58c32990d895831e2b7c7418d0ffea1206d6a3ddb02f'
  '7d92bc28c1b8d5aacc69d2414419a60a23e664e1ffe19835f79cea21b9f99864'
  '8f3fceda7ec0deb93df405060e95e4aa65af94b10d75697057781e472535cfe9')

_architectures=('i686-w64-mingw32' 'x86_64-w64-mingw32')

prepare() {
  cd "${srcdir}/gtk+-${pkgver}"
  local source_file
  for source_file in "${source[@]}"; do
    case "${source_file}" in
      *.patch)
        patch -p1 < "${srcdir}/${source_file}"
        ;;
    esac
  done
}

build() {
  cd "${srcdir}/gtk+-${pkgver}"
  autoreconf -fiv
  for _arch in "${_architectures[@]}"; do
    export PKG_CONFIG="${_arch}-pkg-config"
    export PKG_CONFIG_FOR_BUILD="pkg-config"
    mkdir -p "build-${_arch}"
    cd "build-${_arch}"
    "${_arch}-configure" \
      --enable-broadway-backend \
      --enable-win32-backend \
      --disable-cups
    make GLIB_COMPILE_RESOURCES=glib-compile-resources
    cd ..
  done
}

package() {
  cd "${srcdir}/gtk+-${pkgver}"
  for _arch in "${_architectures[@]}"; do
    cd "build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec "${_arch}-strip" '{}' ';'
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec "${_arch}-strip" --strip-unneeded '{}' ';'
    find "$pkgdir/usr/${_arch}" '(' -name '*.a' -o -name '*.dll' ')' -exec "${_arch}-strip" -g '{}' ';'
    rm "$pkgdir/usr/${_arch}/lib/"*.def
    rm -r "$pkgdir/usr/${_arch}/etc"
    rm -r "$pkgdir/usr/${_arch}/share/man"
    cd ..
  done
}
