# Maintainer:

: ${_force_release:=true}

_gitname="libvips"
_pkgname="$_gitname-fs79527"
pkgname="$_pkgname"
pkgver=8.15.0rc2
pkgrel=1
pkgdesc="A fast image processing library with low memory needs"
arch=('x86_64')
license=('LGPL')
url="https://github.com/libvips/libvips"

depends=(
  'cfitsio'
  'fftw'
  'libcgif'
  'libexif'
  'libgsf'
  'libimagequant'
  'librsvg'
  'libwebp'
  'libxml2'
  'openexr'
  'orc'
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

if [ x"$pkgname" == x"$_pkgname" ] ; then
  # normal package
  pkgver() {
    local _pkgver="${_gittag#v}"
    sed -E 's@-(rc[0-9]+)$@\1@' <<< "$_pkgver"
  }

  _gittag="v8.15.0-rc2"

  provides=("$_gitname=$(pkgver)")
  conflicts=("$_gitname")

  _pkgsrc="$_gitname-${_gittag#v}"
  _pkgext="tar.gz"
  source+=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/$_gittag.$_pkgext")
  sha256sums+=('5f5e39ba6aa61c7c20da7054b0a575637642fc6307147b61f2fcd7942593279b')
else
  # git package
  makedepends+=('git')

  provides=("$_pkgname=${pkgver%%.r*}")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git")
  sha256sums+=('SKIP')

  pkgver() (
    set -o pipefail

    cd "$_pkgsrc"
    git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' 2>/dev/null \
      | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g' \
    || printf "r%s.%s" \
      "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short=7 HEAD)"
  )
fi

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
