# Maintainer:

: ${_force_release:=false}

_gittag="v8.15.0"

_gitname="libvips"
_pkgname="$_gitname-fs79527"
pkgname="$_pkgname"
pkgver=8.15.0
pkgrel=2
pkgdesc="A fast image processing library with low memory needs"
arch=('x86_64')
license=('LGPL')
url="https://github.com/libvips/libvips"

depends=(
  'cfitsio'
  'fftw'
  'highway'
  'libarchive'
  'libcgif'
  'libexif'
  'libimagequant'
  'librsvg'
  'libwebp'
  'libxml2'
  'openexr'
  'pango'
)
makedepends=(
  'gobject-introspection'
  'gtk-doc'
  'imagemagick'
  'libheif'
  'libjxl'
  'meson'
  'openslide'
  'poppler-glib'
)
optdepends=(
  'imagemagick: for magick module'
  'libheif: for heif module'
  'libjxl: for jxl module'
  'openslide: for openslide module'
  'poppler-glib: for poppler module'
)

provides=("$_gitname=${pkgver:?}")
conflicts=("$_gitname")

_pkgsrc="$_gitname-${_gittag#v}"
_pkgext="tar.gz"
source+=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/$_gittag.$_pkgext")
sha256sums+=('990641f1c10f1df238719b28e6843275bdefd76de642d197307455f0183c02c3')

pkgver() {
  local _pkgver="${_gittag#v}"
  sed -E 's@-(rc[0-9]+)$@\1@' <<< "$_pkgver"
}

build() {
  local _meson_options=(
    "$_pkgsrc"
    --prefix=/usr
    -Ddeprecated=false
    -Dgtk_doc=true
  )

  if [ x"$_force_release" == "xt" ] ; then
    _meson_options+=(
      --buildtype=release
    )
  fi

  meson build "${_meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir="${pkgdir:?}"
}
