pkgname=mingw-w64-gtk2
pkgver=2.24.32
pkgrel=2
pkgdesc="GObject-based multi-platform GUI toolkit (legacy) (mingw-w64)"
arch=('any')
url="http://www.gtk.org"
license=("LGPL")
makedepends=(
  'mingw-w64-gcc'
  'mingw-w64-pkg-config'
  'mingw-w64-configure'
  'gtk-update-icon-cache'
  'python') # python is required to run glib-mkenums
depends=(
  'mingw-w64-crt'
  'mingw-w64-atk>=1.29.2'
  'mingw-w64-pango>=1.20'
  'mingw-w64-glib2>=2.28.0'
  'mingw-w64-cairo>=1.6'
  'mingw-w64-gdk-pixbuf2>=2.21.0')
options=('!strip' '!buildflags' 'staticlibs')
source=(
  "https://download.gnome.org/sources/gtk+/${pkgver%.*}/gtk+-${pkgver}.tar.xz"
  'gtk2-fix-gcc-10-build.patch'
  'gtk2-fix-out-of-source-build.patch')
sha256sums=(
  'b6c8a93ddda5eabe3bfee1eb39636c9a03d2a56c7b62828b359bf197943c582e'
  'a3d347337b0aaa2b170b836c20070f758698949d0511b9a92528ab4926bdcfe6'
  'e88bb004767c95cd567f225995891f054218e2c806844a3e5c12b70ac3ea231e')

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
  rm "${srcdir}/gtk+-${pkgver}/gtk/gtk.def"
}

build() {
  cd "${srcdir}/gtk+-${pkgver}"
  autoreconf -fi
  for _arch in "${_architectures[@]}"; do
    msg "Building for ${_arch}"
    mkdir -p "build-${_arch}"
    cd "build-${_arch}"
    msg "Starting configure and make"
    "${_arch}-configure" \
      --with-gdktarget=win32 \
      --disable-modules \
      --disable-cups \
      --disable-papi \
      --disable-glibtest
    make
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
    rm "$pkgdir/usr/${_arch}/bin/gtk-update-icon-cache.exe"
    rm "$pkgdir/usr/${_arch}/lib/"*.def
    rm -r "$pkgdir/usr/${_arch}/etc"
    rm -r "$pkgdir/usr/${_arch}/share/gtk-2.0"
    cd ..
  done
}
