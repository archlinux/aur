# Maintainer:
# Contributor: Mitch Bigelow <mitch.bigelow at gmail.com>
# Contributer: Steven Honeyman <stevenhoneyman at gmail com>

_pkgname="geeqie"
pkgname="$_pkgname-git"
pkgver=2.5.r26.g2b88951
pkgrel=1
pkgdesc='Lightweight image viewer'
url="https://github.com/BestImageViewer/geeqie"
license=('GPL-2.0-or-later')
arch=('x86_64')

depends=(
  cfitsio
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
  openexr
  openjpeg2
  poppler-glib
)
makedepends=(
  doxygen
  evince
  fbida
  gawk
  glib2-devel
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
  'perl-image-exiftool: for the jpeg extraction plugin'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgname"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  local _version _revision _hash
  _version=$(git tag | grep -Ev '^.*[A-Za-z]{2}.*$' | sort -V | tail -1)
  _revision=$(git rev-list --count --cherry-pick $_version...HEAD)
  _hash=$(git rev-parse --short=7 HEAD)
  printf '%s.r%s.g%s' "${_version#v}" "${_revision:?}" "${_hash:?}"
}

build() {
  arch-meson "$_pkgsrc" build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
