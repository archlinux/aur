# Maintainer:

_pkgname="termite"
pkgname="$_pkgname-git"
pkgver=16.6.r0.g86381ed
pkgrel=1
pkgdesc='A simple VTE-based terminal'
url="https://github.com/aperezdc/termite"
license=(LGPL)
arch=(x86_64)

depends=(
  'gnutls'
  'gtk3'
  'pcre2'
  'vte-common'
)
makedepends=(
  'git'
  'gperf'
  'meson'
  'ninja'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_vte_hash=22624df361d33446f8c78fea72eb4e112b68e599

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$url.git"
  "aperezdc.vte"::"git+https://github.com/aperezdc/vte.git#commit=$_vte_hash"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

backup=(etc/xdg/termite/config)

prepare() {
  ln -s "$srcdir/aperezdc.vte" "$_pkgsrc/subprojects/vte"
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build () {
  arch-meson build "$_pkgsrc"
  meson compile -C build
}

package () {
  meson install -C build --skip-subprojects vte --destdir "${pkgdir}"
}
