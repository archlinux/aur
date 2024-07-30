# Maintainer:

_pkgname="termite"
pkgname="$_pkgname-git"
pkgver=16.9.r2.gbd9945f
pkgrel=1
pkgdesc='A simple VTE-based terminal'
url="https://github.com/aperezdc/termite"
license=('LGPL-2.0-or-later')
arch=('x86_64')

depends=(
  'gnutls'
  'gtk3'
  'pcre2'
  'vte-common'
)
makedepends=(
  'git'
  'glib2-devel'
  'gperf'
  'meson'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$url.git"
  "aperezdc.vte"::"git+https://github.com/aperezdc/vte.git"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

backup=(etc/xdg/termite/config)

prepare() {
  local _vte_hash=$(grep -Po '(?<=revision = )[a-f0-9]+$' "$_pkgsrc/subprojects/vte.wrap")
  ln -s "$srcdir/aperezdc.vte" "$_pkgsrc/subprojects/vte"
  git -c advice.detachedHead=false -C "aperezdc.vte" checkout -f "$_vte_hash"
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  arch-meson build "$_pkgsrc"
  meson compile -C build
}

package() {
  meson install -C build --skip-subprojects vte --destdir "$pkgdir"
}
