pkgname=mingw-w64-gtk2
pkgver=2.24.33
pkgrel=1
pkgdesc="GObject-based multi-platform GUI toolkit (legacy) (mingw-w64)"
arch=('any')
url="https://www.gtk.org"
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
  "https://download.gnome.org/sources/gtk+/${pkgver%.*}/gtk+-${pkgver}.tar.xz")
sha256sums=(
  'ac2ac757f5942d318a311a54b0c80b5ef295f299c2a73c632f6bfb1ff49cc6da')

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
