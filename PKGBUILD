# Maintainer:  Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Maintainer:  Truocolo <truocolo@aol.com>
# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: Davide Depau <davide@depau.eu>
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Marco Melorio <marco.melorio@protonmail.com>
# Contributor: Bakasura <bakasura@protonmail.ch>
# Contributor: mazharhussain <realmazharhussain@gmail.com>
# Contributor: Herman Rimm <herman_rimm@pm.me>
# Contributor: huyz

_pkgname="libadwaita"
pkgbase="${_pkgname}-git"
pkgname=(
  "${pkgbase}"
  "${_pkgname}-git-docs"
  "${_pkgname}-git-demos")
pkgver=1.5.0+7+ge3497de8
pkgrel=1
pkgdesc="Building blocks for modern adaptive GNOME applications"
_url="https://gitlab.gnome.org/GNOME/${_pkgname}"
url="https://gnome.pages.gitlab.gnome.org/${_pkgname}"
arch=(
  'x86_64'
  'i686'
  'pentium4'
  'arm'
  'aarch64'
  'armv7h')
license=(LGPL)
depends=(
  "gtk4-git")
makedepends=(
  cmake
  git
  meson
  gi-docgen
  sassc
  gobject-introspection
  glib2-devel
  vala)
checkdepends=(
  appstream
  weston)
source=(
  "${_pkgname}::git+${_url}")
sha256sums=(SKIP)

pkgver() {
  cd "${_pkgname}"
  git describe --tags | sed 's/-/+/g'
}

build() {
    arch-meson "${_pkgname}" build -Dgtk_doc=true
    meson compile -C build
}

check() {
  bash -c ' \
  export XDG_RUNTIME_DIR="$PWD/runtime-dir" \
         WAYLAND_DISPLAY=wayland-5

  mkdir -p -m 700 "$XDG_RUNTIME_DIR"
  weston --backend=headless-backend.so \
         --socket=$WAYLAND_DISPLAY \
         --idle-time=0 &
  _w=$!

  trap "kill ${_w}; wait" EXIT

  meson \
    test \
      -C build \
      --print-errorlogs
  '
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir \
      -p \
      --ignore-fail-on-non-empty \
      "$(dirname "$f")"
  done
}

package_libadwaita-git() {
  depends+=(
    "libgtk-4.so")
  provides+=(
    "${_pkgname}=${pkgver}" libadwaita-1.so)
  conflicts=(
    "${_pkgname}")

  meson \
    install \
      -C build \
      --destdir \
        "${pkgdir}"

  cd \
    "${pkgdir}"

  _pick \
    docs \
    usr/share/doc

  _pick \
    demo \
    usr/bin/adwaita-1-demo
  _pick \
    demo \
    usr/share/applications/org.gnome.Adwaita1.Demo.desktop
  _pick \
    demo \
    usr/share/icons/hicolor/*/apps/org.gnome.Adwaita1.Demo[-.]*
  _pick \
    demo \
    usr/share/metainfo/org.gnome.Adwaita1.Demo.metainfo.xml
}

package_libadwaita-git-docs() {
  pkgdesc+=" (documentation)"
  depends=()
  mv \
    docs/* \
    "${pkgdir}"
}

package_libadwaita-git-demos() {
  pkgdesc+=" (demo applications)"
  provides=(
    "${_pkgname}-demos=${pkgver}")
  depends=(
    "${_pkgname}-git")
  mv \
    demo/* \
    "${pkgdir}"
}

# vim:set sw=2 et:
