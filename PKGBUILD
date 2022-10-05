# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_pkgbase=gnome-desktop
pkgbase="${_pkgbase}-git"
pkgname=("${_pkgbase}-common-git"
         "${_pkgbase}-git"
         "${_pkgbase}-4-git")
pkgver=43+2+gc564dd8a
pkgrel=1
pkgdesc="Library with common API for various GNOME modules"
epoch=1
url="https://gitlab.gnome.org/GNOME/${_pkgbase}"
arch=(x86_64)
license=(GPL LGPL)
makedepends=('gobject-introspection-git'
             'git'
             'meson'
             'gtk-doc'
             'yelp-tools')
checkdepends=(xorg-server-xvfb)
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "${_pkgbase}" || exit
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson ${_pkgbase} build \
    -D gtk_doc=true \
    -D debug_tools=false \
    -D legacy_library=true \
    -D build_gtk4=true
  meson compile -C build
}

check() {
  dbus-run-session xvfb-run -s '-nolisten local' \
    meson test -C build --print-errorlogs
}

# shellcheck disable=SC2154
# shellcheck disable=SC2295
_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_gnome-desktop-common-git() {
  pkgdesc+=" (common files)"
  depends=(gsettings-desktop-schemas
           xkeyboard-config
           iso-codes
           libseccomp
           bubblewrap
           systemd
           libxkbcommon)
  provides=("${_pkgbase}-common")
  conflicts=("${_pkgbase}-common")

  meson install -C build --destdir "$pkgdir"

  cd "${pkgdir}" || exit

  _pick gtk3 usr/include/gnome-desktop-3.0
  _pick gtk3 usr/lib/libgnome-desktop-3.so*
  _pick gtk3 usr/lib/pkgconfig/gnome-desktop-3.0.pc
  _pick gtk3 usr/lib/girepository-1.0/GnomeDesktop-3.0.typelib
  _pick gtk3 usr/share/gir-1.0/GnomeDesktop-3.0.gir

  _pick gtk4 usr/include/gnome-desktop-4.0
  _pick gtk4 usr/lib/libgnome-*-4.so*
  _pick gtk4 usr/lib/pkgconfig/gnome-*-4.pc
  _pick gtk4 usr/lib/girepository-1.0/Gnome*-4.0.typelib
  _pick gtk4 usr/share/gir-1.0/Gnome*-4.0.gir
}

package_gnome-desktop-git() {
  pkgdesc+=" (GTK3)"
  depends=("${_pkgbase}-common-git=${epoch}:${pkgver}-${pkgrel}"
           gtk3)
  provides=("lib${_pkgbase}-3.so"
            "${_pkgbase}")
  conflicts=("${_pkgbase}")
  mv gtk3/* "$pkgdir"
}

package_gnome-desktop-4-git() {
  pkgdesc+=" (GTK4)"
  depends=("${_pkgbase}-common-git=${epoch}:${pkgver}-${pkgrel}"
           "gtk4")
  provides=(libgnome-{bg,desktop,rr}-4.so
            "${_pkgbase}-4")

  mv gtk4/* "$pkgdir"
}

# vim:set sw=2 et:
