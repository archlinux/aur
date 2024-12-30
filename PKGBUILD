# Maintainer: Aleksi Gaevsky (ukrcherry) <aleksi.eesti@gmail.com>

_pkgname=gnome-builder
pkgname="${_pkgname}-git"
pkgver=47.1+83+g5e7d3060b
pkgrel=1
pkgdesc='An IDE for writing GNOME-based software'
arch=(
  x86_64
  i686
  pentium4
  aarch64
  armv7h
)
url=https://wiki.gnome.org/Apps/Builder
license=(GPL3)
depends=(
  autoconf-archive
  clang
  cmark
  ctags
  d-spy
  desktop-file-utils
  devhelp
  editorconfig-core-c
  flatpak-builder
  gjs
  glib2
  gtksourceview5
  jsonrpc-glib
  libadwaita
  libdex
  libgit2-glib
  libpanel
  libpeas
  libportal-gtk4
  meson
  python-gobject
  python-lxml
  python-sphinx
  sysprof
  template-glib
  vala
  vte4
  webkitgtk-6.0
)
makedepends=(
  appstream-glib
  git
  gobject-introspection
  llvm
  mm-common
  python-lsp-server
  python-sphinx_rtd_theme
  yelp-tools
)
checkdepends=(weston)
optdepends=(
  'gnome-code-assistance: Legacy assistance services'
  'python-lxml: documentation support for Python auto-completion')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
groups=(gnome-extra gnome-extra-git)
source=("git+https://gitlab.gnome.org/GNOME/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --tags | sed 's/^GNOME_BUILDER_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd "${_pkgname}"
}

build() {
  local meson_options=(
    --buildtype debugoptimized
    -D docs=true
    -D help=true
    -D plugin_editorconfig=true
  )
  arch-meson "${_pkgname}" build "${meson_options[@]}"
  meson compile -C build
}

check() (
  export XDG_RUNTIME_DIR="$PWD/runtime-dir" WAYLAND_DISPLAY=wayland-5

  mkdir -p -m 700 "$XDG_RUNTIME_DIR"
  weston --backend=headless-backend.so --socket=$WAYLAND_DISPLAY --idle-time=0 &
  _w=$!

  trap "kill $_w; wait" EXIT

  #dbus-run-session meson test -C build --print-errorlogs
)

package() {
  depends+=(libgit2.so)
  optdepends=(
    'bash-language-server: Shell code assistance'
    'python-lsp-server: Python code assistance'
  )
  groups=(
    gnome-extra
    gnome-extra-git
  )
  meson install -C build --destdir "${pkgdir}"
}

# vim:set ts=2 sw=2 et:

