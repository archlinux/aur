# Maintainer: lantw44 (at) gmail (dot) com

pkgname=mingw-w64-gtk4
pkgver=4.4.1
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
  'mingw-w64-harfbuzz>=2.1.0'
  'mingw-w64-libepoxy>=1.4'
  'mingw-w64-librsvg>=2.46.0'
  'mingw-w64-pango>=1.47.0')
options=('!strip' '!buildflags' 'staticlibs')
source=(
  "https://download.gnome.org/sources/gtk/${pkgver%.*}/gtk-${pkgver}.tar.xz"
  'gtk4-merge-3999-fix-find_library.patch'
  'gtk4-merge-4000-fix-includes.patch')
sha256sums=(
  '0faada983dc6b0bc409cb34c1713c1f3267e67c093f86b1e3b17db6100a3ddf4'
  'fca9be9278d60eeb28c9a41b2571e880e0ac4a6bf7baa90e87007d18b581052e'
  '6d043e449774f3c3bef58478dbea6359cf43301bdf573ca0cced14520cb87742')

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
      -Df16c=disabled \
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
