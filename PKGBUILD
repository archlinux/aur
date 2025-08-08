# Maintainer:
# Contributor: Frederic Bezies <fredbezies at gmail dot com>

## options
: ${_build_appstream:=true}
: ${_build_aur:=true}
: ${_build_flatpak:=false}
: ${_build_snap:=false}

: ${_pkgtype=-aur-git}

_pkgname="pamac"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=11.7.3.r3.gf756a05
pkgrel=1
pkgdesc="Pamac package manager"
url="https://github.com/manjaro/pamac"
license=('GPL-3.0-or-later')
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')

_depends_libpamac=(
  'pacman'
  'polkit'
)
_depends_pamac=(
  'gtk4'
  'libadwaita'
  'libnotify'
)
_depends_tray_gtk=(
  'gtk3'
)
_make_cli=(
  'asciidoc'
)
_make_libpamac=(
  'gobject-introspection'
  'meson'
  'vala'
)

if [ "${_build_appstream::1}" = "t" ]; then
  _depends_libpamac+=(
    'appstream'
    'appstream-glib'
    'archlinux-appstream-data'
  )
fi
if [ "${_build_flatpak::1}" = "t" ]; then
  _make_libpamac+=(
    'flatpak'
  )
  _opt_libpamac+=('flatpak: for flatpak support')
fi
if [ "${_build_snap::1}" = "t" ]; then
  _depends_libpamac+=(
    'snapd'
    'snapd-glib'
  )
fi

makedepends=(
  'git'
  "${_depends_libpamac[@]}"
  "${_depends_pamac[@]}"
  "${_depends_tray_gtk[@]}"
  "${_make_cli[@]}"
  "${_make_libpamac[@]}"
)
optdepends=(
  "${_opt_libpamac[@]}"
  'lxsession: needed for authentication in Xfce, LXDE etc.'
  'polkit-gnome: needed for authentication in Cinnamon, Gnome'
)

_pkgsrc_pamac="$_pkgname"
_pkgsrc_libpamac="libpamac"
_pkgsrc_cli="pamac-cli"
source=(
  "$_pkgsrc_pamac"::"git+$url.git"
  "$_pkgsrc_libpamac"::"git+https://github.com/manjaro/libpamac.git"
  "$_pkgsrc_cli"::"git+https://github.com/manjaro/pamac-cli.git"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$_pkgsrc_pamac"
  if [ -z "$_pkgtype" ]; then
    git describe --tags
  else
    git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*'
  fi | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

_prepare_pamac() (
  >&2 echo "Preparing for pamac..."
  cd "$_pkgsrc_pamac"
  local _tag=$(git tag | grep -Ev '[A-Za-z]{2}' | sort -rV | head -1)
  [ -z "$_pkgtype" ] && git -c advice.detachedHead=false checkout -f "${_tag:?}"
  git describe --tags --long
)

_prepare_libpamac() (
  >&2 echo "Preparing for libpamac..."
  cd "$_pkgsrc_libpamac"
  local _tag=$(git tag | grep -Ev '[A-Za-z]{2}' | sort -rV | head -1)
  [ -z "$_pkgtype" ] && git -c advice.detachedHead=false checkout -f "${_tag:?}"
  git describe --tags --long
)

_prepare_cli() (
  >&2 echo "Preparing for pamac-cli..."
  cd "$_pkgsrc_cli"
  local _tag=$(git tag | grep -Ev '[A-Za-z]{2}' | sort -rV | head -1)
  [ -z "$_pkgtype" ] && git -c advice.detachedHead=false checkout -f "${_tag:?}"
  git describe --tags --long
)

prepare() {
  _prepare_libpamac
  _prepare_pamac
  _prepare_cli

  sed -E \
    -e '/version.*\)$/a '"add_project_arguments(['--vapidir', '$srcdir/fakeinstall/usr/share/vala/vapi'], language: 'vala')" \
    -e '/version.*\)$/a '"add_project_arguments(['--girdir', '$srcdir/fakeinstall/usr/share/gir-1.0'], language: 'vala')" \
    -i "$_pkgsrc_pamac/meson.build" "$_pkgsrc_cli/meson.build"
}

_build_libpamac() (
  local _meson_args=(
    -Denable-appstream=${_build_appstream:-true}
    -Denable-aur=${_build_aur:-true}
    -Denable-flatpak=${_build_flatpak:-true}
    -Denable-snap=${_build_snap:-true}
  )

  arch-meson "$_pkgsrc_libpamac" build_libpamac "${_meson_args[@]}"
  meson compile -C build_libpamac
  meson install -C build_libpamac --destdir "$srcdir/fakeinstall"

  sed -E -e 's&^prefix=.*$&prefix='"$srcdir/fakeinstall/usr&" \
    -i "fakeinstall/usr/lib/pkgconfig/pamac.pc"
)

_build_pamac() (
  local _meson_args=(
    -Denable-fake-gnome-software=false
  )

  arch-meson "$_pkgsrc_pamac" build_pamac "${_meson_args[@]}"
  meson compile -C build_pamac
)

_build_cli() (
  arch-meson "$_pkgsrc_cli" build_cli
  meson compile -C build_cli
)

build() (
  export PKG_CONFIG_PATH="$srcdir/fakeinstall/usr/lib/pkgconfig:$PKG_CONFIG_PATH"
  _build_libpamac
  _build_pamac
  _build_cli
)

package() {
  pkgdesc+=" - library, gui, cli"
  depends=(
    "${_depends_libpamac[@]}"
    "${_depends_pamac[@]}"
    "${_depends_tray_gtk[@]}"
  )

  local _pkgver_libpamac=$(git -C "$_pkgsrc_libpamac" describe --tags --abbrev=0)

  provides=(
    "libpamac=${_pkgver_libpamac:-${pkgver%.r*}}"
    "pamac=${pkgver%.r*}"
  )
  conflicts=(
    'libpamac'
    'pamac'
    'pamac-cli'
  )

  backup=('etc/pamac.conf')

  meson install -C build_libpamac --destdir "$pkgdir"
  meson install -C build_pamac --destdir "$pkgdir"
  meson install -C build_cli --destdir "$pkgdir"
}
