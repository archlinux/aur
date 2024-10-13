# Maintainer:
# Contributor: Frederic Bezies <fredbezies at gmail dot com>

_pkgname="pamac"
pkgname="$_pkgname-aur-git"
pkgver=11.7.1.r4.gc486ef0
pkgrel=1
pkgdesc="A GUI frontend for libalpm"
url="https://github.com/manjaro/pamac"
license=('GPL-3.0-or-later')
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')

depends=(
  'gtk4'
  'libadwaita'
  'libhandy'
  'libnotify'
  'libpamac-git'
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
optdepends=(
  'polkit-gnome: needed for authentication in Cinnamon, Gnome'
  'lxsession: needed for authentication in Xfce, LXDE etc.'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$url.git"
  "pamac-cli"::"git+https://github.com/manjaro/pamac-cli.git"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  local _meson_args=(
    -Denable-fake-gnome-software=true
  )

  arch-meson "$_pkgsrc" build "${_meson_args[@]}"
  meson compile -C build

  arch-meson "$srcdir/pamac-cli" build_cli
  meson compile -C build_cli
}

package() {
  meson install -C build --destdir "$pkgdir"
  meson install -C build_cli --destdir "$pkgdir"

  # remove pamac-gnome-integration
  rm "$pkgdir/usr/bin/gnome-software"
  rm "$pkgdir/usr/share/applications/org.gnome.Software.desktop"
  rm "$pkgdir/usr/share/dbus-1/services/org.gnome.Software.service"
}
