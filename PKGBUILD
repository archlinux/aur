# Maintainer:
# Contributor: ich <remove dashes in s-c--25-ni at gmail dot com>

_pkgname="libadwaita-without-adwaita"
pkgname="$_pkgname-git"
pkgver=1.8.1.r64.g55e1e5e
pkgrel=1
pkgdesc="Building blocks for modern adaptive GNOME applications - patched to respect system theme"
url="https://gitlab.gnome.org/GNOME/libadwaita"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
license=('LGPL-2.1-or-later')

depends=(
  'appstream'
  'gtk4'
)
makedepends=(
  'git'
  'glib2-devel'
  'gobject-introspection'
  'meson'
  'sassc'
  'vala'
)

provides=(
  "libadwaita=1:$pkgver"
  "libadwaita-1.so"
)
conflicts=('libadwaita')

_pkgsrc="libadwaita"
source=(
  "$_pkgsrc"::"git+https://gitlab.gnome.org/GNOME/libadwaita.git"
  '0001-respect_system_theme.patch'
)
sha256sums=(
  'SKIP'
  'efcd44b8fdd4a6a4afaf278c55525b9b28010170bfdf72f51a1e38f1049dfa91'
)

prepare() {
  cd "$_pkgsrc"
  patch -Np1 -F100 -i ../0001-respect_system_theme.patch
}

pkgver() (
  cd "$_pkgsrc"
  local _tmp _tag _version _revision _hash
  _tmp=$(git tag | grep -Ev '[A-Za-z][A-Za-z]' | sed -E 's&([^0-9]*)(\S+)$&\2 \1\2&' | sort -rV | head -1)
  _version=$(cut -f1 -d' ' <<< ${_tmp:?})
  _tag=$(cut -f2 -d' ' <<< ${_tmp:?})
  _revision=$(git rev-list --count --cherry-pick "$_tag"...HEAD)
  _commit=$(git rev-parse --short=7 HEAD)
  printf '%s.r%s.g%s' "${_version:?}" "${_revision:?}" "${_commit:?}"
)

build() {
  local meson_options=(
    -Dexamples=false
    -Dtests=false
  )

  arch-meson "$_pkgsrc" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
