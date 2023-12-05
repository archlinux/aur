# Maintainer:
# Contributor: Mitch Bigelow <mitch.bigelow at gmail.com>
# Contributer: Steven Honeyman <stevenhoneyman at gmail com>

_pkgname="geeqie"
pkgname="$_pkgname-git"
pkgver=2.1.r241.g022e9b12
pkgrel=1
pkgdesc='Lightweight image viewer'
url="https://github.com/BestImageViewer/geeqie"
license=('GPL2')
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
  libjxl
  libraw
  lua
  openjpeg2
  poppler-glib
  webp-pixbuf-loader

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
source=(
  "$_pkgname"::"git+$url.git"
  "1214-exiv2.patch"
)
sha256sums=(
  'SKIP'
  'dbabf63915eb018b219a7f887fd14adc163016852fdae9564f8979fbe58a55c0'
)

prepare() {
  apply-patch() {
    printf '\nApplying patch %s\n' "$1"
    patch -Np1 -F100 -i "$1"
  }

  cd "$_pkgsrc"

  apply-patch "$srcdir/1214-exiv2.patch"
}

pkgver() {
  cd "$_pkgsrc"
  _version=$(git tag | grep -Ev '^.*[A-Za-z]{2}.*$' | sort -V | tail -1)
  _revision=$(git rev-list --count --cherry-pick $_version...HEAD)
  _hash=$(git rev-parse --short=8 HEAD)
  printf '%s.r%s.g%s' "${_version#v}" "${_revision:?}" "${_hash:?}"
}

build() {
  local _meson_options=(
    -Dcms=enabled
    -Ddjvu=enabled
    -Dexiv2=enabled
    #-Dgtk4=enabled
    -Dheif=enabled
    -Dj2k=enabled
    -Djpeg=enabled
    -Djpegxl=enabled
    -Dlibraw=enabled
    -Dtiff=enabled
    -Dwebp-pixbuf-loader=enabled
  )

  arch-meson "$_pkgsrc" build "${_meson_options[@]}"
  meson compile -C build
}

package(){
  DESTDIR="$pkgdir" meson install -C build
}
