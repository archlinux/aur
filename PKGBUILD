# Maintainer:
# Contributor: Mitch Bigelow <mitch.bigelow at gmail.com>
# Contributer: Steven Honeyman <stevenhoneyman at gmail com>

: ${_commit=}

_pkgname="geeqie"
pkgname="$_pkgname-git"
pkgver=2.6.1.r316.g6d76645
pkgrel=1
pkgdesc='Lightweight image viewer'
url="https://github.com/BestImageViewer/geeqie"
license=('GPL-2.0-or-later')
arch=('x86_64')

depends=(
  cfitsio
  djvulibre
  exiv2
  ffmpegthumbnailer
  gspell
  gtk3
  libarchive
  libchamplain
  libheif
  libraw
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
source=("$_pkgname"::"git+$url.git${_commit:+#commit=$_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  local _version _revision _hash
  _version=$(git tag | grep -Ev '^.*[A-Za-z]{2}.*$' | sort -V | tail -1)
  _revision=$(git rev-list --count --cherry-pick $_version...HEAD)
  _hash=$(git rev-parse --short=7 HEAD)
  printf '%s.r%s.g%s' "${_version#v}" "${_revision:?}" "${_hash:?}"
}

prepare() {
  cd "$_pkgsrc"

  # fix tests
  sed -E 's&(env -i)&\1 PATH=/usr/bin&' -i scripts/isolate-test.sh
  echo "WarningsAsErrors: ''" > .clang-tidy
}

build() {
  arch-meson "$_pkgsrc" build
  meson compile -C build
}

check() {
  xvfb-run -a dbus-run-session meson test --print-errorlogs -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
