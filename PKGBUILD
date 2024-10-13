# Maintainer:
# Contributor: Frederic Bezies <fredbezies at gmail dot com>

_pkgname="libpamac"
pkgname="$_pkgname-git"
pkgver=11.6.4.r6.g968e661
pkgrel=3
pkgdesc="Library for Pamac package manager based on libalpm"
url="https://github.com/manjaro/libpamac"
license=('GPL-3.0-or-later')
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')

depends=(
  'appstream'
  'appstream-glib'
  'archlinux-appstream-data'
  'libsoup3'
  'pacman'
  'polkit'
)
makedepends=(
  'asciidoc'
  'gettext'
  'git'
  'gobject-introspection'
  'itstool'
  'meson'
  'vala'
  'xorgproto'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  local _meson_args=(
    -Denable-aur=true
    -Denable-appstream=true
  )

  arch-meson "$_pkgsrc" build "${_meson_args[@]}"
  meson compile -C build
}

package() {
  backup=('etc/pamac.conf')
  meson install -C build --destdir "$pkgdir"
}
