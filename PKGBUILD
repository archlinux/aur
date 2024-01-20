# Maintainer:
# Contributor: Mitch Bigelow <mitch.bigelow at gmail.com>
# Contributer: Steven Honeyman <stevenhoneyman at gmail com>

_pkgname="geeqie"
pkgname="$_pkgname-git"
pkgver=2.1.r260.gf1c1ccb9
pkgrel=1
pkgdesc='Lightweight image viewer'
url="https://github.com/BestImageViewer/geeqie"
license=('GPL-2.0-or-later')
arch=('x86_64')

depends=(
  clutter
  clutter-gtk
  djvulibre
  exiv2
  ffmpegthumbnailer
  gspell
  gtk3
  hicolor-icon-theme
  libarchive
  libchamplain
  libjxl.so
  libraw
  lua
  openjpeg2
  poppler-glib
  #webp-pixbuf-loader

  ## implicit
  #bash
  #cairo
  #gcc-libs
  #gdk-pixbuf2
  #glib2
  #glibc
  #lcms2
  #libheif
  #libjpeg-turbo
  #libtiff
  #pango
)
makedepends=(
  doxygen
  evince
  fbida
  gawk
  graphviz
  imagemagick
  intltool
  librsvg
  libwmf
  meson
  pandoc-cli
  perl-image-exiftool
  python
  vim
  yelp-tools
)
optdepends=(
  'evince: for print preview'
  'fbida: for jpeg rotation'
  'gawk: to use the geo-decode function'
  'gphoto2: command-line tools for various (plugin) operations'
  'imagemagick: command-line tools for various (plugin) operations'
  'librsvg: SVG rendering'
  'libwebp: for WebP image format'
  'perl-image-exiftool: for the jpeg extraction plugin'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source+=("$_pkgname"::"git+$url.git")
sha256sums+=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  _version=$(git tag | grep -Ev '^.*[A-Za-z]{2}.*$' | sort -V | tail -1)
  _revision=$(git rev-list --count --cherry-pick $_version...HEAD)
  _hash=$(git rev-parse --short=8 HEAD)
  printf '%s.r%s.g%s' "${_version#v}" "${_revision:?}" "${_hash:?}"
}

build() {
  local _meson_options=(
    ## not working
    #-Dgtk4=enabled
    #-Dwebp-pixbuf-loader=enabled

    -Dcms=enabled
    -Ddjvu=enabled
    -Dexiv2=enabled
    -Dheif=enabled
    -Dj2k=enabled
    -Djpeg=enabled
    -Djpegxl=enabled
    -Dlibraw=enabled
    -Dtiff=enabled
  )

  arch-meson "$_pkgsrc" build "${_meson_options[@]}"
  meson compile -C build
}

package(){
  DESTDIR="$pkgdir" meson install -C build
}
