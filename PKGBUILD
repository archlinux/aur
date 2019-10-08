pkgname=mingw-w64-gdk-pixbuf2
pkgver=2.40.0
pkgrel=1
pkgdesc='An image loading library (mingw-w64)'
arch=('any')
url='http://www.gtk.org'
license=('LGPL')
makedepends=(
  'mingw-w64-gcc'
  'mingw-w64-pkg-config'
  'mingw-w64-meson'
  'mingw-w64-wine'
  'python') # python is required to run glib-mkenums
depends=(
  'mingw-w64-crt'
  'mingw-w64-glib2>=2.37.6'
  'mingw-w64-jasper'
  'mingw-w64-libpng'
  'mingw-w64-libjpeg-turbo'
  'mingw-w64-libtiff')
options=('!strip' '!buildflags' 'staticlibs')
source=(
  "https://download.gnome.org/sources/gdk-pixbuf/${pkgver%.*}/gdk-pixbuf-$pkgver.tar.xz"
  'gdk-pixbuf2-gen-thumbnailer-wine.patch')
sha256sums=(
  '1582595099537ca8ff3b99c6804350b4c058bb8ad67411bbaae024ee7cead4e6'
  '69dd65e803a7a0d752536478864b19d77423affff2921aea5d076dd5916594f6')

_architectures=('i686-w64-mingw32' 'x86_64-w64-mingw32')

prepare() {
  cd "${srcdir}/gdk-pixbuf-${pkgver}"
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
  export NEED_WINE=1
  cd "${srcdir}/gdk-pixbuf-${pkgver}"
  for _arch in "${_architectures[@]}"; do
    mkdir -p "build-${_arch}"
    cd "build-${_arch}"
    # GdkPixbuf upstream still doesn't support cross-compilation properly.
    # https://gitlab.gnome.org/GNOME/gdk-pixbuf/issues/64
    export WINEPATH="${srcdir}/gdk-pixbuf-${pkgver}/build-${_arch}/gdk-pixbuf;/usr/${_arch}/bin"
    export WINE="${_arch}-wine"
    "${_arch}-meson" \
      --default-library both \
      -Dinstalled_tests=false \
      -Dbuiltin_loaders=all \
      -Drelocatable=true \
      -Djasper=true \
      -Dx11=false \
      -Dgir=false \
      -Dman=false
    ninja
    cd ..
  done
}

package() {
  cd "${srcdir}/gdk-pixbuf-${pkgver}"
  for _arch in "${_architectures[@]}"; do
    cd "build-${_arch}"
    DESTDIR="$pkgdir" ninja install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec "${_arch}-strip" '{}' ';'
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec "${_arch}-strip" --strip-unneeded '{}' ';'
    find "$pkgdir/usr/${_arch}" '(' -name '*.a' -o -name '*.dll' ')' -exec "${_arch}-strip" -g '{}' ';'
    cd ..
  done
}
