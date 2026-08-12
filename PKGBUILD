# Maintainer:
# Contributor: ich <remove dashes in s-c--25-ni at gmail dot com>

: ${_build_force:=true}

_pkgname="libadwaita-without-adwaita"
pkgname="$_pkgname-git"
pkgver=1.10.r162.g0d9b6d4
pkgrel=1
pkgdesc="Building blocks for modern adaptive GNOME applications - patched to respect system theme"
url="https://gitlab.gnome.org/GNOME/libadwaita"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
license=('LGPL-2.1-or-later')

depends=(
  'fribidi'
  'glib2'
  'graphene'
  'gtk4-git' # AUR
  'pango'
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
  "libadwaita=1:${pkgver%.g*}"
  'libadwaita-1.so'
)
conflicts=('libadwaita')

_pkgsrc="libadwaita"
source=(
  "$_pkgsrc"::"git+https://gitlab.gnome.org/GNOME/libadwaita.git"
  '0001-respect_system_theme.patch'
  "ministream"::"git+https://gitlab.gnome.org/sp1rit/ministream.git"
)
sha256sums=(
  'SKIP'
  '40b93035db40d5219c2a18211738cfbcf45ff8c38cc783cd79e909596f6e0808'
  'SKIP'
)

prepare() {
  cd "$_pkgsrc"
  patch -Np1 -F100 -i ../0001-respect_system_theme.patch

  ln -sf "$srcdir/ministream" "subprojects/ministream"

  if [[ "${_build_force::1}" == "t" ]]; then
    sed -E -e 's&, version: \S+_min_version&&' -i meson.build
  fi
}

pkgver() (
  cd "$_pkgsrc"
  local _pkgver=$(
    git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
      | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
  )
  local _split=(${_pkgver//./ })
  printf '%s.%s.r%s' "${_split[0]}" "$((_split[1] + 1))" "${_pkgver##*.r}"
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
