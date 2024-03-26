# Maintainer:

_pkgname="epdfview"
pkgname="$_pkgname-git"
pkgver=0.2.0.r28.g6f907bd
pkgrel=2
pkgdesc='Lightweight PDF document viewer'
url='https://github.com/Flow-It/epdfview_old'
license=('GPL-2.0-or-later')
arch=('x86_64')

depends=(
  'gtk3'
  'hicolor-icon-theme'
  'poppler-glib'

  ## implicit
  #cairo
  #gdk-pixbuf2
  #glib2
  #pango
)
makedepends=(
  'doxygen'
  'git'
  'meson'
  'ninja'
)

options=('!emptydirs')

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgname"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  local _regex="^\s+version:\s+'([0-9]+\\.[0-9]+\\.[0-9]+)',\$"
  local _file='meson.build'

  local _line=$(grep -Esm1 "$_regex" "$_file")
  local _line_num=$(grep -Ensm1 "$_regex" "$_file" | cut -d':' -f1)

  local _version=$(sed -E "s@$_regex@\1@" <<< "$_line")

  local _commit=$(git blame -L $_line_num,+1 -- "$_file" | awk '{print $1;}')

  local _revision=$(git rev-list --count --cherry-pick "$_commit"...HEAD)
  local _hash=$(git rev-parse --short=7 HEAD)

  printf '%s.r%s.g%s' "${_version:?}" "${_revision:?}" "${_hash:?}"
}

build() {
  local _meson_options=(
    --prefix=/usr
    --buildtype=plain
  )

  arch-meson "$_pkgsrc" build "${_meson_options[@]}"

  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
