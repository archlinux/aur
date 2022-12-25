# Maintainer: lantw44 (at) gmail (dot) com

pkgname=mingw-w64-gtk4
pkgver=4.8.3
pkgrel=1
pkgdesc='GObject-based multi-platform GUI toolkit (mingw-w64)'
arch=('any')
url='https://www.gtk.org'
install="${pkgname}.install"
license=('LGPL')
makedepends=(
  'mingw-w64-gcc'
  'mingw-w64-pkg-config'
  'mingw-w64-meson'
  'python'
  'sassc')
depends=(
  'mingw-w64-crt'
  'mingw-w64-adwaita-icon-theme'
  'mingw-w64-cairo>=1.14.2-3'
  'mingw-w64-fribidi>=0.19.7'
  'mingw-w64-gdk-pixbuf2>=2.30.0'
  'mingw-w64-glib2>=2.66.0'
  'mingw-w64-graphene>=1.9.1'
  'mingw-w64-gst-plugins-bad>=1.12.3'
  'mingw-w64-harfbuzz>=2.6.0'
  'mingw-w64-libepoxy>=1.4'
  'mingw-w64-libjpeg-turbo'
  'mingw-w64-libpng'
  'mingw-w64-librsvg>=2.52.0'
  'mingw-w64-libtiff'
  'mingw-w64-pango>=1.50.0')
options=('!strip' '!buildflags' 'staticlibs')
source=(
  "https://download.gnome.org/sources/gtk/${pkgver%.*}/gtk-${pkgver}.tar.xz")
sha256sums=(
  'b362f968d085b4d3d9340d4d38c706377ded9d5374e694a2b6b7e6292e3cba74')

_architectures=('i686-w64-mingw32' 'x86_64-w64-mingw32')

prepare() {
  cd "${srcdir}/gtk-${pkgver}"
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
  cd "${srcdir}/gtk-${pkgver}"
  for _arch in "${_architectures[@]}"; do
    mkdir -p "build-${_arch}"
    cd "build-${_arch}"
    "${_arch}-meson" \
      --default-library both \
      -Dbroadway-backend=false \
      -Dwin32-backend=true \
      -Dmedia-ffmpeg=disabled \
      -Dmedia-gstreamer=enabled \
      -Dprint-cups=disabled \
      -Dgtk_doc=false \
      -Dman-pages=false \
      -Dintrospection=disabled
    ninja
    cd ..
  done
}

package() {
  cd "${srcdir}/gtk-${pkgver}"
  for _arch in "${_architectures[@]}"; do
    cd "build-${_arch}"
    DESTDIR="${pkgdir}" ninja install
    find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec "${_arch}-strip" '{}' ';'
    find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec "${_arch}-strip" --strip-unneeded '{}' ';'
    find "${pkgdir}/usr/${_arch}" '(' -name '*.a' -o -name '*.dll' ')' -exec "${_arch}-strip" -g '{}' ';'
    cd ..
  done
}
