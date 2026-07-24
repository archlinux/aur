# Maintainer:
# Contributor: Mitch Bigelow <mitch.bigelow at gmail.com>
# Contributer: Steven Honeyman <stevenhoneyman at gmail com>

## options
: ${_use_sodeps:=false}

_pkgname="geeqie"
pkgname="$_pkgname-git"
pkgver=3.0.r26.g5ff88a0
pkgrel=2
pkgdesc='Lightweight image viewer'
url="https://github.com/BestImageViewer/geeqie"
license=('GPL-2.0-or-later')
arch=('x86_64')

depends=(
  cfitsio
  djvulibre
  exiv2
  ffmpegthumbnailer
  gtk4
  libarchive
  libheif
  libraw
  libspelling
  lua
  openexr
  poppler-glib
)
makedepends=(
  evince
  git
  meson
)
checkdepends=(
  appstream
  markdownlint
  shellcheck
  xorg-server-xvfb
)
optdepends=(
  'evince: for print preview'
  'fbida: for jpeg rotation' # exiftran
  'gawk: to use the geo-decode function'
  'gphoto2: command-line tools for various (plugin) operations'
  'imagemagick: command-line tools for various (plugin) operations'
  'perl-image-exiftool: for the jpeg extraction plugin'
)

provides=("$_pkgname")
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
  local _meson_opts=(
    -Dgps-map=disabled
  )

  arch-meson "${_meson_opts[@]}" "$_pkgsrc" build
  meson compile -C build
}

check() {
  xvfb-run -a dbus-run-session meson test --print-errorlogs -C build
}

package() {
  if [[ "${_use_sodeps::1}" == "t" ]]; then
    eval "depends+=(
      'libarchive.so'
      'libcairo.so'
      'libexiv2.so'
      'libgdk_pixbuf-2.0.so'
      'libgio-2.0.so'
      'libglib-2.0.so'
      'libgobject-2.0.so'
      'libgraphene-1.0.so'
      'libgtk-4.so'
      'libgtksourceview-5.so'
      'libheif.so'
      'libjpeg.so'
      'libjxl.so'
      'liblcms2.so'
      'libpango-1.0.so'
      'libpangocairo-1.0.so'
      'libpoppler-glib.so'
      'libspelling-1.so'
      'libtiff.so'
      'libwebp.so'
    )"
  fi

  DESTDIR="$pkgdir" meson install -C build
}
