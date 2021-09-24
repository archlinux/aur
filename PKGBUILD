# Maintainer: lantw44 at gmail dot com

pkgname=mingw-w64-gtk3
pkgver=3.24.30
pkgrel=1
pkgdesc='GObject-based multi-platform GUI toolkit (mingw-w64)'
arch=('any')
url='https://www.gtk.org'
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
  'mingw-w64-glib2>=2.57.2'
  'mingw-w64-libepoxy>=1.4'
  'mingw-w64-pango>=1.41.0')
options=('!strip' '!buildflags' 'staticlibs')
source=(
  "https://download.gnome.org/sources/gtk+/${pkgver%.*}/gtk+-${pkgver}.tar.xz"
  'gtk3-merge-3991-fix-autotools-build.patch'
  "${pkgname}-${pkgver}-winpointer.h::https://gitlab.gnome.org/GNOME/gtk/-/raw/${pkgver}/gdk/win32/winpointer.h")
sha256sums=(
  'ba75bfff320ad1f4cfbee92ba813ec336322cc3c660d406aad014b07087a3ba9'
  '17d1a2307655a648f9f321cd720e6207fa507ea7cae8f72445621dc8313ec3a6'
  '66d01eb23bc87533f7838f298354567c52ce246d9c8270ed503d5d5b654c2cd0')

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
  for source_file in "${source[@]:2:1}"; do
    cp "${srcdir}/${source_file%%::*}" "gdk/win32/${source_file##*/}"
  done
}

build() {
  cd "${srcdir}/gtk+-${pkgver}"
  NOCONFIGURE=1 ./autogen.sh
  for _arch in "${_architectures[@]}"; do
    export PKG_CONFIG="${_arch}-pkg-config"
    export PKG_CONFIG_FOR_BUILD="pkg-config"
    mkdir -p "build-${_arch}"
    cd "build-${_arch}"
    "${_arch}-configure" \
      --enable-broadway-backend \
      --enable-win32-backend \
      --disable-cups
    make GLIB_COMPILE_RESOURCES=glib-compile-resources PYTHON=python
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
