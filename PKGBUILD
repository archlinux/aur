# Maintainer: lantw44 at gmail dot com

pkgname=mingw-w64-gtk3
pkgver=3.22.4
pkgrel=1
pkgdesc='GObject-based multi-platform GUI toolkit (mingw-w64)'
arch=(any)
url='http://www.gtk.org'
install="${pkgname}.install"
license=('LGPL')
makedepends=(
  'mingw-w64-gcc'
  'mingw-w64-pkg-config'
  'mingw-w64-configure'
  'gtk-update-icon-cache'
  'python') # python is required to run gdbus-codegen
depends=(
  'mingw-w64-crt'
  'mingw-w64-adwaita-icon-theme'
  'mingw-w64-atk>=2.15.1'
  'mingw-w64-cairo>=1.14.2-3'
  'mingw-w64-gdk-pixbuf2>=2.30.0'
  'mingw-w64-glib2>=2.49.4'
  'mingw-w64-libepoxy>=1.0'
  'mingw-w64-pango>=1.37.3')
options=(!strip !buildflags staticlibs)
source=("https://download.gnome.org/sources/gtk+/${pkgver%.*}/gtk+-${pkgver}.tar.xz")
sha256sums=('7094a6fcfe133d01c578358bd5d3e499715f1a0206e87bd5cf6c834e301f387f')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/gtk+-${pkgver}"
}

build() {
  cd "${srcdir}/gtk+-${pkgver}"
  for _arch in ${_architectures}; do
    export PKG_CONFIG="${_arch}-pkg-config"
    export PKG_CONFIG_FOR_BUILD="pkg-config"
    mkdir -p "build-${_arch}"
    cd "build-${_arch}"
    ${_arch}-configure \
      --enable-broadway-backend \
      --enable-win32-backend \
      --disable-cups
    make
    cd ..
  done
}

package() {
  cd "${srcdir}/gtk+-${pkgver}"
  for _arch in ${_architectures}; do
    cd "build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' | xargs -rtL1 ${_arch}-strip
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtL1 ${_arch}-strip --strip-unneeded
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtL1 ${_arch}-strip -g
    rm "$pkgdir/usr/${_arch}/lib/"*.def
    rm -r "$pkgdir/usr/${_arch}/etc"
    rm -r "$pkgdir/usr/${_arch}/share/man"
    cd ..
  done
}
